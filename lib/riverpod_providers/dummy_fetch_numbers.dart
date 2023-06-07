Stream<int> fetchNumbers() {
  return Stream<int>
      .periodic(Duration(seconds: 2),
          (num) => num)
      .take(200);
}
