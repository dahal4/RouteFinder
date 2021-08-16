import 'package:route_finder_final/ui/bus_park.dart';
import 'package:route_finder_final/ui/vehicle_info.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.directions_transit ,color: Colors.green),
            title: Text('Vehicle route'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VehicleInfo()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bus_alert,color: Colors.green),
            title: Text('Bus Stops'),
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BusPark()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info,color: Colors.green),
            title: Text('About'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );

            },
          ),
        ],
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return  AlertDialog(
    title: Text('About'),
    content:  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("This app shows you:"),
        Text("1.Multiple way to reach the destination."),
        Text("2.Vehicles that travels through the places."),
        Text("3.Vehicles that travels to destination."),

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