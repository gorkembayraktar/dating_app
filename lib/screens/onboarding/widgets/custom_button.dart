import 'package:dating_app/blocs/blocs.dart';
import 'package:dating_app/cubits/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/models/user_model.dart' as MyUser;

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  const CustomButton({
    super.key,
    required this.tabController,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Colors.redAccent])),
        child: ElevatedButton(
            onPressed: () async {
              print('index' + tabController.index.toString());

              if (tabController.index == 1) {
                final signupCubit = context.read<SignupCubit>();
                await signupCubit.signupWithCredentials();

                if (signupCubit.state.user != null) {
                  MyUser.User user = MyUser.User(
                    id: context.read<SignupCubit>().state.user!.uid,
                    name: '',
                    age: 0,
                    gender: '',
                    interests: [],
                    imageUrls: [],
                    jobTitle: '',
                    location: '',
                    bio: '',
                  );

                  context.read<OnboardingBloc>().add(
                        StartOnboarding(
                          user: user,
                        ),
                      );

                  tabController.animateTo(tabController.index + 1);
                }
              } else {
                if (tabController.index + 1 < tabController.length) {
                  tabController.animateTo(tabController.index + 1);
                } else {
                  Navigator.pushNamed(context, '/');
                }
              }

              /*
            var codes = {
                  'email-already-in-use': 'Email adresi zaten kullanılıyor',
                  'weak-password': 'En az 6 karakterli şifre giriniz',
                  'invalid-email': 'Email adresi geçersiz!',
                  'invalid-credential': 'Email adresi veya şifre hatalı.'
                };
                DisplayMessage(context, codes.containsKey(e.code) ?
                codes[e.code].toString() :
                e.code);
             */
            },
            style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: Colors.transparent),
            child: Container(
                width: double.infinity,
                child: Center(
                    child: Text(
                  text,
                  style: Theme.of(context)!.textTheme.headlineSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )))));
  }
}
