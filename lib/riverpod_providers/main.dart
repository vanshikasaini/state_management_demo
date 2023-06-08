import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_demo/riverpod_providers/screens/counter_widget.dart';
import 'package:state_management_demo/riverpod_providers/screens/counter_widget_state)notifier.dart';
import 'package:state_management_demo/riverpod_providers/screens/home_scrn.dart';
import 'package:state_management_demo/riverpod_providers/screens/number_scrn.dart';
import 'package:state_management_demo/riverpod_providers/screens/weather_scrn.dart';

void main(){
  /// ProviderScope stores sttes of all other providers so that
  /// inside tree can use states of provider
  runApp(ProviderScope(child: RiverpodApp()));
}

class RiverpodApp extends StatelessWidget {
  const RiverpodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //  home: HomeScreen(),
     // home: CounterWidget(),
     // home: Myapp(),
      home: MyStateNotifierProviderApp(),
     // home: MyStreamApp(),
    );
  }
}

/// StateNotifierProvider class
class MyStateNotifierProviderApp extends StatelessWidget {
  const MyStateNotifierProviderApp({Key? key}) : super(key: key);
  Widget _buildButton(BuildContext context){
    return ElevatedButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => CounterWidgetStateNotifier()));
        },
        child: Text("StateNotifierProvider"));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _buildButton(context),
      ),
    );
  }
}

/// Streamprovider class
class MyStreamApp extends StatelessWidget {
  const MyStreamApp({Key? key}) : super(key: key);
  Widget _buildButton(BuildContext context){
    return ElevatedButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => NumberScreen()));
        },
        child: Text("StreamProvider"));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _buildButton(context),
      ),
    );
  }
}

/// FutureProvider class

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);
Widget _buildButton(BuildContext context){
  return ElevatedButton(
      onPressed: (){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => WeatherScreen()));
      },
      child: Text("FutureProvider"));
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _buildButton(context),
      ),
    );
  }
}
