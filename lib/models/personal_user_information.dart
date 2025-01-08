class PersonalUserInformation {
  bool success;
  String message;
  UserData userData;

  PersonalUserInformation({
    required this.success,
    required this.message,
    required this.userData,
  });

  factory PersonalUserInformation.fromJson({required json}) {
    return PersonalUserInformation(
      success: json['success'],
      message: json['message'],
      userData: UserData.fromJson(
        json: json['userData'],
      ),
    );
  }
}

class UserData {
  String birthdate;
  String mobilePhone;
  String centerName;
  String arabicName;
  String name;
  String id;

  UserData({
    required this.birthdate,
    required this.mobilePhone,
    required this.centerName,
    required this.arabicName,
    required this.name,
    required this.id,
  });

  factory UserData.fromJson({json}) {
    return UserData(
      birthdate: json['birthdate'],
      mobilePhone: json['mobilePhone'],
      centerName: json['centerName'],
      arabicName: json['arabicName'],
      name: json['name'],
      id: json['id'],
    );
  }
}
