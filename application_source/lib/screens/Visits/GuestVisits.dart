import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mp_security_systems/api/api_service.dart';
import 'package:mp_security_systems/screens/ChecksScreens/ExpiredVisits.dart';

import '../Dashboard.dart';

class GuestVisits extends StatelessWidget {
  final String flatNo;
  GuestVisits(this.flatNo);

  List notifications = [];
  var timer;

  @override
  Widget build(BuildContext context) {
    APIService apiService = new APIService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Accept Visits'),
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
                    if (snapshot.data[i]["isGuest"] == false) {
                      return Container();
                    } else {
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
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  child: Column(
                                    children: [
                                      Text(
                                          "Visitor ${snapshot.data[i]["name"]} ?"),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 40.0,
                                            color: Colors.red,
                                            alignment: Alignment.center,
                                            child: FlatButton(
                                              onPressed: () {
                                                APIService apiService =
                                                    new APIService();
                                                apiService
                                                    .rejectVisit(
                                                        snapshot.data[i]["_id"])
                                                    .then((value) {
                                                  Navigator.of(context)
                                                      .pop(context);
                                                });
                                              },
                                              child: Text(
                                                "Reject",
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
                                                    .confirmVisit(
                                                        snapshot.data[i]["_id"])
                                                    .then((value) {
                                                  Navigator.of(context)
                                                      .pop(context);
                                                });
                                              },
                                              child: Text(
                                                "Accept",
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
                              barrierDismissible: true,
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
                    }
                  }),
            );
          }
        },
        future: apiService.getResidentVisits(flatNo),
      ),
    );
  }
}
