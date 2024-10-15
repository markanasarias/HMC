class ScheduleModel {
  final String schedule_id;
  final String staff_id;
  final String work_date;
  final String shift_time;
  final String status;
  final String createby;
  final String createddate;
  final String fullname;
  ScheduleModel(
    this.schedule_id,
    this.staff_id,
    this.work_date,
    this.shift_time,
    this.status,
    this.createby,
    this.createddate,
    this.fullname,
  );
  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      json['schedule_id'],
      json['staff_id'],
      json['work_date'],
      json['shift_time'],
      json['status'],
      json['createby'],
      json['createddate'],
      json['fullname'],
    );
  }
}
