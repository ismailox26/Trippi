import 'package:flutter/material.dart';
import 'package:trippi_app/views/home/homescreen.dart';
import 'package:trippi_app/views/notification/notificationscreen.dart';
import 'package:trippi_app/views/search/searchscreen.dart';
import 'package:trippi_app/views/profile/profil.dart';
import 'package:trippi_app/constants.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;
  final tabs = [HomeScreen(), NotificationScreen(), SearchScreen(), Profil()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  backgroundColor: kPrimaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  title: Text('Notification'),
                  backgroundColor: kPrimaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text('search'),
                  backgroundColor: kPrimaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profil'),
                  backgroundColor: kPrimaryColor)
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ));
  }
}
