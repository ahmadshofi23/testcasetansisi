import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:testcasepttransisi/app/data/model/user.model.dart';

class ApiService {
  final Dio _dio = Dio();
  // Response _response;
  final String _url = "https://reqres.in/api";

  Future<List<Data>> getuserList() async {
    try {
      final response = await _dio.get(
        "$_url/users?page=2",
        options: Options(method: "GET"),
      );
      final data = User.fromJson(response.data);
      return data.data!;
    } catch (e) {
      log("Error DIO $e");
      return Future.error(e);
    }
  }

  Future addUser(String name, String job) async {
    try {
      final response = await _dio
          .post("$_url/users", options: Options(method: "POST"), data: {
        "name": name,
        "job": job,
      });
      log("Response $response");
    } catch (e) {
      // log("Error DIO $e");
      return Future.error(e);
    }
  }
}
