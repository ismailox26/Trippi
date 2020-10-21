import 'package:flutter/material.dart';
import 'package:trippi_app/views/home/details.dart';

class PlacesToVisit extends StatelessWidget {
  final String placeName;
  final int placeTemp;
  final String placeCity;
  final double placeRating;
  final String imgUrl;
  final int no0fVisit;
  PlacesToVisit({
    @required this.placeName,
    @required this.placeTemp,
    @required this.placeCity,
    @required this.placeRating,
    @required this.imgUrl,
    @required this.no0fVisit,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(
                        imgUrl: imgUrl,
                        placeName: placeName,
                        rating: placeRating,
                      )));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 8),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imgUrl,
                  height: 200,
                  width: size.width * 0.9,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  height: 200,
                  width: size.width * 0.9,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 8, top: 6),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white38),
                              child: Text(
                                placeTemp.toString(),
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white38),
                              child: Text(
                                placeName,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ))
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    placeCity,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  no0fVisit.toString(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                              margin:
                                  EdgeInsets.only(bottom: 4, left: 8, right: 8),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white38),
                              child: Column(
                                children: [
                                  Text(
                                    placeRating.toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
