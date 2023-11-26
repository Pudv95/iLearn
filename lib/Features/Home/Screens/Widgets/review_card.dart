import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ilearn/Features/Home/Control/data_parse.dart';
import 'package:ilearn/Resources/imports.dart';

class ReviewCard extends StatelessWidget {
  final Map<String, dynamic> review;
  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  ParseData().parseUrl(review['user']['profileimg'])),
            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review['user']['name'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(height:4),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: double.parse(review['rating']),
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: AllColor.primaryFocusColor,
                      ),
                      ignoreGestures: true,
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(width: 5,),
                    Text(double.parse(review['rating']).toString())
                  ],
                )
              ],
            ),
            Spacer(),
            //TODO add date
          ],
        ),
        SizedBox(height: 20,),
        Text(
          review['comment'],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w400,
          ),
        ),

      ],
    );
  }

/**
 * "user": {
    "_id": "653f8d0fa37347ad22d32777",
    "username": "AVtheking",
    "name": "AnkitOP",
    "profileimg": "thumbnail/1700972907009.jpg"
    },
    "rating": "4",
    "comment": "Nice course",
    "_id": "6562ecc8537cf5cea5cc0652"
 */
}
