class Course {
  String? id;
  String? courseTitle;
  int? rating;
  String? courseDescription;
  String? price;
  String? category;
  String? duration;
  int? totalStudents;
  List? videos;
  List? notes;
  String? thumbnail;
  Map<String, dynamic>? createdBy;
    Course(
      {required this.rating,
        required this.courseTitle,
        required this.price,
        required this.courseDescription,
        this.id,
        this.category,
        this.videos,
        this.createdBy,
        this.duration,
        this.totalStudents,
        this.notes,
        this.thumbnail,
      });
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'],
      courseTitle: json['title'],
      rating: json['rating'],
      courseDescription: json['description'],
      price: json['price'],
      category: json['category'],
      duration: json['duration'],
      totalStudents: json['totalStudents'],
      createdBy: json['createdBy'],
      videos: json['videos'],
      notes: json['notes'],
      thumbnail: json['thumbnail'],
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
      'notes' : notes,
      'thumbnail' : thumbnail,
    };
  }
}
/*
{
"success": true,
"message": "Course Found",
"data": {
"course": {
"_id": "6555a594dcf558cbd03ea5e6",
"title": "Web dev part 1",
"description": "100 days of code",
"thumbnail": "public/thumbnail/1700111764076.png",
"createdBy": {
"_id": "653f8d0fa37347ad22d32777",
"username": "AVtheking",
"name": "Ankit"
},
"videos": [
{
"_id": "6555a5a1dcf558cbd03ea5ec",
"videoTitle": "first video",
"videoUrl": "public/course_videos/video-1700111776327.mp4",
"videoUrl_144p": "public/course_videos/video-1700111776327-144p.mp4",
"videoUrl_360p": "public/course_videos/video-1700111776327-360p.mp4",
"videoUrl_720p": "public/course_videos/video-1700111776327-720p.mp4",
"videoDuration": 3.520833
},
{
"_id": "6555a5a5dcf558cbd03ea5f3",
"videoTitle": "first video",
"videoUrl": "public/course_videos/video-1700111779942.mp4",
"videoUrl_144p": "public/course_videos/video-1700111779942-144p.mp4",
"videoUrl_360p": "public/course_videos/video-1700111779942-360p.mp4",
"videoUrl_720p": "public/course_videos/video-1700111779942-720p.mp4",
"videoDuration": 3.520833
}
],
"notes": [
"public/course_notes/notes-1700111776357.pdf",
"public/course_notes/notes-1700111779975.pdf"
],
"category": "Web Development",
"price": "456",
"duration": "10",
"rating": 4,
"totalStudents": 0,
"createdAt": "2023-11-16T05:16:04.147Z",
"updatedAt": "2023-11-16T05:16:32.869Z"
}
}
}
 */
