import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_demo/riverpod_providers/providers_/stream_provider.dart';

class NumberScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncValue = ref.watch(numbersStremProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Numbers'),
        ),
        body: asyncValue.when(data: (data) {
          return Center(
            child: Text(data.toString(),
                style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.red
                )),
          );
        }, error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        }, loading: () {
          Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
