import 'package:flutter/material.dart';


class Avatar extends StatelessWidget {
  final double radius;
  final FontWeight fontWeight;
  final double sizeBoxWidth;
  final double farmNameFontSize;
  final double nameFontSize;
  final Color fontColor;
  final Color avatarBackgroundColor;

  const Avatar({
    Key? key,
    this.radius = 20,
    this.fontWeight = FontWeight.normal,
    this.sizeBoxWidth = 8,
    this.farmNameFontSize = 12,
    this.nameFontSize = 16,
    this.fontColor = Colors.white,
    this.avatarBackgroundColor = Colors.white70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: avatarBackgroundColor,
            child: const Icon(Icons.person),
          ),
          SizedBox(width: sizeBoxWidth),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Irrigation App",
                  style: TextStyle(
                    fontSize: farmNameFontSize,
                    color: fontColor,
                  ),
                ),
                Text(
                  "Admin",
                  style: TextStyle(
                    fontSize: nameFontSize,
                    fontWeight: fontWeight,
                    color: fontColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      
    );
  }
}
