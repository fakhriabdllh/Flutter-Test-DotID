import 'package:dot_indonesia/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final _controller = Get.find<UserController>();
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => _controller.isLoading.value
            ? const CircularProgressIndicator()
            : Container(
                width: width,
                color: const Color(0xffF5F5F5),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //PLACE TEXT
                    const Text(
                      'USER',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    //BLANK
                    const SizedBox(
                      height: 30,
                    ),
                    //PHOTO
                    CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            NetworkImage(_controller.avatar.toString())),
                    //USERNAME
                    Container(
                      width: width,
                      height: 40,
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 90,
                            child: Text('Username'),
                          ),
                          Text(_controller.username.toString())
                        ],
                      ),
                    ),
                    //FULLNAME
                    Container(
                      width: width,
                      height: 40,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 90,
                            child: Text(
                              'Full Name',
                            ),
                          ),
                          Text(_controller.fullname.toString())
                        ],
                      ),
                    ),
                    //EMAIL
                    Container(
                      width: width,
                      height: 40,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 90,
                            child: Text(
                              'Email',
                            ),
                          ),
                          Text(_controller.email.toString())
                        ],
                      ),
                    ),
                    //PHONE
                    Container(
                      width: width,
                      height: 40,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 90,
                            child: Text(
                              'Phone',
                            ),
                          ),
                          Text(_controller.phone.toString())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
