import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/favourites/favourite_screens/favourite_screen.dart';
import 'package:state_management_demo/providers/auth_provider.dart';
import 'package:state_management_demo/providers/count_provider.dart';
import 'package:state_management_demo/providers/example_one_provider.dart';
import 'package:state_management_demo/providers/favourite_providers.dart';
import 'package:state_management_demo/providers/theme_change_provider.dart';
import 'package:state_management_demo/screens/count_example.dart';
import 'package:state_management_demo/screens/dark_theme.dart';
import 'package:state_management_demo/screens/example_one.dart';
import 'package:state_management_demo/screens/login_screen.dart';
import 'package:state_management_demo/screens/value_notify_listener.dart';

import 'favourites/favourite_screens/favourite_screen_wprovider.dart';

void main() {
  runApp(const MyApp());
}

/// Multiple Provider
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouritesProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),

      ]
          , /// Used Builder for theme Provider
          child: Builder(builder: (BuildContext context) {
            final themeChanger = Provider.of<ThemeChangeProvider>(context);

            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                themeMode: themeChanger.themeMode,
                theme: ThemeData(
                  // This is the theme of your application.
                  //
                  // Try running your application with "flutter run". You'll see the
                  // application has a blue toolbar. Then, without quitting the app, try
                  // changing the primarySwatch below to Colors.green and then invoke
                  // "hot reload" (press "r" in the console where you ran "flutter run",
                  // or simply save your changes to "hot reload" in a Flutter IDE).
                  // Notice that the counter didn't reset back to zero; the application
                  // is not restarted.
                  brightness: Brightness.light,
                  primarySwatch: Colors.red,
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.yellow,
                  primaryColor: Colors.purple,
                  appBarTheme: AppBarTheme(
                    backgroundColor: Colors.teal
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.pink
                  )
                ),
                //   home: CountExample(),
                //  home: ExampleOneScreen(),
                //  home: FavouritesScreen(),
                // home: FavouritesScren_Pro(),
               // home: DarkThemeScreen(),
                //home: NotifyListenerScreen(),
                home: LoginScreen(),
              );
          },)
      );
  }
}

/// Single Provider
class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        //   home: CountExample(),
        home: ExampleOneScreen(),
      ),
    );
  }
}


