import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/providers/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({Key? key}) : super(key: key);

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  // double value = 1.0;
  /// whole widget is rebuild 1)
//   @override
//   Widget build(BuildContext context) {
//
//
//     print("build");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Example One")),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [Slider(
//               min: 0,max: 1,
//               value: provider.value, onChanged: (val) {
  // print(value);
  // value=val;
//
//
  // setState(() {
  //
  // });
//           }),
//           Row(children: [
//             Expanded(
//               child: Container(height: 100,
//               decoration: BoxDecoration(
//                 color: Colors.yellow.withOpacity(value)
//               ),
//               child: Center(
//                 child: Text("Container 1"),
//               ),),
//             ),
//             Expanded(
//               child: Container(height: 100,
//                 decoration: BoxDecoration(
//                     color: Colors.green.withOpacity(value)
//                 ),
//                 child: Center(
//                   child: Text("Container 1"),
//                 ),),
//             )
//           ],)],
//         ),
//
//     );
//   }

  /// AFTER USING PROvider
  @override
  Widget build(BuildContext context) {
   // final provider = Provider.of<ExampleOneProvider>(context, listen: true);

    print("build");
    return Scaffold(
        appBar: AppBar(title: Text("Example One")),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  //   value: provider.value, onChanged: (val) {
                  // print( "=====${provider.value}");
                  print("=====${value.value}");
                //  provider.setValueP(val);
                  value.setValueP(val);
                });
          }),
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    //  color: Colors.yellow.withOpacity(provider.value)),
                      color: Colors.yellow.withOpacity(value.value)),
                  child: Center(
                    child: Text("Container 1"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value)),
                   //   color: Colors.green.withOpacity(provider.value)),
                  child: Center(
                    child: Text("Container 1"),
                  ),
                ),
              )
            ]);
          })
        ]));
  }
}
