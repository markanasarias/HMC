class CenterModel {
  final String branch_id;
  final String branch_name;
  final String address;
  final String createby;
  final String createddate;
  final String status;
  CenterModel(
      this.branch_id,
      this.branch_name,
      this.address,
      this.createby,
      this.createddate,
      this.status,);
  factory CenterModel.fromJson(Map<String, dynamic> json) {
    return CenterModel(
      json['branch_id'],
      json['branch_name'],
      json['address'],
      json['createby'],
      json['createddate'],
      json['status'],             
    );
  }
}