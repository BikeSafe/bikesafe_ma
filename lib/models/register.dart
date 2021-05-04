class Register {
  String firstName;
  String lastName;
  int age;
  String email;
  String password;

  Register(
    this.firstName,
    this.lastName,
    this.age,
    this.email,
    this.password,
  );

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'email': email,
      'password': password,
    };
  }
}