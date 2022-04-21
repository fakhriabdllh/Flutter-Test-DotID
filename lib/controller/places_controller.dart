import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class PlacesController extends GetxController {
  var placesList = [];
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPlaces();
  }

  fetchPlaces() async {
    final response =
        await http.get(Uri.parse('https://dot-mobile-test.web.app/place.json'));

    if (response.statusCode == 200) {
      placesList = json.decode(response.body)['data']['content'];
      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading Data',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }

  searching(var value, var founded, var lists, String param) {
    for (int i = 0; i < lists.length; i++) {
      if (lists[i][param]
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        founded.add(lists[i]);
        refresh();
      }
    }
  }
}
