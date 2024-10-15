class StaffModel {
  final String id;
  final String type;
  final String fullname;
  final String position;
  final String specialization;
  final String phone_number;
  final String email;
  final String address;
  final String hire_date;
  final String years_of_experience;
  final String medical_license_number;
  final String image;
  final String createby;
  final String createddate;
  final String status;
  final String center;
  StaffModel(
    this.id,
    this.type,
    this.fullname,
    this.position,
    this.specialization,
    this.phone_number,
    this.email,
    this.address,
    this.hire_date,
    this.years_of_experience,
    this.medical_license_number,
    this.image,
    this.createby,
    this.createddate,
    this.status,
    this.center,
  );
  factory StaffModel.fromJson(Map<String, dynamic> json) {
    return StaffModel(
      json['id'],
      json['type'],
      json['fullname'],
      json['position'],
      json['specialization'],
      json['phone_number'],
      json['email'],
      json['address'],
      json['hire_date'],
      json['years_of_experience'],
      json['medical_license_number'],
      json['image'],
      json['createby'],
      json['createddate'],
      json['status'],
      json['center'],
    );
  }
}

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
