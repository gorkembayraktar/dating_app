import 'package:dating_app/blocs/swipe/swipe_bloc.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if(state is SwipeLoading ){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is SwipeLoaded){

            return Column(
              children: [
                Draggable(
                  child: UserCard(
                    user: state.users[0],
                  ),
                  feedback: UserCard(
                    user: state.users[0],
                  ),
                  childWhenDragging: UserCard(
                    user: state.users[1],
                  ),
                  onDragEnd: (drag){
                    if(drag.velocity.pixelsPerSecond.dx < 0){
                      context.read<SwipeBloc>()..add(SwipeLeftEvent(user: state.users[0]));

                      print('swiped left');
                    }else{
                      context.read<SwipeBloc>()..add(SwipeRightEvent(user: state.users[0]));

                      print('swiped right');
                    }
                  },
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const ChoiceButton(
                          width: 60,
                          height: 60,
                          size: 25,
                          iconData: Icons.clear_rounded,
                          color: Colors.redAccent,
                          hasGradient: false,
                        ),
                        onTap: (){
                          context.read<SwipeBloc>()..add(SwipeLeftEvent(user: state.users[0]));
                        },
                      ),
                      InkWell(
                        child: const ChoiceButton(
                          width: 80,
                          height: 80,
                          size: 30,
                          iconData: Icons.favorite,
                          color: Colors.white,
                          hasGradient: true,
                        ),
                        onTap: (){
                          context.read<SwipeBloc>()..add(SwipeRightEvent(user: state.users[0]));
                        },
                      ),
                      ChoiceButton(
                        width: 60,
                        height: 60,
                        size: 25,
                        iconData: Icons.watch_later,
                        color: Colors.black,
                        hasGradient: false,
                      )
                    ],
                  ),
                ),
              ],
            );
          }else{
            return Text('Bir şeyler ters gitmiş olmalı.');
          }
        }
        )

    );
  }

  Widget columnItems(context, SwipeLoaded state){
      return Column(
        children: [
          Draggable(
            child: UserCard(
              user: state.users.first,
            ),
            feedback: UserCard(
              user: state.users.first,
            ),
            childWhenDragging: UserCard(
              user: state.users[1],
            ),
            onDragEnd: (drag){
              if(drag.velocity.pixelsPerSecond.dx < 0){
                context.read<SwipeBloc>()..add(SwipeLeftEvent(user: state.users[0]));

                print('swiped left');
              }else{
                context.read<SwipeBloc>()..add(SwipeRightEvent(user: state.users[0]));

                print('swiped right');
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceButton(
                  width: 60,
                  height: 60,
                  size: 25,
                  iconData: Icons.clear_rounded,
                  color: Colors.redAccent,
                  hasGradient: false,
                ),
                ChoiceButton(
                  width: 80,
                  height: 80,
                  size: 30,
                  iconData: Icons.favorite,
                  color: Colors.white,
                  hasGradient: true,
                ),
                ChoiceButton(
                  width: 60,
                  height: 60,
                  size: 25,
                  iconData: Icons.watch_later,
                  color: Colors.black,
                  hasGradient: false,
                )
              ],
            ),
          ),
        ],
      );
  }
}

