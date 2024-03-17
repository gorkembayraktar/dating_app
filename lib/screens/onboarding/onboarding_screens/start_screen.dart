import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Start extends StatelessWidget {
  final TabController tabController;
  const Start({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/couple.png"),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Kıvılcım\'a Hoşgeldiniz',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Aşkın ve mutluluğun alevini burada yakalayın. Birlikteliğe uzanan yolculuğunuzda size rehberlik edeceğiz.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.8,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            CustomButton(
              tabController: tabController,
              text: 'Başla',
            )
          ],
        ));
  }
}
