import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mp_security_systems/api/api_service.dart';
import 'package:mp_security_systems/screens/ChecksScreens/ExpiredVisits.dart';

import '../Dashboard.dart';

class AlertScreen extends StatefulWidget {
  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  List notifications = [];

  Future<List> getData() async {
    var res = await http
        .get("https://3690b00ada8d.ngrok.io/api/visits/?query=warning");
    return json.decode(res.body);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALERTS'),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "ERR",
              ),
            );
          } else {
            print(snapshot.data);
            return Center(
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.all(12.0),
                      color: snapshot.data[i]["warningReason"] == "RESIDENT"
                          ? Colors.red[400]
                          : Colors.cyan[700],
                      child: FlatButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height / 8,
                                child: Column(
                                  children: [
                                    Text(
                                        "Check out ${snapshot.data[i]["name"]} ?"),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 40.0,
                                          color: Colors.red,
                                          alignment: Alignment.center,
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(context);
                                            },
                                            child: Text(
                                              "No",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Container(
                                          height: 40.0,
                                          color: Colors.green,
                                          alignment: Alignment.center,
                                          child: FlatButton(
                                            onPressed: () {
                                              APIService apiService =
                                                  new APIService();
                                              apiService
                                                  .checkOut(
                                                      snapshot.data[i]["_id"])
                                                  .then((value) {
                                                Navigator.of(context)
                                                    .pop(context);
                                              });
                                            },
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            barrierDismissible: false,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5.0, top: 5.0),
                              color: Colors.grey[700],
                              child: Text(
                                snapshot.data[i]["warningReason"] == "RESIDENT"
                                    ? " RESIDENT"
                                    : "Security",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Name : " + snapshot.data[i]["name"],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Check in : " +
                                        snapshot.data[i]["createdAt"]
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Flat No: " +
                                        snapshot.data[i]["flatNo"].toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Vehicle No : " +
                                        snapshot.data[i]["vehicleNo"]
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
        },
        future: getData(),
      ),
    );
  }
}
