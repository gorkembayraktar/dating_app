import 'package:dating_app/models/models.dart';
import 'package:dating_app/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatelessWidget {

  static const String routeName = '/chat';

  static Route route({required UserMatch userMatch}){
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => ChatScreen(userMatch: userMatch,)
    );
  }

  final UserMatch userMatch;


  const ChatScreen({super.key, required this.userMatch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor
          ),
          title: Column(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(userMatch.matchedUser.imageUrls.first),
              ),
              Text(userMatch.matchedUser.name, style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: userMatch.chat != null
                ? Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: userMatch.chat![0].messages.length,
                      itemBuilder: (context, index){
                          final message = userMatch.chat![0].messages[index];

                          return ListTile(
                            title: message.senderId == 1 ?
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200]
                                  ),
                                  child: Text(message.message, style: Theme.of(context).textTheme.bodyMedium,)),
                            )
                              : Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage: NetworkImage(
                                      userMatch.matchedUser.imageUrls.first
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.black54
                                      ),
                                      child: Text(message.message,
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),)),
                                ],
                              ),
                            )
                          );
                      }
                  ),
                )
                  : SizedBox(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54,
                  ),
                  child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.send_outlined, color: Colors.white,)
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Bir şeyler yaz..',
                      contentPadding: const EdgeInsets.only(left: 20, bottom:5, top: 5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white
                        )
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
