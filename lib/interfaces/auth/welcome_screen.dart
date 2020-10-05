import 'package:flutter/material.dart';
import 'package:Trippi_App/components/rounded_button.dart';
import 'package:Trippi_App/constants.dart';
import 'package:Trippi_App/interfaces/auth/signup_screen.dart';
import 'package:Trippi_App/interfaces/auth/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/logo1.png",
                height: size.height * 0.10,
              ),
              SizedBox(height: size.height * 0.05),
              Image.asset(
                "assets/men.png",
                height: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.06),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "SIGNUP",
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
