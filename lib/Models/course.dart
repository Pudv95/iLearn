class Course {
  String? id;
  String? courseTitle;
  double? rating;
  String? courseDescription;
  String? price;
  bool? liked;
  String? category;
  String? duration;
  int? totalStudents;
  List? videos;
  List? createdBy;
    Course(
      {required this.rating,
        required this.courseTitle,
        this.liked = true,
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
      courseTitle: json['title'],
      rating: json['rating'].toDouble(),
      courseDescription: json['description'],
      price: json['price'],
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
      'title': courseTitle,
      'rating': rating,
      'description': courseDescription,
      'price': price,
      'category': category,
      'duration': duration,
      'totalStudents': totalStudents,
      'createdBy': createdBy,
      'videos' : videos,
    };
  }
}