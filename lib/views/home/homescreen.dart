import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0, // hides leading widget
          )),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.23,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.23 - 27,
              ),
              Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  height: 54,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 50,
                          offset: Offset(0, 10),
                        )
                      ]),
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        hintText: 'Find Your Destination',
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
