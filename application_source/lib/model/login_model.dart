class LoginResponseModel {
  final String token;
  final String error;
  final String name;
  final bool isResident;

  LoginResponseModel({this.token, this.error, this.name, this.isResident});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    print(json["token"]);
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
      name: json["user"]["name"] != null ? json["user"]["name"] : "",
      isResident: json["user"]["isResident"] != null
          ? json["user"]["isResident"]
          : null,
    );
  }
}

class LoginRequestModel {
  String flatNo;
  String password;

  LoginRequestModel({
    this.flatNo,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'flatNo': flatNo.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
