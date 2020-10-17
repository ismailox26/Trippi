import 'package:flutter/material.dart';

class PathsListTile extends StatelessWidget {
  final String label;
  final String pathName;
  final int noOfTours;
  final double rating;
  final String imgUrl;
  PathsListTile(
      {@required this.label,
      @required this.pathName,
      @required this.noOfTours,
      @required this.rating,
      @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imgUrl,
              height: 180,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              height: 180,
              width: 130,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 8, top: 6),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white38),
                          child: Text(
                            label,
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                pathName,
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
                              noOfTours.toString(),
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
                              EdgeInsets.only(bottom: 10, left: 8, right: 8),
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white38),
                          child: Column(
                            children: [
                              Text(
                                rating.toString(),
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
                                color: Colors.white,
                                size: 20,
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
