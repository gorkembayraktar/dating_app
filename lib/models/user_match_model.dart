import 'package:dating_app/models/models.dart';
import 'package:equatable/equatable.dart';

class UserMatch extends Equatable{
  final int id;
  final int userId;
  final User matchedUser;
  final List<Chat>? chat;

  const UserMatch({
      required this.id,
      required this.userId,
      required this.matchedUser,
      required this.chat
  });
  @override
  List<Object?> get props => [id, userId, matchedUser];


  static List<UserMatch> matches = [
      UserMatch(
          id: 1,
          userId: 1,
          matchedUser: User.users[1],
          chat: Chat.chats.where(
                  (chat) => chat.userId == 1 && chat.matchedUserId == 2
          ).toList()
      ),
      UserMatch(
          id: 2,
          userId: 1,
          matchedUser: User.users[2],
          chat: Chat.chats.where(
                  (chat) => chat.userId == 1 && chat.matchedUserId == 3
          ).toList()
      ),
      UserMatch(
          id: 2,
          userId: 1,
          matchedUser: User.users[3],
          chat: Chat.chats.where(
                  (chat) => chat.userId == 1 && chat.matchedUserId == 4
          ).toList()
      ),
      UserMatch(
          id: 2,
          userId: 1,
          matchedUser: User.users[4],
          chat: Chat.chats.where(
                  (chat) => chat.userId == 1 && chat.matchedUserId == 5
          ).toList()
      )
  ];

}