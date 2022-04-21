import 'package:dot_indonesia/controller/gallery_controller.dart';
import 'package:dot_indonesia/controller/places_controller.dart';
import 'package:dot_indonesia/controller/user_controller.dart';
import 'package:get/instance_manager.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<PlacesController>(PlacesController());
    Get.put<GalleryController>(GalleryController());
    Get.put<UserController>(UserController());
  }
}
