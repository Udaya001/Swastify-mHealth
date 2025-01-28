class SignUpModel {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpModel({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}
