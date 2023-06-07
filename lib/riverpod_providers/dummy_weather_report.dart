
Future<String> fetchWeatherReport() async{
  return await Future.delayed(
    Duration(seconds: 3),() => '33 C'
  );
}