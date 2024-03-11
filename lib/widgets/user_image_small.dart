import 'package:flutter/material.dart';

class UserImageSmall extends StatelessWidget {
  final String imageUrl;
  const UserImageSmall({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 8),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
