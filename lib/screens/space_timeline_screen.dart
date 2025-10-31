import 'package:cars_app/controllers/space_timeline_contoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../widgets/artwork_grid.dart';
import '../widgets/sticky_header.dart';

class SpaceTimelineScreen extends StatelessWidget {
  const SpaceTimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SpaceTimelineController()..fetchData(1960),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent, 
          elevation: 0,
          systemOverlayStyle:
              SystemUiOverlayStyle.light, 
          shadowColor: Colors.transparent, 
          surfaceTintColor:
              Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ),

        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/moon-bg.png',
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Column(
              children: const [
                StickyHeader(),
                Expanded(child: ArtworkGrid()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
