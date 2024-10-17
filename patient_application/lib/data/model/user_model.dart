class PatientModel {
  final String patient_id;
  final String first_name;
  final String last_name;
  final String middle_name;
  final String age;
  final String date_of_birth;
  final String birth_place;
  final String gender;
  final String civil_status;
  final String nationality;
  final String religion;
  final String occupation;
  final String phone_number;
  final String email;
  final String address;
  final String emergency_contact_name;
  final String emergency_contact_phone;
  final String blood_type;
  final String philhealth_number;
  final String allergies;
  final String status;
  final String createdBy;
  final String createdDate;

  PatientModel(
      this.patient_id,
      this.first_name,
      this.last_name,
      this.middle_name,
      this.age,
      this.date_of_birth,
      this.birth_place,
      this.gender,
      this.civil_status,
      this.nationality,
      this.religion,
      this.occupation,
      this.phone_number,
      this.email,
      this.address,
      this.emergency_contact_name,
      this.emergency_contact_phone,
      this.blood_type,
      this.philhealth_number,
      this.allergies,
      this.status,
      this.createdBy,
      this.createdDate);
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      json['patient_id'],
      json['first_name'],
      json['last_name'],
      json['middle_name'],
      json['age'],
      json['date_of_birth'],
      json['birth_place'],
      json['gender'],
      json['civil_status'],
      json['nationality'],
      json['religion'],
      json['occupation'],
      json['phone_number'],
      json['email'],
      json['address'],
      json['emergency_contact_name'],
      json['emergency_contact_phone'],
      json['blood_type'],
      json['philhealth_number'],
      json['allergies'],
      json['status'],
      json['createdBy'],
      json['createdDate'],
    );
  }
}
