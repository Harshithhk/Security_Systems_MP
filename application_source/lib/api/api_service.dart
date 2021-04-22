import 'package:http/http.dart' as http;
import 'package:mp_security_systems/model/Check-In.dart';
import 'package:mp_security_systems/model/Check-Out.dart';
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  String url = "https://da1d98476808.ngrok.io/api";
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String requrl = "$url/users/loginResident";

    var response = await http.post(requrl, body: requestModel.toJson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      print('Failed to load data!');
      return null;
    }
  }

  Future<CheckOutResponseModel> getVisits() async {
    String requrl = "$url/visits/";
    var response = await http.get(requrl);

    if (response.statusCode == 200 || response.statusCode == 400) {
      CheckOutResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      print('Failed to create VISIT!');
      return null;
    }
  }

  Future<CheckInResponseModel> addVisit(
      CheckInRequestModel requestModel) async {
    String requrl = "$url/visits/addVisit";

    print("REQUEST");

    var response = await http.post(requrl, body: requestModel.toJson());
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return CheckInResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      print('Failed to create VISIT!');
      return null;
    }
  }

  Future<dynamic> checkOut(id) async {
    String requrl = "$url/visits/checkout";
    var res = await http.post(requrl, body: {'id': id});
    print(res.body);
    return jsonDecode(res.body);
  }

  Future<dynamic> getResidentVisits(flatNo) async {
    String requrl = "$url/visits/?flatNo=$flatNo";
    var res = await http.get(requrl);
    print(res.body);
    return jsonDecode(res.body);
  }

  Future<dynamic> confirmVisit(id) async {
    String requrl = "$url/visits/confirmVisit";
    var res = await http.post(requrl, body: {'id': id});
    print(res.body);
    return jsonDecode(res.body);
  }

  Future<dynamic> rejectVisit(id) async {
    String requrl = "$url/visits/rejectVisit";
    var res = await http.post(requrl, body: {'id': id});
    print(res.body);
    return jsonDecode(res.body);
  }

  Future<dynamic> raiseWarning(id) async {
    String requrl = "$url/visits/rejectVisit";
    var res = await http.post(requrl, body: {'id': id, 'bySecurity': 'true'});
    print(res.body);
    return jsonDecode(res.body);
  }
}
