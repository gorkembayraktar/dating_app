import 'package:dating_app/models/models.dart';
import 'package:dating_app/widgets/choice_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

class UsersScreen extends StatelessWidget {
  static const String routeName = '/users';

  static Route route({required User user}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => UsersScreen(user: user)
    );
  }

  final User user;

  const UsersScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Set your color here
          onPressed: () => Navigator.pop(context),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Hero(
                      tag: 'user_image',
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            image: DecorationImage(
                                image: NetworkImage(user.imageUrls[0]),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ChoiceButton(
                              color: Colors.redAccent,
                              iconData: Icons.clear_rounded),
                          ChoiceButton(
                              height: 80,
                              width: 80,
                              size: 30,
                              hasGradient: true,
                              color: Colors.white,
                              iconData: Icons.favorite),
                          ChoiceButton(
                              color: Colors.redAccent,
                              iconData: Icons.watch_later),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name}, ${user.age}',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    user.jobTitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        !.copyWith(fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    'Hakkında',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                  ReadMoreText(
                    user.bio,
                    trimLines: 4,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'daha fazla göster',
                    trimExpandedText: 'daha az göster',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
                    delimiter: '    ',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold) ,
                  ),

                  SizedBox(height: 15,),
                  Text(
                    'İlgi Alanları',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                  Row(
                    children: user.interests.map((interest) =>
                        Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(
                            top: 5,
                            right: 5
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).primaryColor,
                                Colors.redAccent
                              ]
                            )
                          ),
                          child: Text(
                            interest,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white
                            ),
                          ),
                        )
                    ).toList(),
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
