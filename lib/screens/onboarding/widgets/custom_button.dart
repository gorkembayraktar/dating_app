import 'package:dating_app/utils/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String text;
  const CustomButton({super.key,
    required this.tabController, required this.text,
    this.emailController,
    this.passwordController
  });

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
          onPressed: () async {

            if(emailController != null && passwordController != null){
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController!.text,
                    password: passwordController!.text
                );
                tabController.animateTo(tabController.index + 1);
              } on FirebaseAuthException catch(e){
                var codes = {
                  'email-already-in-use': 'Email adresi zaten kullanılıyor',
                  'weak-password': 'En az 6 karakterli şifre giriniz',
                  'invalid-email': 'Email adresi geçersiz!',
                  'invalid-credential': 'Email adresi veya şifre hatalı.'
                };
                DisplayMessage(context, codes.containsKey(e.code) ?
                codes[e.code].toString() :
                e.code);
              }
            }


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
