import 'package:dio/dio.dart';
import 'package:peri_mobile_flutter/api/api_constants.dart';

final dio = Dio(); 

class ApiService {
    static login(String email, String password) async {
    try {
      var response = await dio.post(
        '${ApiConstants.baseURL}user/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response.statusCode;
    } on DioException catch (e) {
      print(e.message);
      return 400;
    }
  }

  static createPost(String title, String description) async {
    try {
      var response = await dio.post(
        '${ApiConstants.baseURL}post',
        data: {
          'title': title,
          'description': description,
        },
      );
      return response.statusCode;
    } on DioException catch (e) {
      print(e.message);
      print("\nNão foi possivel criar post...");
      return 400;
    }
  }

  static getUserByEmail(String email) async {
    try {
      var response = await dio.get(
        '${ApiConstants.baseURL}user/email/$email',
      );
      return response.data;
    } on DioException catch (e) {
      print(e.message);
      return 400;
    }
  }
}