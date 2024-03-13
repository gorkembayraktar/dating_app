import 'package:flutter/material.dart';

class CustomTextHeader extends StatelessWidget {
  final TabController tabController;
  final String text;
  const CustomTextHeader({super.key, required this.tabController, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.normal
      ),
      textAlign: TextAlign.start,
    );
  }
}
