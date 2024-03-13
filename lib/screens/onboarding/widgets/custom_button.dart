import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  const CustomButton({super.key, required this.tabController, required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Colors.redAccent
          ]
        )
      ),
      child: ElevatedButton(
          onPressed: () {
            tabController.animateTo(tabController.index + 1);
          },
          style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.transparent), 
          child: Container(
              width: double.infinity,
              child: Center(
                  child: Text(text, style: Theme.of(context)!.textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),)
              )
          )
      )
    );
  }
}
