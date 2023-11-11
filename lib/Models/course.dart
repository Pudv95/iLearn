class Course {
  String? coursePic;
  String? courseTitle;
  String? tutor;
  double? rating;
  String? courseDescription;
  String? price;
  bool? liked;
  Course(
      {required this.rating,
        required this.tutor,
        required this.courseTitle,
        required this.coursePic,
        required this.liked,
        required this.price,
        required this.courseDescription});
}