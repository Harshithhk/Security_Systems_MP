import 'package:flutter/material.dart';
import 'package:mp_security_systems/api/api_service.dart';

class ExpiredVisits extends StatelessWidget {
  final List expiredVisits;
  ExpiredVisits(this.expiredVisits);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timed Out Visits'),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: expiredVisits.length,
              itemBuilder: (context, i) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(12.0),
                  color: Colors.cyan[700],
                  child: FlatButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Check out ${expiredVisits[i]["name"]} ?"),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40.0,
                                      color: Colors.grey,
                                      alignment: Alignment.center,
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(context);
                                        },
                                        child: Text(
                                          "No",
                                          style: TextStyle(color: Colors.white),
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
                                              .checkOut(expiredVisits[i]["_id"])
                                              .then((value) {
                                            Navigator.of(context).pop(context);
                                          });
                                        },
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  // width: 50.0,
                                  color: Colors.red,
                                  child: FlatButton(
                                    onPressed: () {
                                      APIService apiService = new APIService();
                                      apiService.raiseWarning(
                                          expiredVisits[i]["_id"]);
                                    },
                                    child: Text(
                                      "Raise Warning",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
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
                            "Name : " + expiredVisits[i]["name"],
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Check in : " +
                                expiredVisits[i]["createdAt"].toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Flat No: " + expiredVisits[i]["flatNo"].toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Vehicle No : " +
                                expiredVisits[i]["vehicleNo"].toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
