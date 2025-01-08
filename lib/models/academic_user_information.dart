class AcademicUserInformation {
  bool success;
  String message;
  UserAcademicData userAcademicData;

  AcademicUserInformation({
    required this.success,
    required this.message,
    required this.userAcademicData,
  });

  factory AcademicUserInformation.fromJson({required json}) {
    return AcademicUserInformation(
      success: json['success'],
      message: json['message'],
      userAcademicData: UserAcademicData.fromJson(
        json: json['userAcademicData'],
      ),
    );
  }
}

class UserAcademicData {
  String Starting_Semester__c;
  String Primary_Academic_Program__c;
  String Student_ID__c;
  String Primary_Educational_Institution__c;
  String Cumulative_GPA__c;
  String email;

  UserAcademicData({
    required this.Starting_Semester__c,
    required this.Primary_Academic_Program__c,
    required this.Student_ID__c,
    required this.Primary_Educational_Institution__c,
    required this.Cumulative_GPA__c,
    required this.email,
  });

  factory UserAcademicData.fromJson({json}) {
    return UserAcademicData(
      Starting_Semester__c: json['Starting_Semester__c'],
      Primary_Academic_Program__c: json['Primary_Academic_Program__c'],
      Student_ID__c: json['Student_ID__c'],
      Primary_Educational_Institution__c:
          json['Primary_Educational_Institution__c'],
      Cumulative_GPA__c: json['Cumulative_GPA__c'],
      email: json['email'],
    );
  }
}
