import 'package:flutter/material.dart';
import 'package:mp_security_systems/screens/ChecksScreens/CheckIn.dart';
import 'package:mp_security_systems/screens/ChecksScreens/CheckOut.dart';

class SecurityDashboard extends StatefulWidget {
  @override
  _SecurityDashboardState createState() => _SecurityDashboardState();
}

class _SecurityDashboardState extends State<SecurityDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Security Dashboard")),
      body: Container(
        color: Colors.blue[50],
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.blue[600],
                    child: FlatButton(
                      height: 125,
                      minWidth: 125,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CheckIn()));
                      },
                      child: Text(
                        "Check-IN",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 17.0,
                  ),
                  Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.blue[600],
                    child: FlatButton(
                      height: 125,
                      minWidth: 125,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckOut()));
                      },
                      child: Text(
                        "CheckOut",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.blue[600],
                child: FlatButton(
                  height: 125,
                  minWidth: 125,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckOut()));
                  },
                  child: Text(
                    "Dashboard",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Material(
              //       elevation: 10.0,
              //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
              //       color: Colors.blue[600],
              //       child: FlatButton(
              //         height: 125,
              //         minWidth: 125,
              //         onPressed: () {},
              //         child: Text(
              //           "Dashboard",
              //           style: TextStyle(
              //               fontSize: 25.0,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 10.0,
              //     ),
              //     Material(
              //       elevation: 10.0,
              //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
              //       color: Colors.blue[600],
              //       child: FlatButton(
              //         height: 125,
              //         minWidth: 125,
              //         onPressed: () {},
              //         child: Text(
              //           "Dashboard",
              //           style: TextStyle(
              //               fontSize: 25.0,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 10.0,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Material(
              //       elevation: 10.0,
              //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
              //       color: Colors.blue[600],
              //       child: FlatButton(
              //         height: 125,
              //         minWidth: 125,
              //         onPressed: () {},
              //         child: Text(
              //           "Dashboard",
              //           style: TextStyle(
              //               fontSize: 25.0,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 10.0,
              //     ),
              //     Material(
              //       elevation: 10.0,
              //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
              //       color: Colors.blue[600],
              //       child: FlatButton(
              //         height: 125,
              //         minWidth: 125,
              //         onPressed: () {},
              //         child: Text(
              //           "Dashboard",
              //           style: TextStyle(
              //               fontSize: 25.0,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
