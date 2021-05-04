class LoginResponse {
  final String accesToken;

  LoginResponse({
    this.accesToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accesToken: json['accesToken'],
    );
  }
}
