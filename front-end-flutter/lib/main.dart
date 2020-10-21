import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippi_app/navigation.dart';
import 'package:trippi_app/views/authentication/login.dart';
import 'package:trippi_app/views/authentication/welcome_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeModel(),
      child: MaterialApp(
        title: 'Trippi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CheckAuth(),
      ),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    var token = localStorage.getString('token');

    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = NavigationBar();
    } else {
      child = SignInScreen();
    }
    return Scaffold(
      body: child,
    );
  }
}
