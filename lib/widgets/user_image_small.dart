import 'package:flutter/material.dart';

class UserImageSmall extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const UserImageSmall({super.key, this.height = 70, this.width=70, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 8),
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
