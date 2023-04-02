import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import 'package:mvvm_sampler/users_list/models/user_model.dart';
import 'package:mvvm_sampler/users_list/repo/api_status.dart';

class UserServices {
  static Future<Object> getUser() async {
    try {
      final uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
      Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return Success(response: userModelFromJson(response.body));
      }

      return Failure(code: 100, errorResponse: "Invalid Response");
    } on HttpException {
      return Failure(code: 101, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: 102, errorResponse: "Invalid Format");
    } catch (error) {
      return Failure(code: 103, errorResponse: "Unkcown Error");
    }
  }
}
