import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/observer.dart';
import 'package:shuttle_9ja/screen/splash_screen.dart';
import 'package:shuttle_9ja/settings/theme.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBlocBloc(userRepo: context.read<userRepoImp>()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightTheme,
          darkTheme: darkTheme,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
