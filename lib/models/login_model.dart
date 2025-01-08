class LoginModel {
  bool success;
  String message;
  UserLoginData data;

  LoginModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(json) {
    return LoginModel(
      success: json['success'],
      message: json['message'],
      data: UserLoginData.fromJson(
        json['data'],
      ),
    );
  }
}

class UserLoginData {
  UserInfo userInfo;

  UserLoginData({
    required this.userInfo,
  });

  factory UserLoginData.fromJson(json) {
    return UserLoginData(
      userInfo: UserInfo.fromJson(
        json['userInfo'],
      ),
    );
  }
}

class UserInfo {
  String sessionId;
  String userId;
  String contactId;

  UserInfo({
    required this.sessionId,
    required this.userId,
    required this.contactId,
  });

  factory UserInfo.fromJson(json) {
    return UserInfo(
      sessionId: json['sessionId'],
      userId: json['userId'],
      contactId: json['contactId'],
    );
  }
}
