class CheckInResponseModel {
  String name;
  String flatNo;
  int phoneNo;
  String reasonOfVisit;
  String vehicleNo;

  CheckInResponseModel(
      {this.name,
      this.flatNo,
      this.phoneNo,
      this.reasonOfVisit,
      this.vehicleNo});

  factory CheckInResponseModel.fromJson(Map<String, dynamic> json) {
    return CheckInResponseModel(
      name: json["name"] != null ? json["name"] : "",
      flatNo: json["flatNo"] != null ? json["flatNo"] : "",
      // phoneNo:
      //     json=["phoneNo"] != null ? json["name"] : null,
      reasonOfVisit:
          json["reasonOfVisit"] != null ? json = json["isResident"] : "",
      // vehicleNo: json["vehicleNo"] != null ? json["vehicleNo"] : "",
    );
  }
}

class CheckInRequestModel {
  String name;
  String flatNo;
  int phoneNo;
  String reasonOfVisit;
  String vehicleNo;

  CheckInRequestModel({
    this.name,
    this.flatNo,
    this.phoneNo,
    this.reasonOfVisit,
    this.vehicleNo,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name.trim(),
      'flatNo': flatNo.trim(),
      'reasonOfVisit': reasonOfVisit.trim(),
      'vehicleNo': vehicleNo.trim(),
    };

    return map;
  }
}
