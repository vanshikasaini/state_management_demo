// ! StreamProvider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_demo/riverpod_providers/dummy_fetch_numbers.dart';

/// is similar to FutureProvider but for Streams instead of Futures
/// Used for : listening to Firebase or web-sockets
///  rebuilding another every few seconds


final numbersStremProvider = StreamProvider<int>((ref) {
 return fetchNumbers();
});