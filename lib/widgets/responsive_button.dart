import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  const ResponsiveButton(
      {super.key, this.isResposive = false, this.width, this.text = ''});
  final bool isResposive;
  final double? width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: Row(
        mainAxisAlignment: text.isNotEmpty
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          text.isNotEmpty ? Text(text) : const SizedBox(),
          Image.asset('assets/images/button-one.png')
        ],
      ),
    );
  }
}
