import 'package:flutter/material.dart';
import 'package:trippi_app/views/home/homescreen.dart';
import 'package:trippi_app/views/notification/notificationscreen.dart';
import 'package:trippi_app/views/profile/profil.dart';
import 'package:trippi_app/views/search/mapview.dart';

import 'package:trippi_app/constants.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;
  final tabs = [HomeScreen(), NotificationScreen(), MapView(), ProfilePage()];

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
                  backgroundColor: Global.kPrimaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  title: Text('Notification'),
                  backgroundColor: Global.kPrimaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text('search'),
                  backgroundColor: Global.kPrimaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profil'),
                  backgroundColor: Global.kPrimaryColor)
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
