import 'package:cars_app/models/artwork_models.dart';
import 'package:flutter/material.dart';
import '../services/nasa_service.dart';

class SpaceTimelineController extends ChangeNotifier {
  final List<int> years = List.generate(15, (index) => 1960 + index * 4);
  int selectedYear = 1960;
  List<Artwork> artworks = [];
  bool loading = false;

  Future<void> fetchData(int year) async {
    loading = true;
    artworks.clear();
    notifyListeners();

    try {
      artworks = await NasaService.fetchArtworks(year);
    } catch (_) {
      artworks = [];
    }

    loading = false;
    notifyListeners();
  }

  void selectYear(int year) {
    if (year != selectedYear) {
      selectedYear = year;
      fetchData(year);
    }
  }
}
