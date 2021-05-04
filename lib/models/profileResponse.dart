class ProfileResponse {
  final String uid;
  final String firstName;
  final String accesToken;
  final String lastName;
  final String age;
  final String email;

  ProfileResponse({
    this.uid,
    this.firstName,
    this.accesToken,
    this.lastName,
    this.age,
    this.email,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      accesToken: json['accesToken'],
    );
  }
}
