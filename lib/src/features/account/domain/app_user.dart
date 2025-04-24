/// Simple class representing the user UID and email.
class AppUser {
  const AppUser({
    required this.email,
    required this.password
  });
  final String email;
  final String password;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser && other.password == password && other.email == email;
  }

  @override
  int get hashCode => password.hashCode ^ email.hashCode;

  @override
  String toString() => 'AppUser(uid: $password, email: $email)';

  // Convert to JSON for SharedPreferences
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };

  // Convert JSON back to a ProductModel
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      email: json['email'],
      password: json['password'],
    );
  }

  // Add copyWith method for updating quantity or other fields
  AppUser copyWith({
    String? email,
    String? password,
  }) {
    return AppUser(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}