class DoctorModel {
  final String doctor_id;
  final String fullname;
  final String specialization;
  final String phone_number;
  final String email;
  final String address;
  final String years_of_experience;
  final String medical_license_number;
  final String image;
  final String createby;
  final String createddate;

  DoctorModel(
      this.doctor_id,
      this.fullname,
      this.specialization,
      this.phone_number,
      this.email,
      this.address,
      this.years_of_experience,
      this.medical_license_number,
      this.image,
      this.createby,
      this.createddate,);
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      json['doctor_id'],
      json['fullname'],
      json['specialization'],
      json['phone_number'],
      json['email'],
      json['address'],
      json['years_of_experience'],
      json['medical_license_number'],
      json['image'],
      json['createby'],
      json['createddate'],            
    );
  }
}