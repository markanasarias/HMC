class AppointmentModel {
  final int appointment_id;
  final int staff_id;
  final String staff_fullname;
  final int requestedby;
  final String requestedby_fullname;
  final String purpose;
  final String startdate;
  final String enddate;
  final String status;
  final String created_by;
  final String created_date;

  AppointmentModel(
      this.appointment_id,
      this.staff_id,
      this.staff_fullname,
      this.requestedby,
       this.requestedby_fullname,
      this.purpose,
      this.startdate,
      this.enddate,
      this.status,
      this.created_by,
      this.created_date);
  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      json['appointment_id'],
      json['staff_id'],
      json['staff_fullname'],
      json['requestedby'],
      json['requestedby_fullname'],
      json['purpose'],
      json['startdate'],
      json['enddate'],
      json['createby'],
      json['created_by'],  
      json['created_date'],            
    );
  }
}