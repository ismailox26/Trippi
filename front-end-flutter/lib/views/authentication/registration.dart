import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippi_app/components/already_have_an_account_acheck.dart';
import 'package:trippi_app/components/rounded_button.dart';
import 'package:trippi_app/components/textfield_widget.dart';
import 'package:trippi_app/navigation.dart';
import 'package:trippi_app/services/api.dart';
import 'package:trippi_app/views/authentication/welcome_model.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  var email;

  var password;

  var name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final model = Provider.of<HomeModel>(context);
    return Scaffold(
        body: Container(
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFieldWidget(
                      hintText: "Full Name",
                      obscureText: false,
                      onChanged: (value) {},
                      prefixIconData: Icons.person,
                      validator: (fullname) {
                        if (fullname.isEmpty) {
                          return 'Please enter your first name';
                        }
                        name = fullname;
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFieldWidget(
                      hintText: "Your Email",
                      obscureText: false,
                      onChanged: (value) {},
                      prefixIconData: Icons.mail_outline,
                      validator: (emailValue) {
                        if (emailValue.isEmpty) {
                          return 'Please enter email';
                        }
                        email = emailValue;
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFieldWidget(
                      hintText: "PassWord",
                      obscureText: false,
                      onChanged: (value) {},
                      prefixIconData: Icons.lock_outline,
                      suffixIconData: model.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      validator: (passwordValue) {
                        if (passwordValue.isEmpty) {
                          return 'Please enter some text';
                        }
                        password = passwordValue;
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ButtonWidget(
                      title: _isLoading ? 'Proccessing...' : 'Register',
                      hasBorder: true,
                      onpress: () {
                        if (_formKey.currentState.validate()) {
                          _register();
                        }
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
                              return SignInScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email': email,
      'password': password,
      'name': name,
    };

    var res = await Network().authData(data, '/auth/signup');
    var body = json.decode(res.body);

    if (body['status'] == 'ok') {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));

      var getCurrentUser = await Network().getData('/auth/me');
      var userData = json.decode(getCurrentUser.body);
      if (!userData.isEmpty) {
        localStorage.setString('user', json.encode(userData));
        print(userData);
      } else {
        print('hhhhh');
      }
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => NavigationBar()),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
