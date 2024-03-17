import 'package:dating_app/blocs/auth/auth_bloc.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/repositories/repositories.dart';
import 'package:dating_app/screens/onboarding/onboarding_screen.dart';
import 'package:dating_app/widgets/custom_appbar.dart';
import 'package:dating_app/widgets/custom_text_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) =>
            (BlocProvider.of<AuthBloc>(context).state.status ==
                    AuthStatus.unauthenticated)
                ? const OnboardingScreen()
                : const ProfileScreen());
  }

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profil',
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3, 3),
                            blurRadius: 3,
                            spreadRadius: 3)
                      ],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(user.imageUrls.first))),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColor.withOpacity(.1),
                            Theme.of(context).primaryColor.withOpacity(.9)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(user.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleWithIcon(title: 'Hakkında', icon: Icons.edit),
                  Text(
                    user.bio,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(height: 1.5),
                  ),
                  const TitleWithIcon(title: 'Fotoğraflar', icon: Icons.edit),
                  SizedBox(
                    height: 125,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: user.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 125,
                            width: 100,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(user.imageUrls[index]))),
                          );
                        }),
                  ),
                  const TitleWithIcon(title: 'Konum', icon: Icons.edit),
                  Text(
                    'Türkiye, İstanbul',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(height: 1.5),
                  ),
                  const TitleWithIcon(title: 'İlgi Alanları', icon: Icons.edit),
                  Row(
                      children: user.interests
                          .map(
                              (interest) => CustomTextContainer(text: interest))
                          .toList()),
                  TextButton(
                    onPressed: () {
                      RepositoryProvider.of<AuthRepository>(context).signOut();
                    },
                    child: Center(
                      child: Text(
                        'Çıkış yap',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const TitleWithIcon({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        IconButton(onPressed: () {}, icon: Icon(icon))
      ],
    );
  }
}
