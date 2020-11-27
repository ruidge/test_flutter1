import 'package:fluttertoast/fluttertoast.dart';

class CommonUtil {
  static void toast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
