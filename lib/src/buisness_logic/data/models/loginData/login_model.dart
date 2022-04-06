import 'dart:convert';



import 'assessment_info.dart';
import 'user_info.dart';

class LoginData {
  final UserInfo userInfo;
  final AssessmentInfo assessmentInfo;
  LoginData({
    required this.userInfo,
    required this.assessmentInfo,
  });

  LoginData copyWith({
    UserInfo? userInfo,
    AssessmentInfo? assessmentInfo,
  }) {
    return LoginData(
      userInfo: userInfo ?? this.userInfo,
      assessmentInfo: assessmentInfo ?? this.assessmentInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userInfo': userInfo.toMap(),
      'assessmentInfo': assessmentInfo.toMap(),
    };
  }

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      userInfo: UserInfo.fromMap(map['data']['userInfo']),
      assessmentInfo: AssessmentInfo.fromMap(map['data']['assessmentInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginData.fromJson(String source) => LoginData.fromMap(json.decode(source));

  @override
  String toString() => 'LoginData(userInfo: $userInfo, assessmentInfo: $assessmentInfo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginData &&
      other.userInfo == userInfo &&
      other.assessmentInfo == assessmentInfo;
  }

  @override
  int get hashCode => userInfo.hashCode ^ assessmentInfo.hashCode;
}