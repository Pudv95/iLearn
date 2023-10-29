class User {
  String? sId;
  String? username;
  String? name;
  String? email;
  String? password;
  bool? verify;
  String? role;
  String? shortId;
  int? iV;

  User({this.sId,
    this.username,
    this.name,
    this.email,
    this.password,
    this.verify,
    this.role,
    this.shortId,
    this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    verify = json['verify'];
    role = json['role'];
    shortId = json['shortId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['verify'] = verify;
    data['role'] = role;
    data['shortId'] = shortId;
    data['__v'] = iV;
    return data;
  }
}