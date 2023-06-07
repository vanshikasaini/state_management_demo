import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int>{
 // CounterNotifier(super.state);
  ///initial state dedi ya constructor me pass kardo
  CounterNotifier() : super(0);

  void increment(){
    state = state +1;
  }


}