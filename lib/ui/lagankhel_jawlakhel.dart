import 'package:route_finder_final/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' show cos, sqrt, asin;

final apikey ='pk.eyJ1IjoibWFuaXNoZGFoYWwiLCJhIjoiY2tpYWJkdDB6MGFqbTJzcnRpMmE4OWFlNiJ9.yW5q2POpsb9rkIZetl1omw';

class LagJawl extends StatefulWidget {
  @override
  _LagJawlState createState() => _LagJawlState();
}

class _LagJawlState extends State<LagJawl> {
  var ltjPath = <LatLng>[
    LatLng(27.666811, 85.323345),
    LatLng(27.666875, 85.323062),
    LatLng(27.666881, 85.322693),
    LatLng(27.668264, 85.321678),
    LatLng(27.669336, 85.321976),
    LatLng(27.669754, 85.321863),
    LatLng(27.670026, 85.321601),
    LatLng(27.671561, 85.318533),
    LatLng(27.671975, 85.316947),
    LatLng(27.672203, 85.315552),
    LatLng(27.672608, 85.313971),
    LatLng(27.672708, 85.313467),
  ];
  var ltj = [
    {"lat":27.666811, "lng": 85.323345},
    {"lat":27.666875, "lng": 85.323062},
    {"lat":27.666881, "lng": 85.322693},
    {"lat":27.668264, "lng": 85.321678},
    {"lat":27.669336, "lng": 85.321976},
    {"lat":27.669754, "lng": 85.321863},
    {"lat":27.670026, "lng": 85.321601},
    {"lat":27.671561, "lng": 85.318533},
    {"lat":27.671975, "lng": 85.316947},
    {"lat":27.672203, "lng": 85.315552},
    {"lat":27.672608, "lng": 85.313971},
    {"lat":27.672708, "lng": 85.313467}
  ];
  var ltmtjPath = <LatLng>[
    LatLng(27.6670472, 85.3229302),
    LatLng(27.6668858, 85.3227961),
    LatLng(27.6669048, 85.3225976),
    LatLng(27.6662162, 85.3222167),
    LatLng(27.6655847, 85.3218198),
    LatLng(27.6652048, 85.3215784),
    LatLng(27.6655135, 85.3206825),
    LatLng(27.6651193, 85.3205216),
    LatLng(27.6643691, 85.3202158),
    LatLng(27.6640414, 85.3201407),
    LatLng(27.6637043, 85.3200656),
    LatLng(27.6634479, 85.3199422),
    LatLng(27.6632389, 85.3197062),
    LatLng(27.6627356, 85.3193307),
    LatLng(27.6620505, 85.3188211),
    LatLng(27.6615899, 85.3184134),
    LatLng(27.6614047, 85.3182471),
    LatLng(27.6627010, 85.3165573),
    LatLng(27.6638359, 85.3150767),
    LatLng(27.6647530, 85.3140360),
    LatLng(27.6650714, 85.3134352),
    LatLng(27.6653222, 85.3128022),
    LatLng(27.6660412, 85.3103989),
    LatLng(27.6666206, 85.3083926),
    LatLng(27.6666775, 85.3082693),
    LatLng(27.6670147, 85.3084785),
    LatLng(27.6677518, 85.3090310),
    LatLng(27.6685400, 85.3095299),
    LatLng(27.6692627, 85.3100502),
    LatLng(27.6694907, 85.3102112),
    LatLng(27.6696711, 85.3103828),
    LatLng(27.6698895, 85.3107369),
    LatLng(27.6701982, 85.3112036),
    LatLng(27.6705733, 85.3116918),
    LatLng(27.6711535, 85.3121585),
    LatLng(27.6717708, 85.3125072),
    LatLng(27.6723270, 85.3128612),
    LatLng(27.6727015, 85.3131562),
  ];
  var ltmtj = [
    {"lat":27.6670472, "lng": 85.3229302},
    {"lat":27.6668858, "lng": 85.3227961},
    {"lat":27.6669048, "lng": 85.3225976},
    {"lat":27.6662162, "lng": 85.3222167},
    {"lat":27.6655847, "lng": 85.3218198},
    {"lat":27.6652048, "lng": 85.3215784},
    {"lat":27.6655135, "lng": 85.3206825},
    {"lat":27.6651193, "lng": 85.3205216},
    {"lat":27.6643691, "lng": 85.3202158},
    {"lat":27.6640414, "lng": 85.3201407},
    {"lat":27.6637043, "lng": 85.3200656},
    {"lat":27.6634479, "lng": 85.3199422},
    {"lat":27.6632389, "lng": 85.3197062},
    {"lat":27.6627356, "lng": 85.3193307},
    {"lat":27.6620505, "lng": 85.3188211},
    {"lat":27.6615899, "lng": 85.3184134},
    {"lat":27.6614047, "lng": 85.3182471},
    {"lat":27.6627010, "lng": 85.3165573},
    {"lat":27.6638359, "lng": 85.3150767},
    {"lat":27.6647530, "lng": 85.3140360},
    {"lat":27.6650714, "lng": 85.3134352},
    {"lat":27.6653222, "lng": 85.3128022},
    {"lat":27.6660412, "lng": 85.3103989},
    {"lat":27.6666206, "lng": 85.3083926},
    {"lat":27.6666775, "lng": 85.3082693},
    {"lat":27.6670147, "lng": 85.3084785},
    {"lat":27.6677518, "lng": 85.3090310},
    {"lat":27.6685400, "lng": 85.3095299},
    {"lat":27.6692627, "lng": 85.3100502},
    {"lat":27.6694907, "lng": 85.3102112},
    {"lat":27.6696711, "lng": 85.3103828},
    {"lat":27.6698895, "lng": 85.3107369},
    {"lat":27.6701982, "lng": 85.3112036},
    {"lat":27.6705733, "lng": 85.3116918},
    {"lat":27.6711535, "lng": 85.3121585},
    {"lat":27.6717708, "lng": 85.3125072},
    {"lat":27.6723270, "lng": 85.3128612},
    {"lat":27.6727015, "lng": 85.3131562},
  ];
  var points = <LatLng>[
    LatLng(27.6670472, 85.3229302),
    LatLng(27.6727015, 85.3131562),
  ];

//distance formula
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  //distance from lagankhel to jawlakhel
  double distanceFromLagToJawlakhel() {
    double totalDistance = 0;
    for (var i = 0; i < ltj.length - 1; i++) {
      totalDistance += calculateDistance(
          ltj[i]["lat"],
          ltj[i]["lng"],
          ltj[i + 1]["lat"],
          ltj[i + 1]["lng"]);
    }
    return totalDistance * 1000;
  }

  //distance from lagankhel to mahalaxmi to jawlakhel
  double distanceFromLagToMahalaxmiToJawlakhel() {
    double totalDistance = 0;
    for (var i = 0; i < ltmtj.length - 1; i++) {
      totalDistance += calculateDistance(
          ltmtj[i]["lat"],
          ltmtj[i]["lng"],
          ltmtj[i + 1]["lat"],
          ltmtj[i + 1]["lng"]);
    }
    return totalDistance * 1000;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        title: Text("Route"),
      ),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              plugins: [
                // TappablePolylineMapPlugin(),
              ],
              center: LatLng(27.667860, 85.315833),
              zoom: 15,
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
              PolylineLayerOptions(
                polylines: [
                  Polyline(
                    points: ltjPath,
                    color: Colors.orange,
                    strokeWidth: 3.0,
                  ), Polyline(
                    points: ltmtjPath,
                    color: Colors.green,
                    strokeWidth: 3.0,
                  ),

                ],
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: points[0],
                    builder: (ctx) {
                      return Container(
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.mapMarkerAlt),
                          color: Colors.red,
                          iconSize: 30.0,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      color: Colors.white,
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Card(
                                            color: Colors.green,
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30.0)),
                                                Text(
                                                  "Lagankhel",
                                                  style: TextStyle(
                                                      fontSize: 23.0,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                CircleAvatar(
                                                    backgroundColor:
                                                    Colors.white,
                                                    foregroundColor:
                                                    Colors.green,
                                                    child: Icon(
                                                        FontAwesomeIcons.car))
                                              ],
                                            ),
                                          ),
                                          Divider(),
                                          Center(
                                              child: Text(
                                                "Pass By Vehicles",
                                                style: TextStyle(
                                                  fontSize: 22.0,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                          ListTile(
                                            leading: Icon(FontAwesomeIcons.bus,
                                                color: Colors.green),
                                            title: Text(
                                              '1. Swyungta Yatayat',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Icon(FontAwesomeIcons.bus,
                                                color: Colors.green),
                                            title: Text(
                                              '2. Saja Yatayat',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Icon(FontAwesomeIcons.bus,
                                                color: Colors.green),
                                            title: Text(
                                              '3. Swyambhu Yatayat',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ));
                                });
                          },
                        ),
                      );
                    },
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: points[1],
                    builder: (ctx) {
                      return Container(
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.mapMarkerAlt),
                          color: Colors.red,
                          iconSize: 30.0,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      color: Colors.white,
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Card(
                                            color: Colors.green,
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30.0)),
                                                Text(
                                                  "Ratnapark",
                                                  style: TextStyle(
                                                      fontSize: 23.0,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                CircleAvatar(
                                                    backgroundColor:
                                                    Colors.white,
                                                    foregroundColor:
                                                    Colors.green,
                                                    child: Icon(
                                                        FontAwesomeIcons.car))
                                              ],
                                            ),
                                          ),
                                          Divider(),
                                          Center(
                                              child: Text(
                                                "Pass By Vehicles",
                                                style: TextStyle(
                                                  fontSize: 22.0,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                          ListTile(
                                            leading: Icon(FontAwesomeIcons.bus,
                                                color: Colors.green),
                                            title: Text(
                                              '1. Saja Yatayat',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Icon(FontAwesomeIcons.bus,
                                                color: Colors.green),
                                            title: Text(
                                              '2. Nepal Yatayat',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Icon(FontAwesomeIcons.bus,
                                                color: Colors.green),
                                            title: Text(
                                              '3. Micro Bus',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ));
                                });
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                color: Colors.green,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 30.0)),
                    Text(
                      "Lagankhel <=> Jawlakhel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      child: Icon(FontAwesomeIcons.car, color: Colors.green),
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              ),
              Card(
                child: Center(
                    child: Text(
                      "Possible path",
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )),
              ),
              Card(
                child: ExpansionTile(
                  leading: Icon(FontAwesomeIcons.bus, color: Colors.green),
                  title: Text(
                    '1.Via Kumaripati ${distanceFromLagToJawlakhel().toInt()}m',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  children: [

                    Row(
                      children: [

                        Padding(padding: EdgeInsets.only(left: 80)),
                        Text(
                          "1.Saja Yatayat",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                              fontSize: 16.0),
                        ),
                        Spacer(),
                        Icon(FontAwesomeIcons.solidArrowAltCircleLeft,
                            color: Colors.green),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Icon(FontAwesomeIcons.solidArrowAltCircleRight,
                            color: Colors.green),
                      ],
                    ),

                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  leading: Icon(FontAwesomeIcons.bus, color: Colors.green),
                  title: Text(
                    '2. Via Ekantakuna.${distanceFromLagToMahalaxmiToJawlakhel().toInt()}m',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 80)),
                        Text(
                          "1.Swyambhu Yatayat",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                              fontSize: 16.0),
                        ),
                        Spacer(),
                        Icon(FontAwesomeIcons.solidArrowAltCircleLeft,
                            color: Colors.green),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Icon(FontAwesomeIcons.solidArrowAltCircleRight,
                            color: Colors.green),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 80)),
                        Text(
                          "2.Swyungta Yatayat",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                              fontSize: 16.0),
                        ),
                        Spacer(),
                        Icon(FontAwesomeIcons.solidArrowAltCircleLeft,
                            color: Colors.green),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Icon(FontAwesomeIcons.solidArrowAltCircleRight,
                            color: Colors.green),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
