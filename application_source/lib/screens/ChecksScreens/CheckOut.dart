import 'package:flutter/material.dart';
import 'package:mp_security_systems/api/api_service.dart';
import 'package:mp_security_systems/model/Check-In.dart';

class CheckOut extends StatefulWidget {
  @override
  CheckOutState createState() => CheckOutState();
}

var arr = ["example1", "example2", "example3"];

class CheckOutState extends State<CheckOut> {
  APIService apiService = new APIService();
  final _biggerFont = const TextStyle(fontSize: 18.0);
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
        body: FutureBuilder(
            future: apiService.getVisits(),
            initialData: List(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return snapshot.hasData
                  ? new ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemCount: snapshot.data.body.length,
                      itemBuilder: (context, i) {
                        return _buildRow(snapshot.data.body[i]);
                      },
                    )
                  : Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
            }));
  }

  Widget _buildRow(fruit) {
    return new ListTile(
      title: new Text(fruit.name, style: _biggerFont),
    );
  }
}
