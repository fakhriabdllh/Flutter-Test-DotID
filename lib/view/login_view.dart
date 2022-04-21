import 'package:dot_indonesia/controller/login_controller.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var pass = TextEditingController();
    var width = MediaQuery.of(context).size.width;
    LoginController().loginCheck();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //LOGIN TEXT
            const Text(
              'LOGIN',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            //INPUT EMAIL
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 40,
              padding: const EdgeInsets.only(left: 10),
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
              child: TextFormField(
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                  hintText: 'email',
                  border: InputBorder.none,
                ),
                controller: email,
              ),
            ),
            //INPUT PASSWORD
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 40,
              padding: const EdgeInsets.only(left: 10),
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
              child: TextFormField(
                cursorColor: Colors.grey,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'password',
                  border: InputBorder.none,
                ),
                controller: pass,
              ),
            ),
            //BUTTON SUBMIT
            Container(
                margin: const EdgeInsets.only(top: 20),
                height: 40,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 20,
                      )
                    ]),
                child: TextButton(
                    onPressed: () {
                      LoginController().validation(
                          email.value.toString(), pass.value.toString());
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
