import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import '../controller/places_controller.dart';

class PlaceView extends StatelessWidget {
  const PlaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final _controller = Get.find<PlacesController>();
    var founded = [];

    searching(var value) {
      for (int i = 0; i < _controller.placesList.length; i++) {
        if (_controller.placesList[i]['title']
            .toString()
            .toLowerCase()
            .contains(value.toString().toLowerCase())) {
          founded.add(_controller.placesList[i]);
        }
      }
    }

    return SafeArea(
        child: Scaffold(
      body: Obx(() => (_controller.isLoading.value)
          ? const CircularProgressIndicator()
          : Container(
              width: width,
              color: const Color(0xffF5F5F5),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  //PLACE TEXT
                  const Text(
                    'PLACES',
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
                            onChanged: (value) => searching(value),
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
                  //PLACE LISTS
                  Expanded(
                      child: (founded.isEmpty)
                          ? ListView.builder(
                              itemCount: _controller.placesList.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  width: width,
                                  padding: const EdgeInsets.all(10),
                                  height: 120,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //IMAGE
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: (_controller.placesList[index]
                                                        ['type']
                                                    .toString() ==
                                                'multiple')
                                            ? Image.network(
                                                _controller.placesList[index]
                                                        ['media'][0]
                                                    .toString(),
                                                width: 150,
                                                fit: BoxFit.fitWidth,
                                              )
                                            : Image.network(
                                                _controller.placesList[index]
                                                        ['image']
                                                    .toString(),
                                                width: 150,
                                                fit: BoxFit.fitWidth,
                                              ),
                                      ),
                                      //BLANK SPACE
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      //TEXT
                                      Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              _controller.placesList[index]
                                                      ['title']
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              _controller.placesList[index]
                                                      ['content']
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                );
                              }))
                          : ListView.builder(
                              itemCount: founded.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  width: width,
                                  padding: const EdgeInsets.all(10),
                                  height: 120,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //IMAGE
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: (founded[index]['type']
                                                    .toString() ==
                                                'multiple')
                                            ? Image.network(
                                                founded[index]['media'][0]
                                                    .toString(),
                                                width: 150,
                                                fit: BoxFit.fitWidth,
                                              )
                                            : Image.network(
                                                founded[index]['image']
                                                    .toString(),
                                                width: 150,
                                                fit: BoxFit.fitWidth,
                                              ),
                                      ),
                                      //BLANK SPACE
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      //TEXT
                                      Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              founded[index]['title']
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              founded[index]['content']
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                );
                              })))
                ],
              ),
            )),
    ));
  }
}
