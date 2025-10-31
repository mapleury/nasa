import 'package:cars_app/models/planet_models.dart';
import 'package:cars_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cars_app/controllers/planet_controller.dart';
import 'package:cars_app/routes/app_routes.dart';
import 'package:cars_app/screens/home_screen.dart';
import 'package:cars_app/screens/planet_gallery_screen.dart';
import 'package:cars_app/screens/planet_detail_screen.dart';
import 'package:cars_app/screens/space_timeline_screen.dart';

void main() {
  runApp(const SpaceTimelineApp());
}

class SpaceTimelineApp extends StatelessWidget {
  const SpaceTimelineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PlanetController())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NASA Space Timeline',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Orbitron',
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            bodyLarge: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
            titleMedium: TextStyle(color: Colors.white),
          ),
        ),
        initialRoute: AppRoutes.splashScreen,
        routes: {
          AppRoutes.homeScreen: (context) => HomeScreen(),
          AppRoutes.spaceTimeline: (context) => SpaceTimelineScreen(),
          AppRoutes.planetScreen: (context) => PlanetGalleryScreen(),
          AppRoutes.splashScreen: (context) => SplashScreen(
            homeScreen: HomeScreen(), 
          ),
        },
        onGenerateRoute: (settings) {
          if (settings.name == AppRoutes.planetDetailScreen) {
            final planet = settings.arguments as Planet?;
            if (planet == null) {
              throw Exception('PlanetDetailScreen requires a Planet object!');
            }
            return MaterialPageRoute(
              builder: (context) => PlanetDetailScreen(planet: planet),
            );
          }
          return null;
        },
      ),
    );
  }
}
