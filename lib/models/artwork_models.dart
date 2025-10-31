class Artwork {
  final String title;
  final String? description;
  final String? imageUrl;

  Artwork({required this.title, this.description, this.imageUrl});

  factory Artwork.fromJson(Map<String, dynamic> json) {
    final data = json['data'][0];
    final links = json['links'];
    return Artwork(
      title: data['title'] ?? 'Untitled',
      description: data['description'],
      imageUrl: links != null && links.isNotEmpty ? links[0]['href'] : null,
    );
  }
}
