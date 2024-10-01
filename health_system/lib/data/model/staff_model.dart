class StaffModel {
  final String staff_id;
  final String fullname;
  final String role;
  final String position;
  final String phone_number;
  final String email;
  final String address;
  final String hire_date;
  final String image;
  final String createby;
  final String createddate;

  StaffModel(
      this.staff_id,
      this.fullname,
      this.role,
      this.position,
      this.phone_number,
      this.email,
      this.address,
      this.hire_date,
      this.image,
      this.createby,
      this.createddate,);
  factory StaffModel.fromJson(Map<String, dynamic> json) {
    return StaffModel(
      json['staff_id'],
      json['fullname'],
      json['role'],
      json['position'],
      json['phone_number'],
      json['email'],
      json['address'],
      json['hire_date'],
      json['image'],
      json['createby'],
      json['createddate'],            
    );
  }
}