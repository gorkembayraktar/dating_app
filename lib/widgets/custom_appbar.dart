
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Row(
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
                'KEŞFET',
                style: Theme.of(context).textTheme.headlineMedium,
              ))
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.message, color: Theme.of(context).primaryColor)),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: Theme.of(context).primaryColor)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
