exports.MasterPatients = (data) => {
    let dataResult = [];
  
    data.forEach((item) => {
      dataResult.push({
        id: item.patient_id,
        firstName: item.first_name,
        lastName: item.last_name,
        middleName: item.middle_name,
        age: item.age,
        dateOfBirth: item.date_of_birth,
        birthPlace: item.birth_place,
        gender: item.gender,
        civilStatus: item.civil_status,
        dateOfMarriage: item.date_of_marriage,
        nationality: item.nationality,
        religion: item.religion,
        occupation: item.occupation,
        phoneNumber: item.phone_number,
        email: item.email,
        address: item.address,
        emergencyContactName: item.emergency_contact_name,
        emergencyContactPhone: item.emergency_contact_phone,
        bloodType: item.blood_type,
        philhealthNumber: item.philhealth_number,
        allergies: item.allergies,
        createdBy: item.createby,
        createdDate: item.createddate,
      });
    });
  
    return dataResult;
  };

  exports.MasterDoctor = (data) => {
    let dataResult = [];
  
    data.forEach((item) => {
      dataResult.push({
        doctor_id: item.doctor_id,
        fullname: item.fullname,
        specialization: item.specialization,
        phone_number: item.phone_number,
        email: item.email,
        address: item.address,
        years_of_experience: item.years_of_experience,
        medical_license_number: item.medical_license_number,
        image: item.image,
        createby: item.createby,
        createddate: item.createddate,
      });
    });
  
    return dataResult;
  };

  exports.MasterStaff = (data) => {
    let dataResult = [];
  
    data.forEach((item) => {
      dataResult.push({
        id: item.id,
        type: item.type,
        fullname: item.fullname,
        position: item.position,
        specialization: item.specialization,
        phone_number: item.phone_number,
        email: item.email,
        address: item.address,
        hire_date: item.hire_date,
        years_of_experience: item.years_of_experience,
        medical_license_number: item.medical_license_number,
        image: item.image,
        createby: item.createby,
        createddate: item.createddate,
        status: item.status,
        center: item.center,
      });
    });
  
    return dataResult;
  };
  exports.MasterEvent = (data) => {
    let dataResult = [];
  
    data.forEach((item) => {
      dataResult.push({
        id: item.id,
        name: item.name,
        description: item.description,
        start_time: item.start_time,
        end_time: item.end_time,
        location: item.location,
        createddate: item.createddate,
        createdby: item.createdby,
      });
    });
  
    return dataResult;
  };
  exports.MasterCenter = (data) => {
    let dataResult = [];
  
    data.forEach((item) => {
      dataResult.push({
        branch_id: item.branch_id,
        branch_name: item.branch_name,
        branch_name: item.branch_name,
        start_time: item.start_time,
        end_time: item.end_time,
        location: item.location,
        createddate: item.createddate,
        createdby: item.createdby,
      });
    });
  
    return dataResult;
  };

  exports.MasterUsers = (data) => {
    let dataResult = [];
  
    data.forEach((item) => {
      dataResult.push({
        id: item.id,
        user_id: item.user_id,
        username: item.username,
        password: item.password,
        role: item.role,
        status: item.status,
        createby: item.createby,
        createddate: item.createddate,
      });
    });
  
    return dataResult;
  };
  