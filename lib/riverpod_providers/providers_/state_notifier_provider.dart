// !StateNotifierProvider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_demo/riverpod_providers/providers_/counter_notifier.dart';

/// is a provider that is used to listen to and expose a StateNotifier
/// Used for
/// --> exposing an immutable state which can change over time after
/// reacting to custom events
/// --> centralizing the logic for modifying some state (business logic)
/// in a single place , improving maintainability over time.

final counterProvider = StateNotifierProvider<CounterNotifier,int>(
        (ref) {
          return CounterNotifier();
    });