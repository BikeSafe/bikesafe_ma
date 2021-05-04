class RegisterResponse {
  final String uid;

  RegisterResponse({
    this.uid,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      uid: json['uid'],
    );
  }
}
