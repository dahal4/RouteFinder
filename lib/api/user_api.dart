import 'dart:convert';

import 'package:flutter/services.dart';

class Place {
  final String name;

  const Place({
    required this.name,
  });

  static Place fromJson(Map<String, dynamic> json) => Place(
    name: json['name'],
  );
}

class PlaceApi {

  static Future<List<Place>> getPlaceSuggestions(String query) async {
    final String response = await rootBundle.loadString('lib/api/place.json');


      final List places = json.decode(response);

      return places.map((json) => Place.fromJson(json)).where((place) {
        final nameLower = place.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    }
  }
