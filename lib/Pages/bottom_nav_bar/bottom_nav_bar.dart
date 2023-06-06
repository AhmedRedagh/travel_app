import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app/Pages/detailed_page/detailed_page.dart';
import 'package:travel_app/Pages/welcome_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  List<IconData> icons = [Icons.home, CupertinoIcons.globe, Icons.person];
  List screens = [
    const DetailsPage(),
    const WelcomePage(),
    const WelcomePage()
  ];
  IconData navIconChange() {
    return icons[selectedIndex];
  }

  FloatingActionButtonLocation? location() {
    switch (selectedIndex) {
      case 0:
        return FloatingActionButtonLocation.startDocked;
      case 1:
        return FloatingActionButtonLocation.centerDocked;
      case 2:
        return FloatingActionButtonLocation.endDocked;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.8),
          //Floating action button on Scaffold
          onPressed: () {
            //code to execute on button press
          },
          child: Icon(
            navIconChange(),
            color: Colors.white.withOpacity(0.9),
            size: 40,
          ), //icon inside button
        ),
        floatingActionButtonLocation: location(),
        //floating action button location to left

        bottomNavigationBar: BottomAppBar(
          //bottom navigation bar on scaffold
          color: Colors.deepPurpleAccent,
          shape: const CircularNotchedRectangle(), //shape of notch
          notchMargin: 0,

          // //notch margin between floating button and bottom app bar
          child: Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: MediaQuery.of(context).size.width - 10),
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => selectedIndex != index
                          ? Align(
                              alignment: Alignment.topCenter,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                icon: Icon(
                                  icons[index],
                                  color: Colors.amber,
                                  size: 35,
                                ),
                              ),
                            )
                          : const CircleAvatar(
                              radius: 0,
                            ),
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 3 + 15,
                        );
                      },
                      itemCount: icons.length),
                ),
              ],
            ),
          ),
        ),
        body: screens[selectedIndex]);
  }
}
