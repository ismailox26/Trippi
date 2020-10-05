import 'package:Trippi_App/interfaces/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:Trippi_App/components/or_divider.dart';
import 'package:Trippi_App/components/already_have_an_account_acheck.dart';
import 'package:Trippi_App/components/rounded_button.dart';
import 'package:Trippi_App/components/rounded_input_field.dart';
import 'package:Trippi_App/components/rounded_password_field.dart';
import 'package:Trippi_App/components/social_icon.dart';
import 'package:Trippi_App/interfaces/auth/login_screen.dart';

class SignUpScreen extends StatelessWidget {
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
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.10),
              Text(
                "Create New Acount",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.05),
              RoundedInputField(
                hintText: "Full Name",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
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
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/google-plus.svg",
                    press: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
