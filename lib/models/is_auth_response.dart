class IsAuthResponse {
  bool ok;
  String uid;

  IsAuthResponse({
    this.ok,
    this.uid,
  });

  factory IsAuthResponse.fromJson(Map<String, dynamic> json) {
    return IsAuthResponse(ok: json['ok'], uid: json['uid']);
  }
}
