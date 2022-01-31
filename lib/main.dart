import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/login.dart';
import 'package:graduation_project/models/dio.dart';
import 'package:graduation_project/layout/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()
          ..getProducts()
          ..getCategories(),
        child: BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
              print(AppCubit.get(context).categories);

              return MaterialApp(
                home: AnimatedSplashScreen(
                  splash: Image.asset("images/logoorange.png"),
                  nextScreen: Home(),
                  splashTransition: SplashTransition.rotationTransition,
                  backgroundColor: Colors.white,
                ),
                debugShowCheckedModeBanner: false,
              );
            }));
  }
}
