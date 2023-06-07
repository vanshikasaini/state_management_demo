import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_demo/riverpod_providers/providers_/provider_river.dart';

/// to use ref inside the tree
class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
/// only read the value of provider as not make it listenable
    /// if provider will change data it will  not notify
    String str= ref.read(stringProvider);

    return Scaffold(
      body: Center(
        child: Text(str,style: const TextStyle(
          fontSize: 48.0,
          fontWeight: FontWeight.normal,
          color: Colors.red
        ),)
      ),
    );
  }
}
