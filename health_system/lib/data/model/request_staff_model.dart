class RequestStaffModel {
  final String request_id;
  final String item_id;
  final String item_name;
  final String requested_quantity;
  final String request_date;
  final String status;
  final String requested_by;
  final String branch_id;
  final String branch_name;
  RequestStaffModel(
      this.request_id,
      this.item_id,
      this.item_name,
      this.requested_quantity,
      this.request_date,
      this.status,
      this.requested_by,
      this.branch_id,
      this.branch_name,);
  factory RequestStaffModel.fromJson(Map<String, dynamic> json) {
    return RequestStaffModel(
      json['request_id'],
      json['item_id'],
      json['item_name'],
      json['requested_quantity'],
      json['request_date'],
      json['status'],     
      json['requested_by'], 
      json['branch_id'], 
      json['branch_name'],         
    );
  }
}