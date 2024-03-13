import 'package:dating_app/models/models.dart';
import 'package:dating_app/screens/chat/chat_screen.dart';
import 'package:dating_app/widgets/custom_appbar.dart';
import 'package:dating_app/widgets/user_image_small.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {

  static const String routeName = '/matches';

  static Route route(){
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const MatchesScreen()
    );
  }

  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final inactiveMatches = UserMatch.matches.where((match) => match.userId == 1 && match.chat!.isEmpty).toList();
    final activeMatches = UserMatch.matches.where((match) => match.userId == 1 && match.chat!.isNotEmpty).toList();



    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Eşleşmeler',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Beğendiklerin', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: inactiveMatches.length,
                    itemBuilder:(context,index){
                      return Column(
                        children: [
                          UserImageSmall(
                              height: 70,
                              width: 70,
                              imageUrl: inactiveMatches[index].matchedUser.imageUrls.first),
                          Text(
                              inactiveMatches[index].matchedUser.name,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                          )

                        ],
                      );
                    }
                ) ,
              ),
              SizedBox(height: 10,),
              Text('Mesajlar', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
              ListView.builder(
                  itemCount: activeMatches.length,
                  itemBuilder: (context,index){
                    return  InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, ChatScreen.routeName, arguments: activeMatches[index]);
                      },
                      child: Row(
                        children: [
                          UserImageSmall(
                              imageUrl: activeMatches[index].matchedUser.imageUrls.first
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activeMatches[index].matchedUser.name,
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                activeMatches[index].chat![0].messages[0].message,
                                style: Theme.of(context).textTheme.bodySmall!,
                              ),
                              SizedBox(height: 5,),
                              Text(
                                activeMatches[index].chat![0].messages[0].timeString,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  shrinkWrap: true,

              )
            ],
          ),
        ),
      ),
    );
  }
}
