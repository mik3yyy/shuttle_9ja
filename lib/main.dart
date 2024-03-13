import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/bloc/trip_bloc.dart';
import 'package:shuttle_9ja/cubit/book_cubit.dart';
import 'package:shuttle_9ja/observer.dart';
import 'package:shuttle_9ja/routres.dart';
import 'package:shuttle_9ja/screen/splash_screen.dart';
import 'package:shuttle_9ja/services/Hive/user_entity.dart';
import 'package:shuttle_9ja/settings/theme.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox('userBox');

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<userRepoImp>(create: (context) => userRepoImp()),
        RepositoryProvider<TripRepoImp>(create: (context) => TripRepoImp()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBlocBloc(userRepo: context.read<userRepoImp>()),
          ),
          BlocProvider(
            create: (context) =>
                TripBloc(tripRepoImp: context.read<TripRepoImp>()),
          ),
          BlocProvider(
            create: (context) =>
                BookCubit(tripRepoImp: context.read<TripRepoImp>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightTheme,
          darkTheme: darkTheme,
          routes: routes,
          initialRoute: SplashScreen.id,
          // home: SplashScreen(),
        ),
      ),
    );
  }
}
