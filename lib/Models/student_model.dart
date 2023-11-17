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
  List? createdCourses;
  List? ownedCourses;
  List? cart;
  List? completeCourse;
  List? wishlist;

  User({this.sId,
    this.username,
    this.name,
    this.email,
    this.password,
    this.verify,
    this.role,
    this.shortId,
    this.iV,
    this.createdCourses,
    this.ownedCourses,
    this.cart,
    this.completeCourse,
    this.wishlist});

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
    createdCourses = json['createdCourses'];
    ownedCourses = json['ownedCourses'];
    cart = json['cart'];
    wishlist = json['wishlist'];
    completeCourse = json['completedCourse'];
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
    data['createdCourses'] = createdCourses;
    data['ownedCourses'] = ownedCourses;
    data['cart'] = cart;
    data['wishlist'] = wishlist;
    data['completedCourse'] = completeCourse;
    return data;
  }
}
