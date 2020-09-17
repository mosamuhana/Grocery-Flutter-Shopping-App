import 'dart:convert';

class User {
  final int id;
  final String fullName;
  final String email;
  final String password;

  User({
    this.id,
    this.fullName,
    this.email,
    this.password,
  });

  User copyWith({
    int id,
    String fullName,
    String email,
    String password,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      id: map['id']?.toInt(),
      fullName: map['fullName'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory User.fromJson(String source) => source == null ? null : User.fromMap(jsonDecode(source));

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User && o.id == id && o.fullName == fullName && o.email == email && o.password == password;
  }

  @override
  int get hashCode {
    return (id?.hashCode ?? 0) ^ (fullName?.hashCode ?? 0) ^ (email?.hashCode ?? 0) ^ (password?.hashCode ?? 0);
  }

  static List<User> fromJsonList(String source) {
    if (source != null) {
      try {
        var data = jsonDecode(source);
        if (data is List) {
          return data.map((e) => User.fromMap(e)).where((e) => e != null).toList();
        }
      } catch (e) {}
    }
    return [];
  }

  static String toJsonList(List<User> data) {
    if (data == null) return null;
    return jsonEncode(data.map((user) => user.toMap()).toList());
  }
}
