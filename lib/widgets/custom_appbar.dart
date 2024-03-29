import 'package:dating_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasActions;
  final bool automaticallyImplyLeading;

  const CustomAppBar(
      {super.key,
      this.automaticallyImplyLeading = false,
      required this.title,
      this.hasActions = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading:
          automaticallyImplyLeading, // aksiyon varsa geri butonu olabilir
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        width: 250,
        child: Row(
          children: [
            Expanded(
              child: SvgPicture.asset(
                'assets/logo.svg',
                height: 50,
              ),
            ),
            Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),

      actions: hasActions
          ? [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message,
                      color: Theme.of(context).primaryColor)),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ProfileScreen.routeName);
                  },
                  icon: Icon(Icons.person,
                      color: Theme.of(context).primaryColor)),
            ]
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
