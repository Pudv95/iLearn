

class UserModel{
  String? name;
  String? userName;
  String? email;
  String? password;

  UserModel({required this.userName,required this.name, required this.email,required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      userName: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': userName,
      'email': email,
      'password': password,
    };
  }
}