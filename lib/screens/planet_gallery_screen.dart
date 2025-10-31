import 'package:cars_app/routes/app_routes.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:provider/provider.dart';
import '../controllers/planet_controller.dart';
import '../utils/starfield_painter.dart';
import '../widgets/planet_card.dart';
import '../widgets/search_bar.dart';

class PlanetGalleryScreen extends StatefulWidget {
  const PlanetGalleryScreen({super.key});

  @override
  State<PlanetGalleryScreen> createState() => _PlanetGalleryScreenState();
}

class _PlanetGalleryScreenState extends State<PlanetGalleryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _starController;

  @override
  void initState() {
    super.initState();
    _starController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();
  }

  @override
  void dispose() {
    _starController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanetController>(
      builder: (_, controller, __) {
        final filtered = controller.filteredPlanets;

        return Scaffold(
          body: Stack(
            children: [
              AnimatedBuilder(
                animation: _starController,
                builder: (_, __) => CustomPaint(
                  painter: SubtleStarfieldPainter(_starController.value),
                  child: Container(),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios_new,
                                  color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Cosmic Atlas',
                              style: TextStyle(
                                fontFamily: 'Orbitron',
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
         
                      SearchBar(
                        query: controller.query,
                        onChanged: controller.setQuery,
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: PageController(viewportFraction: 0.85),
                              itemCount: filtered.length,
                              itemBuilder: (_, index) =>
                                  PlanetCard(planet: filtered[index]),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 16,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoutes.spaceTimeline);
                                },
                                child: Image.asset(
                                  'assets/images/article-button.png',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
