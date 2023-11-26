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
  String? domain;
  String? bio;
  int? wallet;
  List? createdCourse;
  List? ownedCourse;
  List? cart;
  List? completeCourse;
  List? wishlist;
  String? profileimg;
  int? educatorRating;
  bool? is_certified_educator;


  /*
    "profileimg": "thumbnail/1699964184412.jpg",
      "domain": "Backend",
      "bio": "A student at akgec",
      "createdCourse": [
      "655cea2aac5a9e0a11a1fbc2",
      "655dbc10283a12e32a1e4f37",
      "655dbc10283a12e32a1e4f37",
      "6560df66d5491f93b7ae7694"
      ],
      "wallet": 0,
      "educator_rating": 4,
      "is_certified_educator": true
   */


  User({this.sId,
    this.username,
    this.is_certified_educator,
    this.profileimg,
    this.bio,
    this.domain,
    this.educatorRating,
    this.name,
    this.email,
    this.password,
    this.verify,
    this.role,
    this.shortId,
    this.iV,
    this.createdCourse,
    this.ownedCourse,
    this.cart,
    this.wallet,
    this.completeCourse,
    this.wishlist});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    domain = json['domain'];
    bio = json['bio'];
    is_certified_educator = json['is_certified_educator'];
    educatorRating = json['educatorRating'];
    profileimg = json['profileimg'];
    verify = json['verify'];
    role = json['role'];
    shortId = json['shortId'];
    iV = json['__v'];
    wallet = json['wallet'];
    createdCourse = json['createdCourse'];
    ownedCourse = json['ownedCourse'];
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
    data['wallet'] = wallet;
    data['createdCourses'] = createdCourse;
    data['ownedCourses'] = ownedCourse;
    data['cart'] = cart;
    data['wishlist'] = wishlist;
    data['completedCourse'] = completeCourse;
    return data;
  }
}
