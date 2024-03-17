import 'package:dating_app/cubits/signup/signup_cubit.dart';

import 'blocs/blocs.dart';
import 'repositories/repositories.dart';

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
            BlocProvider<SwipeBloc>(
              create: (context) => SwipeBloc()
                ..add(
                  LoadUsersEvent(users: User.users),
                ),
            ),
            BlocProvider(
              create: (context) =>
                  SignupCubit(authRepository: context.read<AuthRepository>()),
            ),
            BlocProvider(
              create: (context) => OnboardingBloc(
                databaseRepository: DatabaseRepository(),
                storageRepository: StorageRepository(),
              ),
            ),
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
            initialRoute: SplashScreen.routeName,
          )),
    );
  }
}
