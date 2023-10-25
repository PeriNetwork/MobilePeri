import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:peri_mobile_flutter/api/api_constants.dart';

import 'model/peri_user.dart';

final dio = Dio();
//final client = http.Client();

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

  static signUp(PeriUser user) async {
    try {
      var response = await dio.post(
        '${ApiConstants.baseURL}user/',
        data: {
          'name': user.name,
          'email': user.email,
          'password': user.password,
          'birth_date': user.birthDate,
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
    final url = Uri.parse('${ApiConstants.baseURL}user/email/$email');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = response.body;
      Map<String, dynamic> user = jsonDecode(data);
      print(user);
      print(user['name']);
      print(user['email']);
      PeriUser userLogged = PeriUser(
          nFollowers: user['nFollowers'],
          active: user['active'],
          id: user['id'],
          name: user['name'],
          email: user['email'],
          password: user['password'],
          birthDate: user['birth_date'],
          createdAt: user['created_at']);
      return userLogged;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
