import 'package:cars_app/models/planet_models.dart';

class PlanetService {
  static final List<Planet> _planets = [
    Planet(
      name: 'Mercury',
      description:
          'The swiftest messenger of the cosmos. Mercury’s surface bears the scars of ancient impacts, its horizon glowing under a harsh, eternal sunrise.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/4/4a/Mercury_in_true_color.jpg',
    ),
    Planet(
      name: 'Venus',
      description:
          'A world wrapped in gold and fire. Venus is Earth’s twin in size but not in soul — her thick clouds hide an inferno beneath, her atmosphere glowing amber.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/e/e5/Venus-real_color.jpg',
    ),
    Planet(
      name: 'Earth',
      description:
          'The cradle of life — oceans breathing, forests whispering, storms swirling in divine rhythm. A delicate blue oasis adrift in darkness.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/9/97/The_Earth_seen_from_Apollo_17.jpg',
    ),
    Planet(
      name: 'Mars',
      description:
          'The red wanderer, ancient and silent. Rusted plains and towering volcanoes tell of a world that once had rivers and maybe dreams.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/02/OSIRIS_Mars_true_color.jpg',
    ),
    Planet(
      name: 'Jupiter',
      description:
          'The storm king. Vast, thundering, wrapped in endless clouds of ochre and white. The Great Red Spot rages on eternally.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/e/e2/Jupiter.jpg',
    ),
    Planet(
      name: 'Saturn',
      description:
          'Elegance in motion. Saturn’s rings shimmer like frozen symphonies of ice and dust, an ethereal crown in the dark.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/c/c7/Saturn_during_Equinox.jpg',
    ),
    Planet(
      name: 'Uranus',
      description:
          'The tilted enigma. Uranus rolls through the cosmos on its side, an icy world of pale cyan, whispering secrets of deep space.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/3/3d/Uranus2.jpg',
    ),
    Planet(
      name: 'Neptune',
      description:
          'The deep azure sentinel. Neptune’s winds howl faster than any other, a distant world of storms and silent majesty.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/5/56/Neptune_Full.jpg',
    ),
    Planet(
      name: 'Pluto',
      description:
          'The small wanderer. Once a planet, now a dwarf, Pluto drifts in shadowed elegance, a frozen relic of the Kuiper belt.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/2/2a/Nh-pluto-in-true-color_2x_JPEG-edit-frame.jpg',
    ),
    Planet(
      name: 'Moon',
      description:
          'Earth’s silent companion, witness to the tides and our dreams. Craters and maria tell stories of cosmic encounters and quiet nights.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/e/e1/FullMoon2010.jpg',
    ),
  ];

  List<Planet> getPlanets() => _planets;
}
