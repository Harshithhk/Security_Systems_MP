import 'package:http/http.dart' as http;
import 'package:mp_security_systems/model/Check-In.dart';
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  String url = "http://10.0.2.2:5000/api";
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
}
