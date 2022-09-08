import 'dart:developer';

import 'package:get/get.dart';
import 'package:testcasepttransisi/app/data/model/user.model.dart';
import 'package:testcasepttransisi/app/data/repository/api.repository.impl.dart';

class HomeController extends GetxController {
  final ApiRepositoryImpl _apiRepositoryImpl = ApiRepositoryImpl();

  Future<List<Data>> getData() async {
    var data = await _apiRepositoryImpl.fetchUserList();

    return data;
  }
}
