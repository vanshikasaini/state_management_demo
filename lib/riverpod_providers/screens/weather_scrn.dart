import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_demo/riverpod_providers/providers_/future_provider.dart';

class WeatherScreen extends ConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todays Weather'),),
      /// async value ka object return  till ) below line
      body: ref.watch(weatherFutureProvider)
          .when(data:
      (data) {
          return Center(
              child:Text(data,style: const TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.normal,
              color: Colors.red
          ),));
      },
          error: (error,stacktrace){
            return Text(error.toString());
          }, loading: (){
            return Center(child: const CircularProgressIndicator());
          }),
    );
  }


}