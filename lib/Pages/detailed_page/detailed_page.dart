import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    int starRate = 4;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/mountain.jpeg'),
                      fit: BoxFit.cover)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 310),
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: 'Yosemite',
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const AppLargeText(
                        text: '250\$',
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      AppText(
                        text: 'USA,California',
                        color: AppColors.textColor1,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) {
                            return Icon(Icons.star,
                                color: index < starRate
                                    ? Colors.amber
                                    : Colors.black);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const AppText(
                        text: '(4.0)',
                        color: AppColors.textColor2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const AppLargeText(text: 'People'),
                  const SizedBox(height: 10),
                  const AppText(
                    text: 'Number of people in your group ',
                    color: AppColors.textColor2,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    children: List.generate(5, (index) {
                      return InkWell(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 5, right: 5),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: index == selectedIndex
                                  ? Colors.black
                                  : Colors.white),
                          child: Center(
                            child: AppText(
                              text: (index + 1).toString(),
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  AppLargeText(
                    text: 'Description',
                    color: Colors.black.withOpacity(0.8),
                  ),
                  const SizedBox(height: 5),
                  const AppText(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet lorem enim. Donec malesuada, mauris id luctus lacinia, est nunc auctor tortor, vel pharetra leo sapien vel erat. Sed euismod nibh eget enim lacinia, ut fermentum purus consequat. Nulla facilisi. Fusce tincidunt lacus in odio laoreet, quis maximus odio aliquet. Praesent ut sapien in tortor tincidunt convallis.',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                style: BorderStyle.solid, width: 0.5)),
                        child: const Icon(Icons.favorite_border),
                      ),
                      const ResponsiveButton(
                        text: 'Book Trip Now',
                        width: 260,
                        isResposive: true,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
