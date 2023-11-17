import 'package:ilearn/Resources/imports.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> myToast(bool isError,String message){
  return Fluttertoast.showToast(
      msg: message,
      backgroundColor: (!isError)?AllColor.toastErrorColor:AllColor.toastSuccessColor,
      gravity: ToastGravity.BOTTOM,
  );
}
