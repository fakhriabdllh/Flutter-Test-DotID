import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class GalleryController extends GetxController {
  var galleryList = [];
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchGallery();
  }

  fetchGallery() async {
    final response = await http
        .get(Uri.parse('https://dot-mobile-test.web.app/gallery.json'));

    if (response.statusCode == 200) {
      galleryList = json.decode(response.body)['data'];
      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading Data',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
