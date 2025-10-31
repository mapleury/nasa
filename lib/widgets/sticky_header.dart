import 'package:cars_app/controllers/space_timeline_contoller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StickyHeader extends StatelessWidget {
  const StickyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SpaceTimelineController>();
    final scrollController = FixedExtentScrollController(
      initialItem: controller.years.indexOf(controller.selectedYear),
    );

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 40),
                Text(
                  'NASA Space\nTimeline 1960-2016',
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Glide through the timeline\n to explore articles per-year.',
                  style: TextStyle(
                    fontFamily: 'Orbit',
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 60,
            height: 150,
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (notification) {
                final index = scrollController.selectedItem;
                final year = controller.years[index];
                controller.selectYear(year);
                return true;
              },
              child: ListWheelScrollView.useDelegate(
                controller: scrollController,
                itemExtent: 50,
                diameterRatio: 2,
                perspective: 0.003,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    if (index < 0 || index >= controller.years.length) return null;
                    final year = controller.years[index];
                    final isSelected = year == controller.selectedYear;
                    return Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          fontFamily: 'Orbitron',
                          fontSize: isSelected ? 18 : 14,
                          color: isSelected ? Colors.white : Colors.white38,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                        ),
                        child: Text(year.toString()),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
