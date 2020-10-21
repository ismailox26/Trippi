import 'package:flutter/material.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.17,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 40,
              bottom: 55,
            ),
            height: size.height * 0.17,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Row(
              verticalDirection: VerticalDirection.up,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hi Ismail !',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Spacer(),
              ],
            ),
          ),
          Positioned(
            bottom: 7,
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
                      blurRadius: 10,
                      offset: Offset(2, 10),
                    )
                  ]),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                    hintText: 'Find Your Destination',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
