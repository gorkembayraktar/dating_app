import 'package:dating_app/blocs/swipe/swipe_bloc.dart';
import 'package:dating_app/config/app_router.dart';
import 'package:dating_app/firebase_options.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider<SwipeBloc>(create: (_) => SwipeBloc()..add(LoadUsersEvent(users: User.users)))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dating App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          //home: const HomeScreen(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: OnboardingScreen.routeName,
        )
    );

  }
}
