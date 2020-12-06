import 'package:trippi_app/views/home/model/places_model.dart';
import 'package:trippi_app/views/home/model/popular_tours_model.dart';

List<PathModel> getPath() {
  List<PathModel> path = new List();
  PathModel pathModel = new PathModel();

// path 1
  pathModel.pathName = "Aga-Casa";
  pathModel.label = "New";
  pathModel.noOfTours = 12;
  pathModel.imgUrl = "assets/images/PH1.jpg";
  pathModel.rating = 5.3;
  path.add(pathModel);
  pathModel = new PathModel();

// path 2
  pathModel.pathName = "Mar-Tang";
  pathModel.label = "";
  pathModel.noOfTours = 10;
  pathModel.imgUrl = "assets/images/PH2.jpg";
  pathModel.rating = 3.3;
  path.add(pathModel);
  pathModel = new PathModel();

// path 3
  pathModel.pathName = "Ess-Fes";
  pathModel.label = "New";
  pathModel.noOfTours = 2;
  pathModel.imgUrl = "assets/images/PH3.jpg";
  pathModel.rating = 2;
  path.add(pathModel);
  pathModel = new PathModel();

// path 4
  pathModel.pathName = "Aga-Laa";
  pathModel.label = "New";
  pathModel.noOfTours = 22;
  pathModel.imgUrl = "assets/images/PH4.jpg";
  pathModel.rating = 7.3;
  path.add(pathModel);
  pathModel = new PathModel();

// path 5
  pathModel.pathName = "Taro-Mar";
  pathModel.label = "";
  pathModel.noOfTours = 2;
  pathModel.imgUrl = "assets/images/PH1.jpg";
  pathModel.rating = 4.3;
  path.add(pathModel);
  pathModel = new PathModel();

// path 6
  pathModel.pathName = "Tet-Aga";
  pathModel.label = "New";
  pathModel.noOfTours = 10;
  pathModel.imgUrl = "assets/images/PH2.jpg";
  pathModel.rating = 9.3;
  path.add(pathModel);
  pathModel = new PathModel();

// path 7
  pathModel.pathName = "Dakh-Aga";
  pathModel.label = "New";
  pathModel.noOfTours = 32;
  pathModel.imgUrl = "assets/images/PH3.jpg";
  pathModel.rating = 8.3;
  path.add(pathModel);
  pathModel = new PathModel();

  return path;
}

List<PlacesModel> getPlace() {
  List<PlacesModel> place = new List();
  PlacesModel placesModel = new PlacesModel();

// place 1

  placesModel.placeName = "Tifoultoute ";
  placesModel.imgUrl = "assets/images/PH3.jpg";
  placesModel.no0fVisit = 12;
  placesModel.placeCity = "ouarzazat";
  placesModel.placeTemp = 17;
  placesModel.placeRating = 6.5;
  place.add(placesModel);
  placesModel = new PlacesModel();

// place 2

  placesModel.placeName = "dakar";
  placesModel.imgUrl = "assets/images/PH1.jpg";
  placesModel.no0fVisit = 12;
  placesModel.placeCity = "ouarzazat";
  placesModel.placeTemp = 17;
  placesModel.placeRating = 6.5;
  place.add(placesModel);
  placesModel = new PlacesModel();

// place 3

  placesModel.placeName = "dakar";
  placesModel.imgUrl = "assets/images/PH2.jpg";
  placesModel.no0fVisit = 12;
  placesModel.placeCity = "ouarzazat";
  placesModel.placeTemp = 17;
  placesModel.placeRating = 6.5;
  place.add(placesModel);
  placesModel = new PlacesModel();

// place 4

  placesModel.placeName = "dakar";
  placesModel.imgUrl = "assets/images/PH4.jpg";
  placesModel.no0fVisit = 12;
  placesModel.placeCity = "ouarzazat";
  placesModel.placeTemp = 17;
  placesModel.placeRating = 6.5;
  place.add(placesModel);
  placesModel = new PlacesModel();

// place 5

  placesModel.placeName = "dakar";
  placesModel.imgUrl = "assets/images/PH1.jpg";
  placesModel.no0fVisit = 12;
  placesModel.placeCity = "ouarzazat";
  placesModel.placeTemp = 17;
  placesModel.placeRating = 6.5;
  place.add(placesModel);
  placesModel = new PlacesModel();

// place 6

  placesModel.placeName = "dakar";
  placesModel.imgUrl = "assets/images/PH3.jpg";
  placesModel.no0fVisit = 12;
  placesModel.placeCity = "ouarzazat";
  placesModel.placeTemp = 17;
  placesModel.placeRating = 6.5;
  place.add(placesModel);
  placesModel = new PlacesModel();

// place 7

  placesModel.placeName = "dakar";
  placesModel.imgUrl = "assets/images/PH2.jpg";
  placesModel.no0fVisit = 12;
  placesModel.placeCity = "ouarzazat";
  placesModel.placeTemp = 17;
  placesModel.placeRating = 6.5;
  place.add(placesModel);
  placesModel = new PlacesModel();

  return place;
}
