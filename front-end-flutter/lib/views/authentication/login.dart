import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippi_app/components/rounded_button.dart';
import 'package:trippi_app/components/textfield_widget.dart';
import 'package:trippi_app/services/api.dart';
import 'package:trippi_app/views/authentication/registration.dart';
import 'package:trippi_app/views/authentication/welcome_model.dart';
import 'package:trippi_app/navigation.dart';
import '../../constants.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  var email;

  var password;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final model = Provider.of<HomeModel>(context);

    return Scaffold(
      backgroundColor: Global.white,
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 2 : 0.0,
            child: Image.asset(
              'assets/men.png',
              height: size.height / 2,
              width: size.width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 70),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextFieldWidget(
                    hintText: 'Email',
                    obscureText: false,
                    prefixIconData: Icons.mail_outline,
                    suffixIconData: model.isValid ? Icons.check : null,
                    onChanged: (value) {
                      model.isValidEmail(value);
                    },
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextFieldWidget(
                        hintText: 'Password',
                        obscureText: model.isVisible ? false : true,
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
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Global.mediumBlue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonWidget(
                    title: _isLoading ? 'Login...' : 'Login',
                    hasBorder: false,
                    onpress: () {
                      if (_formKey.currentState.validate()) {
                        _login();
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        'Create new Account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};

    var res = await Network().authData(data, '/auth/login');
    var body = json.decode(res.body);
    if (body['status'] == 'ok') {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));

      var getCurrentUser = await Network().getData('/auth/me');
      var userData = json.decode(getCurrentUser.body);
      if (!userData.isEmpty) {
        localStorage.setString('user', json.encode(userData));
      } else {}
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => NavigationBar()),
      );
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
