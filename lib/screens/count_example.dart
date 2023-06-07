import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/providers/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    print(" from initState build only widgets");
    Timer.periodic(Duration(seconds: 2), (timer) {
      print(" from initState build only widgets");
countProvider.setCount();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    /// use listen : false to not reload whole build method, only consumer wrraped
    /// widgets will reload
    final countProvider = Provider.of<CountProvider>(context,listen: false);

    print("Build count Example class");
    return Scaffold(
      appBar: AppBar(
        title: Text("Provides"),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          print("build only widgets");
          return Text(
          //  countProvider.count.toString(),
           value.count.toString(),
            style: TextStyle(fontSize: 20.0),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
