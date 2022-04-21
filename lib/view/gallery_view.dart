import 'package:dot_indonesia/controller/gallery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final _controller = Get.find<GalleryController>();
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => _controller.isLoading.value
            ? const CircularProgressIndicator()
            : Container(
                color: const Color(0xffF5F5F5),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //PLACE TEXT
                    const Text(
                      'GALLERY',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    //SEARCH BAR
                    Container(
                      width: width,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 20, top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 20,
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                              ),
                              // validator: (value) {
                              //   return null;
                              // },
                              // onSaved: (value) {
                              //   return null;
                              // },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //GALLERY GRID
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: _controller.galleryList.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Image.network(
                                _controller.galleryList[index]['thumbnail'],
                                fit: BoxFit.fill,
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
      ),
    ));
  }
}
