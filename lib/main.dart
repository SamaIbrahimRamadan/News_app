import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/settings/api/dio.dart';
import 'package:news_app/settings/cache.dart';
import 'package:news_app/settings/cubit/news_cubit.dart';

import 'Screens/bottomBar.dart';
import 'settings/cubit/bloc_Observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //بحطها لما ال  main تبقي   async
  await Cache.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getData()
        ..getSearch(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                textTheme: const TextTheme(
                    bodyText1: TextStyle(fontSize: 18, color: Colors.black)),
                canvasColor: Colors.white,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 30,
                    selectedItemColor: Colors.deepOrange),
                appBarTheme: const AppBarTheme(
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    iconTheme: IconThemeData(color: Colors.black),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark))),
            darkTheme: ThemeData(
                iconTheme: const IconThemeData(color: Colors.white),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(fontSize: 18, color: Colors.white)),
                scaffoldBackgroundColor: HexColor('333739'),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    unselectedItemColor: Colors.grey,
                    backgroundColor: HexColor('333739'),
                    type: BottomNavigationBarType.fixed,
                    elevation: 30,
                    selectedItemColor: Colors.deepOrange),
                appBarTheme: AppBarTheme(
                    titleTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    backgroundColor: HexColor('333739'),
                    elevation: 0,
                    iconTheme: IconThemeData(
                      color: HexColor('333739'),
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light))),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const BottomBar(),
          );
        },
      ),
    );
  }
}
