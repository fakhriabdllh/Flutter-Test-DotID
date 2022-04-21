import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  late int id;
  late String username;
  late String fullname;
  late String email;
  late String phone;
  late String avatar;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  fetchUser() async {
    final response =
        await http.get(Uri.parse('https://dot-mobile-test.web.app/user.json'));
    var dec = json.decode(response.body)['data'];
    if (response.statusCode == 200) {
      id = dec['id'];
      username = dec['username'];
      fullname = dec['fullname'];
      email = dec['email'];
      phone = dec['phone'];
      avatar = dec['avatar'];
      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading Data',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
