import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mp_security_systems/api/api_service.dart';
import 'package:mp_security_systems/screens/ChecksScreens/ExpiredVisits.dart';

import '../Dashboard.dart';

class ChecksOut extends StatefulWidget {
  @override
  _ChecksOutState createState() => _ChecksOutState();
}

class _ChecksOutState extends State<ChecksOut> {
  List notifications = [];
  var timer;

  Future<List> getData() async {
    var res = await http.get("https://da1d98476808.ngrok.io/api/visits/");
    return json.decode(res.body);
  }

  Future<void> getExpiredVisits() async {
    var res = await http
        .get("https://da1d98476808.ngrok.io/api/visits/expiredvisits");
    setState(() {
      notifications = json.decode(res.body);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getExpiredVisits();
  }

  @override
  Widget build(BuildContext context) {
    timer = Timer.periodic(new Duration(minutes: 1), (timer) {
      getExpiredVisits();
      debugPrint(timer.tick.toString());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Check-OUT'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExpiredVisits(notifications)));
            },
            child: Container(
              color: Colors.blue[400],
              margin: EdgeInsets.only(right: 15.0),
              child: FlatButton(
                onPressed: () {
                  timer.cancel();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpiredVisits(notifications)));
                },
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.notification_important,
                        color: notifications.length > 0
                            ? Colors.red
                            : Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      '${notifications.length}',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
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
                      color: Colors.cyan[700],
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
                                    snapshot.data[i]["createdAt"].toString(),
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
                                    snapshot.data[i]["vehicleNo"].toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            )
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
