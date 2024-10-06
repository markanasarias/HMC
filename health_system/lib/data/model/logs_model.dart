class LogsModel {
  final String log_id;
  final String user_id;
  final String fullname;
  final String action;
  final String created_at;
  LogsModel(
      this.log_id,
      this.user_id,
      this.fullname,
      this.action,
      this.created_at,);
  factory LogsModel.fromJson(Map<String, dynamic> json) {
    return LogsModel(
      json['log_id'],
      json['user_id'],
      json['fullname'],
      json['action'],
      json['created_at'],           
    );
  }
}