import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dot_indonesia/view/gallery_view.dart';
import 'package:dot_indonesia/view/place_view.dart';
import 'package:dot_indonesia/view/user_view.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedNavbar = 0;
  final List<Widget> _pages = [
    const PlaceView(),
    const GalleryView(),
    const UserView()
  ];

  void _changeSelectedNavBar(int select) {
    setState(() {
      selectedNavbar = select;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedNavbar],
      bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white,
          height: 50,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            _changeSelectedNavBar(index);
          },
          items: <Widget>[
            SizedBox(
                height: 40,
                child: Column(
                  children: const [
                    Icon(Icons.place_outlined, size: 25),
                    Text(
                      'Places',
                      style: TextStyle(color: Colors.black, fontSize: 8),
                    ),
                  ],
                )),
            SizedBox(
                height: 40,
                child: Column(
                  children: const [
                    Icon(Icons.image_outlined, size: 25),
                    Text(
                      'Gallery',
                      style: TextStyle(color: Colors.black, fontSize: 8),
                    ),
                  ],
                )),
            SizedBox(
                height: 40,
                child: Column(
                  children: const [
                    Icon(Icons.account_circle_outlined, size: 25),
                    Text(
                      'User',
                      style: TextStyle(color: Colors.black, fontSize: 8),
                    ),
                  ],
                )),
          ]),
    );
  }
}
