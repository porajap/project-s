class LoggedModel {
  LoggedModel({
      this.error, 
      this.message, 
      this.accessToken, 
      this.user,});

  LoggedModel.fromJson(dynamic json) {
    error = json['error'];
    message = json['message'];
    accessToken = json['accessToken'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? error;
  String? message;
  String? accessToken;
  User? user;
LoggedModel copyWith({  bool? error,
  String? message,
  String? accessToken,
  User? user,
}) => LoggedModel(  error: error ?? this.error,
  message: message ?? this.message,
  accessToken: accessToken ?? this.accessToken,
  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['message'] = message;
    map['accessToken'] = accessToken;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.mobileNo, 
      this.password, 
      this.thFrist, 
      this.thLast, 
      this.hnCode,});

  User.fromJson(dynamic json) {
    id = json['ID'];
    mobileNo = json['MobileNo'];
    password = json['password'];
    thFrist = json['ThFrist'];
    thLast = json['ThLast'];
    hnCode = json['HnCode'];
  }
  num? id;
  String? mobileNo;
  String? password;
  String? thFrist;
  String? thLast;
  String? hnCode;
User copyWith({  num? id,
  String? mobileNo,
  String? password,
  String? thFrist,
  String? thLast,
  String? hnCode,
}) => User(  id: id ?? this.id,
  mobileNo: mobileNo ?? this.mobileNo,
  password: password ?? this.password,
  thFrist: thFrist ?? this.thFrist,
  thLast: thLast ?? this.thLast,
  hnCode: hnCode ?? this.hnCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['MobileNo'] = mobileNo;
    map['password'] = password;
    map['ThFrist'] = thFrist;
    map['ThLast'] = thLast;
    map['HnCode'] = hnCode;
    return map;
  }

}