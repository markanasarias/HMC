class RequestAdminModel {
  final String branch_id;
  final String branch_name;
  final String total_requests;
  final String total_requested_quantity;
  final String first_request_date;
  final String last_request_date;
  final String latest_status;
  final String last_requested_by;
  RequestAdminModel(
      this.branch_id,
      this.branch_name,
      this.total_requests,
      this.total_requested_quantity,
      this.first_request_date,
      this.last_request_date,
      this.latest_status,
      this.last_requested_by,);
  factory RequestAdminModel.fromJson(Map<String, dynamic> json) {
    return RequestAdminModel(
      json['branch_id'],
      json['branch_name'],
      json['total_requests'],
      json['total_requested_quantity'],
      json['first_request_date'],
      json['last_request_date'],     
      json['latest_status'], 
      json['last_requested_by'],       
    );
  }
}


class ViewRequestAdminModel {
  final String request_id;
  final String item_id;
  final String item_name;
  final String requested_quantity;
  final String request_date;
  final String status;
  final String requested_by;
  final String branch_id;
  ViewRequestAdminModel(
      this.request_id,
      this.item_id,
      this.item_name,
      this.requested_quantity,
      this.request_date,
      this.status,
      this.requested_by,
      this.branch_id,);
  factory ViewRequestAdminModel.fromJson(Map<String, dynamic> json) {
    return ViewRequestAdminModel(
      json['request_id'],
      json['item_id'],
      json['item_name'],
      json['requested_quantity'],
      json['request_date'],
      json['status'],     
      json['requested_by'], 
      json['branch_id'],       
    );
  }
}