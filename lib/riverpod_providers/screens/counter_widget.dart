import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_demo/riverpod_providers/providers_/state_provider.dart';

class CounterWidget extends ConsumerWidget{



  @override
  Widget build(BuildContext context, WidgetRef ref) {
/// we can get value from stateProvider using Consumer widget
   // int count = ref.read(counterStateProvider);

   return Scaffold(
     appBar: AppBar(title: Text('Counter App'),),
     body: Consumer(
       builder: (BuildContext context, WidgetRef ref, Widget? child)
       {
         /// watch se access value first time it will make Consumer widget as listenable
         /// to this state encapsulated into stateProvider
         /// means it will rebuild the Consumer widget whenever data will be changed
         int count = ref.watch(counterStateProvider);
         return Center(
           child: Text(count.toString(),
               style:const TextStyle(
                   fontSize: 48.0,
                   fontWeight: FontWeight.normal,
                   color: Colors.red
               )),
         );

       },
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         /// with read meethod now this widget will not rebuild it only reads the state
         ///
         ref.read(counterStateProvider.notifier).state++;
       },
       child: const Icon(Icons.add),
     ),
   );
  }

}