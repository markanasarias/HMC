class CenterModel {
  final String branch_id;
  final String branch_name;
  final String address;
  final String createby;
  final String createddate;
  final String status;
  final double latitude;
  final double longitude;
  CenterModel(
    this.branch_id,
    this.branch_name,
    this.address,
    this.createby,
    this.createddate,
    this.status,
    this.latitude,
    this.longitude,
  );
  factory CenterModel.fromJson(Map<String, dynamic> json) {
    return CenterModel(
      json['branch_id'],
      json['branch_name'],
      json['address'],
      json['createby'],
      json['createddate'],
      json['status'],
      json['latitude'],
      json['longitude'],
    );
  }
}
