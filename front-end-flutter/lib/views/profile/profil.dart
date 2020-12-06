import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippi_app/components/rounded_button.dart';
import 'package:trippi_app/components/textfield_widget.dart';
import 'package:trippi_app/constants.dart';

import 'dart:io';
import 'package:trippi_app/views/authentication/login.dart';
import 'package:trippi_app/views/authentication/welcome_model.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name;
  File _image;
  bool _notif1 = false;
  bool _notif2 = false;

  Future _imgFromCamera() async {
    final myfile = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = File(myfile.path);
    });
  }

  Future _imgFromGallery() async {
    final myfile = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(myfile.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    if (user != null) {
      setState(() {
        name = user['name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 40, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: CircleAvatar(
                      radius: 51,
                      backgroundColor: Global.kPrimaryColor,
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                _image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(50)),
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 50,
                                color: Colors.grey[800],
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text('$name',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 15, right: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Account",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Divider(
                        height: 15,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.lock_outline,
                                color: Global.kPrimaryColor,
                              ),
                              title: Text('Change password',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangePassWord()),
                                );
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.person,
                                color: Global.kPrimaryColor,
                              ),
                              title: Text('Change username',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangeUserName()),
                                );
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.language,
                                color: Global.kPrimaryColor,
                              ),
                              title: Text('Change language',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangeLanguage()),
                                );
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.privacy_tip,
                                color: Global.kPrimaryColor,
                              ),
                              title: Text(
                                'Privacy',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OurPrivacy()),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Notification",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Divider(
                        height: 15,
                        thickness: 2,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: <Widget>[
                            SwitchListTile(
                              secondary: Icon(
                                Icons.place,
                                color: Global.kPrimaryColor,
                              ),
                              title: const Text('Send me new places',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              value: _notif1,
                              onChanged: (bool value) {
                                setState(() {
                                  _notif1 = value;
                                });
                              },
                            ),
                            SwitchListTile(
                              secondary: Icon(
                                Icons.update,
                                color: Global.kPrimaryColor,
                              ),
                              title: const Text('Receive update for Trippi',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              value: _notif2,
                              onChanged: (bool value) {
                                setState(() {
                                  _notif2 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 30, right: 30, bottom: 50),
                        child: ButtonWidget(
                          title: 'Log out',
                          hasBorder: true,
                          onpress: () {
                            logout();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }
}

class ChangePassWord extends StatefulWidget {
  @override
  _ChangePassWordState createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.kPrimaryColor,
        title: Text(
          'Change Your password',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        key: _formKey,
        child: Form(
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextFieldWidget(
                    hintText: 'New Password',
                    obscureText: model.isVisible ? false : true,
                    prefixIconData: Icons.lock_outline,
                    suffixIconData: model.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    validator: (passwordValue) {
                      if (passwordValue.isEmpty) {
                        return 'Please enter some text';
                      }
                      //password = passwordValue;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFieldWidget(
                    hintText: 'Confirm Password',
                    obscureText: model.isVisible ? false : true,
                    prefixIconData: Icons.lock_outline,
                    suffixIconData: model.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    validator: (passwordValue) {
                      if (passwordValue.isEmpty) {
                        return 'Please enter some text';
                      }
                      //password = passwordValue;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonWidget(
                    title: 'Change Password',
                    hasBorder: false,
                    onpress: () {},
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

class ChangeUserName extends StatefulWidget {
  @override
  _ChangeUserNameState createState() => _ChangeUserNameState();
}

class _ChangeUserNameState extends State<ChangeUserName> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.kPrimaryColor,
        title: Text(
          'Change Your Name',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        key: _formKey,
        child: Form(
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextFieldWidget(
                    hintText: "New UserName",
                    obscureText: false,
                    onChanged: (value) {},
                    prefixIconData: Icons.person,
                    validator: (fullname) {
                      if (fullname.isEmpty) {
                        return 'Please enter your first name';
                      }
                      //name = fullname;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonWidget(
                    title: 'Change UserName',
                    hasBorder: false,
                    onpress: () {},
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

class OurPrivacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.kPrimaryColor,
        title: Text(
          'Our Privacy',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 1,
      ),
      body: Center(
        child: Text('A private life is a happy life '),
      ),
    );
  }
}

class ChangeLanguage extends StatefulWidget {
  ChangeLanguage({Key key}) : super(key: key);

  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ChangeLanguageState extends State<ChangeLanguage> {
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.kPrimaryColor,
        title: Text(
          'Change Language',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Center(
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 20,
            elevation: 10,
            style: TextStyle(
                color: Global.kPrimaryColor, fontWeight: FontWeight.bold),
            underline: Container(
              height: 1,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['one', 'English', 'Arabe']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
