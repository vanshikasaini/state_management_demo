import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

/// https://reqres.in/  got Apis
class AuthProvider with ChangeNotifier {
  bool _loading= false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {'email': email, 'password': password});

      if (response.statusCode==200){
        print("successfull");
        setLoading(false);
      }
      else{
        setLoading(false);

        print("Failed");
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
