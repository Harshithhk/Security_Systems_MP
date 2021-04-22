class CheckOutResponseModel {
  String name;
  String flatNo;
  int phoneNo;
  String reasonOfVisit;
  String vehicleNo;

  CheckOutResponseModel(
      {this.name,
      this.flatNo,
      this.phoneNo,
      this.reasonOfVisit,
      this.vehicleNo});

  static fromJson(json) {
    List visitors = [];
    for (var visitor in json) {
      visitors.add(visitor);
    }
    return visitors;
  }
}
