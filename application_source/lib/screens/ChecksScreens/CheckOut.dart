import 'package:flutter/material.dart';
import 'package:mp_security_systems/api/api_service.dart';
import 'package:mp_security_systems/model/Check-In.dart';

class CheckOut extends StatefulWidget {
  @override
  CheckOutState createState() => CheckOutState();
}

var arr = ["example1", "example2", "example3"];

class CheckOutState extends State<CheckOut> {
  // CheckOutRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    // requestModel = new CheckOutRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check-OUT')),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height / 1,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text("EXAMPLE LIST ITEM 1 "),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text("EXAMPLE LIST ITEM 2"),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text("EXAMPLE LIST ITEM 3"),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text("EXAMPLE LIST ITEM 4"),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text("EXAMPLE LIST ITEM 5"),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text("EXAMPLE LIST ITEM 6"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
