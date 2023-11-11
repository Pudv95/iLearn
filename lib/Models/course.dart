class Course {
  String? id;
  String? coursePic;
  String? courseTitle;
  double? rating;
  String? courseDescription;
  String? price;
  bool? liked;
  String? category;
  String? duration;
  int? totalStudents;
  List? videos;
  List<Map<String,dynamic>>? createdBy;
    Course(
      {required this.rating,
        required this.courseTitle,
        required this.coursePic,
        required this.liked,
        required this.price,
        required this.courseDescription,
        this.id,
        this.category,
        this.videos,
        this.createdBy,
        this.duration,
        this.totalStudents

      });
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'],
      coursePic: json['coursePic'],
      courseTitle: json['title'],
      rating: json['rating'].toDouble(),
      courseDescription: json['description'],
      price: json['price'],
      liked: json['liked'],
      category: json['category'],
      duration: json['duration'],
      totalStudents: json['totalStudents'],
      createdBy: json['createdBy'],
      videos: json['videos']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'coursePic': coursePic,
      'title': courseTitle,
      'rating': rating,
      'description': courseDescription,
      'price': price,
      'liked': liked,
      'category': category,
      'duration': duration,
      'totalStudents': totalStudents,
      'createdBy': createdBy,
      'videos' : videos,
    };
  }
}