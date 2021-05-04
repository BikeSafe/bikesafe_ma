class ProfileResponse {
  final String uid;
  String firstName;
  String lastName;
  int age;
  String email;

  ProfileResponse({
    this.uid,
    this.firstName,
    this.lastName,
    this.age,
    this.email,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      uid: json['uid'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      email: json['email'],
    );
  }
}
