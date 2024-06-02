import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;
  setLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        setLoading(false);
        print("Successfully");
      } else {
        setLoading(false);
        print("Failed");
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
