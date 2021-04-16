import 'package:flutter/material.dart';
import 'package:mp_security_systems/api/api_service.dart';
import 'package:mp_security_systems/model/Check-In.dart';

class CheckIn extends StatefulWidget {
  @override
  CheckInState createState() => CheckInState();
}

class CheckInState extends State<CheckIn> {
  CheckInRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new CheckInRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check-In')),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height / 1,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      initialValue: '',
                      maxLength: 20,
                      decoration: InputDecoration(
                        icon: Icon(Icons.label_important),
                        labelText: 'NAME',
                        labelStyle: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                        helperText: 'name',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6200EE)),
                        ),
                      ),
                      onChanged: (value) {
                        requestModel.name = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    child: TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      initialValue: '',
                      maxLength: 20,
                      decoration: InputDecoration(
                        icon: Icon(Icons.label_important),
                        labelText: 'PHONE-NO',
                        labelStyle: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                        helperText: 'phone no',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6200EE)),
                        ),
                      ),
                      onChanged: (value) {
                        requestModel.phoneNo = value as int;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    child: TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      initialValue: '',
                      maxLength: 20,
                      decoration: InputDecoration(
                        icon: Icon(Icons.label_important),
                        labelText: 'FLAT-NO',
                        labelStyle: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                        helperText: 'flat no',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6200EE)),
                        ),
                      ),
                      onChanged: (value) {
                        requestModel.flatNo = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    child: TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      initialValue: '',
                      maxLength: 20,
                      decoration: InputDecoration(
                        icon: Icon(Icons.label_important),
                        labelText: 'VEHICLE NO',
                        labelStyle: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                        helperText: 'vehicle no',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6200EE)),
                        ),
                      ),
                      onChanged: (value) {
                        requestModel.vehicleNo = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    child: TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      initialValue: '',
                      maxLength: 20,
                      decoration: InputDecoration(
                        icon: Icon(Icons.label_important),
                        labelText: 'REASON OF VISIT',
                        labelStyle: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                        helperText: 'reason of visit',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6200EE)),
                        ),
                      ),
                      onChanged: (value) {
                        requestModel.reasonOfVisit = value;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 250.0,
                  ),
                  Material(
                    elevation: 20.0,
                    color: Colors.green[300],
                    child: FlatButton(
                      height: 40,
                      minWidth: 100,
                      onPressed: () {
                        print(requestModel.toJson());

                        APIService apiService = new APIService();
                        print("REQ");
                        apiService
                            .addVisit(requestModel)
                            .then((value) => {print(value)});
                      },
                      child: Center(
                        child: Text(
                          "NEXT",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
