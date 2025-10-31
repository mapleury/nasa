import 'package:cars_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg-bottom.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  Text(
                    'Solnari II',
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Orbits of Time',
                    style: TextStyle(
                      fontFamily: 'Orbit',
                      fontSize: 28,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Image.asset(
                      'assets/images/solnari.gif',
                      height: 350,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 35),
                  Text(
                    'Read articles from NASA or\nview About planets here..',
                    style: TextStyle(
                      fontFamily: 'Orbit',
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: GestureDetector(
                      onTap: () { Navigator.pushNamed(context, AppRoutes.spaceTimeline);},
                      child: Image.asset(
                        'assets/images/articles-img-button.png',
                        height: 150,
                        width: 450,
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/planets.png',
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {Navigator.pushNamed(context, AppRoutes.planetScreen);},
                        child: Image.asset(
                          'assets/images/planet-button.png',
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
