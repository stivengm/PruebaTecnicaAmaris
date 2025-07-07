class LoginUserModel {
  final String email;
  final String password;

  LoginUserModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'LoginUserModel(email: $email, password: $password)';
  }
}