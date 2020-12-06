import 'package:flutter/material.dart';
import 'package:trippi_app/components/header_with_search_box.dart';
import 'package:trippi_app/components/path_list_tile.dart';
import 'package:trippi_app/components/place_to_visit.dart';
import 'package:trippi_app/views/home/data/data.dart';
import 'model/places_model.dart';
import 'model/popular_tours_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PathModel> path = new List();
  List<PlacesModel> place = new List();
  @override
  void initState() {
    path = getPath();
    place = getPlace();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0, // hides leading widget
            )),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            HeaderWithSearchBox(size: size),
            SizedBox(
              height: 17,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Paths',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 20,
                            offset:
                                Offset(-3, 10), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 180,
                      child: ListView.builder(
                          itemCount: path.length,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return PathsListTile(
                              label: path[index].label,
                              pathName: path[index].pathName,
                              noOfTours: path[index].noOfTours,
                              imgUrl: path[index].imgUrl,
                              rating: path[index].rating,
                            );
                          })),
                ],
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Places To Visit',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                          itemCount: place.length,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PlacesToVisit(
                              placeName: place[index].placeName,
                              placeCity: place[index].placeCity,
                              no0fVisit: place[index].no0fVisit,
                              imgUrl: place[index].imgUrl,
                              placeTemp: place[index].placeTemp,
                              placeRating: place[index].placeRating,
                            );
                          }),
                    )
                  ]),
            )
          ],
        )));
  }
}
