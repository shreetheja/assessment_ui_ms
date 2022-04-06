import 'dart:convert';

class UserInfo {
  final String uid;
  final String name;
  final String mail;
  UserInfo({
    required this.uid,
    required this.name,
    required this.mail,
  });

  UserInfo copyWith({
    String? uid,
    String? name,
    String? mail,
  }) {
    return UserInfo(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      mail: mail ?? this.mail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'mail': mail,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      mail: map['mail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) => UserInfo.fromMap(json.decode(source));

  @override
  String toString() => 'UserInfo(uid: $uid, name: $name, mail: $mail)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserInfo &&
      other.uid == uid &&
      other.name == name &&
      other.mail == mail;
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode ^ mail.hashCode;
}