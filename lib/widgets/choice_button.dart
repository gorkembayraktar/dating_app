import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final IconData iconData;
  final bool hasGradient;

  const ChoiceButton({
    super.key,
    required this.width,
    required this.height,
    required this.size,
    required this.color,
    required this.iconData,
    required this.hasGradient
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          gradient: hasGradient ? const LinearGradient(colors: [
            Colors.yellow,
            Color.fromRGBO(255, 50, 80,1),
            Color.fromRGBO(255, 88, 95,1),
          ]) : const LinearGradient(colors: [
            Colors.white,
            Colors.white
          ]),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withAlpha(50),
                spreadRadius: 4,
                blurRadius: 4,
                offset: const Offset(3,3)
            )
          ]
      ),
      child: Icon(iconData, color: color, size: size,),
    );
  }
}
