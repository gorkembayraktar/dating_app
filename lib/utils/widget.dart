import 'package:flutter/material.dart';

void DisplayMessage(BuildContext context, String message){
  showDialog(context: context, builder:(context){
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(message),
    );
  });
}