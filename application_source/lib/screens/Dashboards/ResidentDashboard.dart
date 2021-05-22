import 'package:flutter/material.dart';
import 'package:mp_security_systems/screens/Visits/AcceptVisits.dart';
import 'package:mp_security_systems/screens/Visits/GuestVisits.dart';

class ResidentDashboard extends StatelessWidget {
  final String flatNo;

  ResidentDashboard(this.flatNo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resident Dashboard")),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
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
                  height: 125,
                  minWidth: 200,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AcceptVisits(this.flatNo)));
                  },
                  child: Text(
                    "Accept Visits",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.blue[600],
                child: FlatButton(
                  height: 125,
                  minWidth: 200,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GuestVisits(this.flatNo)));
                  },
                  child: Text(
                    "Guests",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.blue[600],
                child: FlatButton(
                  height: 125,
                  minWidth: 200,
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => CheckIn()));
                  },
                  child: Text(
                    "Expectants",
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
