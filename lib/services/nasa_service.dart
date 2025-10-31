import 'dart:convert';
import 'package:cars_app/models/artwork_models.dart';
import 'package:http/http.dart' as http;

class NasaService {
  static Future<List<Artwork>> fetchArtworks(int year) async {
    final url = Uri.parse(
      'https://images-api.nasa.gov/search?q=space&media_type=image&year_start=$year&year_end=${year + 1}',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final items = data['collection']['items'] ?? [];
      return items.take(12).map<Artwork>((e) => Artwork.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load artworks');
    }
  }
}
