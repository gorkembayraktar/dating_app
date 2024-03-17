import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final String text;
  final Function(bool?)? onChanged;

  const CustomCheckBox(
      {super.key,
      required this.text,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Text(
          text,
          style: Theme.of(context)
              .textTheme!
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
