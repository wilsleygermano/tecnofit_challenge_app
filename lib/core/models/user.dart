import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.token,
  });
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  final String token;

  String get fullName => '$firstName $lastName';

  User copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
      token: token ?? this.token,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      avatar: json['avatar'] ?? '',
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.avatar == avatar &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        avatar.hashCode ^
        token.hashCode;
  }

  @override
  List<Object> get props {
    return [id, email, firstName, lastName, avatar, token];
  }
}
