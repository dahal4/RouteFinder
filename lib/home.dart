
import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:geolocation/geolocation.dart';
import 'package:route_finder_final/path/kot_gongabu.dart';
import 'package:route_finder_final/ui/kalToKot.dart';
import 'package:route_finder_final/ui/lagankhelGongabu.dart';
import 'package:route_finder_final/ui/lagankhel_jawlakhel.dart';
import 'package:route_finder_final/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'api/user_api.dart';

final apikey ='pk.eyJ1IjoibWFuaXNoZGFoYWwiLCJhIjoiY2tpYWJkdDB6MGFqbTJzcnRpMmE4OWFlNiJ9.yW5q2POpsb9rkIZetl1omw';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();


}

class _HomeState extends State<Home> {
  MapController controller = new MapController();

  final _startPointController = TextEditingController();
  final _destinationController = TextEditingController();

//   getPermission() async{
//     final GeolocationResult result = await Geolocation.requestLocationPermission(
//     permission: LocationPermission(
//         android: LocationPermissionAndroid.fine
//       )
//     );
//     return result;
//   }
//   getLocation(){
//     return getPermission().then((result) async{
//       if(result.isSuccessful){
//         final coords = await Geolocation.currentLocation(accuracy:LocationAccuracy.best);
//       }
//
//     });
//   }
// buildMap(){
//     getLocation().then((response){
//       if(response.isSuccessful){
//         response.listen((value){
//           controller.move(LatLng(value.location.latitude,value.location.longitude),15.0);
//         });
//       }
//     });
// }
  void clearText() {
    _startPointController.clear();
    _destinationController.clear();
  }

  @override
  Widget build(BuildContext context) {

    List initialCoordinate = [85.30, 27.700];
    List destinationCoordinate = [85.30, 27.700];

    return Scaffold(
      appBar: AppBar(
        title: Text("Route Finder"),
      ),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          FlutterMap(
            // mapController: controller,
            options: MapOptions(
              center: LatLng(initialCoordinate[1], initialCoordinate[0]),
              // center: buildMap(),
              zoom: 13.0,
              maxZoom: 18.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/manishdahal/ckjfdjp13n3j81at47rwkya4n/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFuaXNoZGFoYWwiLCJhIjoiY2tpYWJkdDB6MGFqbTJzcnRpMmE4OWFlNiJ9.yW5q2POpsb9rkIZetl1omw",
                  additionalOptions: {
                    'accessToken': '$apikey',
                    'id': 'mapbox.mapbox-streets-v8'
                  }),
            ],
          ),
          Positioned(
            top: 10.0,
            right: 15.0,
            left: 15.0,
            child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 5.0),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ],
                ),
                child: TypeAheadFormField<Place?>(
                  suggestionsCallback: PlaceApi.getPlaceSuggestions,
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _startPointController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_searching),
                      border: OutlineInputBorder(),
                      hintText: 'Source ?',
                    ),
                  ),
                  itemBuilder: (context, Place? suggestion) {
                    final place = suggestion!;
                    return ListTile(title: Text(place.name));
                  },
                  noItemsFoundBuilder: (context) => Center(
                      child: Text(
                    "No place found",
                    style: TextStyle(fontSize: 24),
                  )),
                  onSuggestionSelected: (Place? suggestion) {
                    final place = suggestion!;
                    _startPointController.text = suggestion.name;
                  },
                )),
          ),
          Positioned(
            top: 70.0,
            right: 15.0,
            left: 15.0,
            child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 5.0),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ],
                ),
                child: TypeAheadFormField<Place?>(
                  suggestionsCallback: PlaceApi.getPlaceSuggestions,
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _destinationController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.local_taxi),
                      border: OutlineInputBorder(),
                      hintText: 'Destination ?',
                    ),
                  ),
                  itemBuilder: (context, Place? suggestion) {
                    final place = suggestion!;
                    return ListTile(title: Text(place.name));
                  },
                  noItemsFoundBuilder: (context) => Center(
                      child: Text(
                    "No place found",
                    style: TextStyle(fontSize: 24),
                  )),
                  onSuggestionSelected: (Place? suggestion) {
                    final place = suggestion!;
                    this._destinationController.text = place.name;
                  },
                )),
          ),
          Positioned(
              top: 130.0,
              left: 170.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 5.0),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if ( _startPointController.text == "Lagankhel" &&
                         _destinationController.text == "Jawlakhel" ||  _startPointController.text == "Jawlakhel" &&
                         _destinationController.text == "Lagankhel") {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LagJawl()),
                      );
                    } else if ( _startPointController.text == "Koteshwor" &&
                         _destinationController.text == "Gongabu" ||  _startPointController.text == "Gongabu" &&
                         _destinationController.text == "Koteshwor") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KotToGong()),
                      );
                    }else if ( _startPointController.text == "Kalanki" &&
                         _destinationController.text == "Koteshwor" ||  _startPointController.text == "Koteshwor" &&
                         _destinationController.text == "Kalanki") {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KalToKot()),
                      );
                    } else if ( _startPointController.text == "Lagankhel" &&
                         _destinationController.text == "Gongabu" ||  _startPointController.text == "Gongabu" &&
                         _destinationController.text == "Lagankhel") {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LagToGong()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupDialog(context)
                      );

                    }
                  },
                ),
              )),
          //
        ],
      ),

    );

  }

}


Widget _buildPopupDialog(BuildContext context) {
  return  AlertDialog(
    title: Text('Alert !!!'),
    content:  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Please enter valid source and destination"),
      ],
    ),
    actions: <Widget>[
       TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Close'),
      ),
    ],
  );
}