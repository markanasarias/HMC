class PatientModel {
  final String id;
  final String firstName;
  final String lastName;
  final String middleName;
   final String age;
  final String dateOfBirth;
  final String birthPlace;
  final String gender;
  final String civilStatus;
  final String nationality;
  final String religion;
  final String occupation;
  final String phoneNumber;
  final String email;
  final String address;
  final String emergencyContactName;
  final String emergencyContactPhone;
          final String bloodType;
           final String philhealthNumber;
            final String allergies;
             final String createdBy;
              final String createdDate;

  PatientModel(
      this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.age,
      this.dateOfBirth,
      this.birthPlace,
      this.gender,
      this.civilStatus,
      this.nationality,
      this.religion,
      this.occupation,
      this.phoneNumber,
      this.email,
      this.address,
      this.emergencyContactName,
      this.emergencyContactPhone,
      this.bloodType,
      this.philhealthNumber,
      this.allergies,
      this.createdBy,
      this.createdDate);
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      json['id'],
      json['firstName'],
      json['lastName'],
      json['middleName'],
      json['age'],
      json['dateOfBirth'],
      json['birthPlace'],
      json['gender'],
      json['civilStatus'],
      json['nationality'],
       json['religion'],
        json['occupation'],
         json['phoneNumber'],
          json['email'],
           json['address'],
            json['emergencyContactName'],
             json['emergencyContactPhone'],
              json['bloodType'],
               json['philhealthNumber'],
                json['allergies'],
                 json['createdBy'],
                  json['createdDate'],
                 
    );
  }
}

class MedicalRecordModel {
  final String id;
  final String patient_id;
  final String medical_record;
  final String file;
  final String status;
  final String created_by;
  final String created_date;
  final String file_name;
  final String full_name;

  MedicalRecordModel(
      this.id,
      this.patient_id,
      this.medical_record,
      this.file,
      this.status,
      this.created_by,
      this.created_date,
      this.file_name,
      this.full_name,
   );
  factory MedicalRecordModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordModel(
      json['id'],
      json['patient_id'],
      json['medical_record'],
      json['file'],
      json['status'],
      json['created_by'],
      json['created_date'],
      json['file_name'],
      json['full_name'],            
    );
  }
}