import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_demo/riverpod_providers/providers_/state_notifier_provider.dart';
import 'package:state_management_demo/riverpod_providers/providers_/state_provider.dart';

class CounterWidgetStateNotifier extends ConsumerWidget{



  @override
  Widget build(BuildContext context, WidgetRef ref) {
   /// we add watch here so this whole class become listenable and rebuild whole
    /// but if use Consumer widget then only particular widget wil
    /// rebuild
    int count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Counter App'),),
      body:Center(child: Text(count.toString()),)
      ,
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}