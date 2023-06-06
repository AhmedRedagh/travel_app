import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<Map> bottomTabItem = [
    {
      'icon': const Icon(
        Icons.kayaking,
        color: AppColors.mainColor,
        size: 80,
      ),
      'text': const AppText(text: 'kayaking'),
    },
    {
      'icon': const Icon(Icons.scuba_diving, color: Colors.yellow, size: 80),
      'text': const AppText(text: 'Snorkelling'),
    },
    {
      'icon':
          const Icon(Icons.bubble_chart, color: AppColors.mainColor, size: 80),
      'text': const AppText(text: 'Balloning'),
    },
    {
      'icon': const Icon(Icons.sports_baseball, color: Colors.yellow, size: 80),
      'text': const AppText(text: 'Foottball'),
    },
    {
      'icon': const Icon(Icons.directions_bike_sharp,
          color: Colors.green, size: 80),
      'text': const AppText(text: 'Cycling'),
    },
    {
      'icon': const Icon(Icons.directions_boat_rounded,
          color: Colors.green, size: 80),
      'text': const AppText(text: 'Boat'),
    },
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const AppLargeText(text: 'Discover'),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const CircleTabIndicator(
                    color: AppColors.mainColor, radius: 4),
                tabs: const [
                  Tab(text: 'Places'),
                  Tab(text: 'Inspiration'),
                  Tab(text: 'Emotions'),
                ],
                controller: tabController,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 10),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/mountain.jpeg'),
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                  itemCount: 3,
                ),
                const Text('Hi'),
                const Text('There'),
                const Text('Bye'),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: 'Explore More',
                  size: 22,
                ),
                AppText(
                  text: 'SeeAll',
                  color: AppColors.textColor1,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, bottomindex) {
                  return Column(
                    children: [
                      bottomTabItem[bottomindex]['icon'],
                      const SizedBox(height: 10),
                      bottomTabItem[bottomindex]['text']
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                itemCount: bottomTabItem.length),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
