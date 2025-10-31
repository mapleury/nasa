import 'package:cars_app/models/planet_models.dart';
import 'package:flutter/material.dart';
import '../services/planet_service.dart';

class PlanetController extends ChangeNotifier {
  final PlanetService _service = PlanetService();
  List<Planet> planets = [];
  String query = '';

  PlanetController() {
    planets = _service.getPlanets();
  }

  List<Planet> get filteredPlanets {
    if (query.isEmpty) return planets;
    return planets
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }


  void setQuery(String value) {
    query = value;
    notifyListeners();
  }
}
