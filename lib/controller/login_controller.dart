import 'package:dot_indonesia/view/navbar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  late SharedPreferences sharedPreferences;

  bool emailOK = false;
  bool passOK = false;
  bool valid = false;
  validation(email, pass) {
    if (email.toString().toLowerCase().contains('@'.toString()) &&
        email.toString().toLowerCase().contains('.com'.toString())) {
      emailOK = true;
    } else {
      emailOK = false;
    }

    RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
    if (regEx.hasMatch(pass).toString() == 'true' &&
        pass.toString().length > 5) {
      passOK = true;
    } else {
      passOK = false;
    }

    if (emailOK == true && passOK == true) {
      valid = true;
      return Get.to(const Navbar());
    } else if (emailOK == false || passOK == false) {
      valid = false;
    }
  }

  loginCheck() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (valid == true) {
      return Get.to(const Navbar());
    }
  }
}
