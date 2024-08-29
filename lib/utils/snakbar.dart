
import 'package:gbs/global_export.dart';

errorToast(msg) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: white,
      backgroundColor: red,
      fontSize: 14.0);
}

messageToast(msg) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: white,
      backgroundColor: green,
      fontSize: 14.0);
}
