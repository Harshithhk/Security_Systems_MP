import 'package:flutter/material.dart';
import 'package:mp_security_systems/screens/ChecksScreens/CheckIn.dart';

class ResidentDashboard extends StatefulWidget {
  @override
  _ResidentDashboardState createState() => _ResidentDashboardState();
}

class _ResidentDashboardState extends State<ResidentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resident Dashboard")),
      body: Container(
        color: Colors.blue[50],
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.blue[600],
                child: FlatButton(
                  height: 150,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckIn()));
                  },
                  child: Text(
                    "VISITS",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.blue[600],
                child: FlatButton(
                  height: 150,
                  minWidth: 150,
                  onPressed: () {},
                  child: Text(
                    "EXPECTANTS",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
