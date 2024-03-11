import 'package:dating_app/models/models.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            UserCard(
              user: User.users[0],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChoiceButton(
                    width: 60,
                    height: 60,
                    size: 25,
                    iconData: Icons.clear_rounded,
                    color: Colors.redAccent,
                    hasGradient: false,
                  ),
                  ChoiceButton(
                    width: 80,
                    height: 80,
                    size: 30,
                    iconData: Icons.favorite,
                    color: Colors.white,
                    hasGradient: true,
                  ),
                  ChoiceButton(
                    width: 60,
                    height: 60,
                    size: 25,
                    iconData: Icons.watch_later,
                    color: Colors.black,
                    hasGradient: false,
                  )
                ],
              ),
            ),

          ],
        ));
  }
}

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
        gradient: hasGradient ? LinearGradient(colors: [
          Theme.of(context).primaryColor,
          Colors.redAccent
        ]) : LinearGradient(colors: [
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
