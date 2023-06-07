//! FutureProvider
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dummy_weather_report.dart';

/// is the equivalent of Provider but for asynchronous code.
/// Used for:
/// --> performing  and caching asynchronous operations (such as network requests)
/// --> nicely handling error/loading states of asynchronous operations

// now data will not cache = if use autoDispose modifier
final weatherFutureProvider = FutureProvider.autoDispose<String>((ref) => fetchWeatherReport());