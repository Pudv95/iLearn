import 'package:ilearn/Features/Home/Control/data_parse.dart';
import 'package:ilearn/Resources/imports.dart';

class UpNextCard extends StatelessWidget {
  final Map<String,dynamic> video;
  const UpNextCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(height: 65,width:105,child: Image.network(ParseData().parseUrl(''),errorBuilder: (BuildContext, Object, StackTrace? errorBuilder){
        return ClipRRect(borderRadius: BorderRadius.circular(8),child: Container(color: Colors.grey,));
      },),),
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(video['video']['videoTitle'],style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w400,
                height: 0,
              ),),
              Text(double.parse((video['video']['videoDuration']/60).toStringAsFixed(2)).toString(),style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w400,
                height: 0,
              ),)
            ],
          ),
          const Spacer(),
          AllIcons.playButton,
        ],
      ),
    );
  }
}
