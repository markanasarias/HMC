class ServiceModel {
  final String id;
  final String service_name;
  final String schedule_days;
  final String schedule_time;
  final String status;
  final String created_by;
  final String created_date;
  ServiceModel(
      this.id,
      this.service_name,
      this.schedule_days,
      this.schedule_time,
      this.status,
      this.created_by,
      this.created_date,);
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      json['id'],
      json['service_name'],
      json['schedule_days'],
      json['schedule_time'],
      json['status'],
      json['created_by'],   
      json['created_date'],            
    );
  }
}