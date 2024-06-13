class UserDetails {
  String? name;
  String? email;
  String? password;
  String? userId;

  UserDetails({this.name, this.email, this.password, this.userId});

  UserDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['userId'] = userId;
    return data;
  }
}
