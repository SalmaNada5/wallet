import 'package:flutter/material.dart';
import 'package:mange_your_wallet/screens/second_screen.dart';
import 'first_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentIndex = 0;
  List<Widget> screens = const [
    FirstScreen(),
    SecondScreen(),
    Center(child: Text('third')),
    Center(child: Text('forth')),
    Center(child: Text('fifth')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        padding: const EdgeInsets.all(7),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          elevation: 0,
          showSelectedLabels: false,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          iconSize: 25,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              label: " ",
              activeIcon: Icon(
                Icons.home,
              ),
              icon: Icon(
                Icons.home_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: ' ',
              backgroundColor: Colors.blue,
              activeIcon: Icon(
                Icons.insert_chart,
              ),
              icon: Icon(
                Icons.insert_chart_outlined_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: ' ',
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.add_box_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: ' ',
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.credit_card,
              ),
            ),
            BottomNavigationBarItem(
              label: ' ',
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
