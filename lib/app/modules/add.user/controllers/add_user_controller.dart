import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testcasepttransisi/app/data/repository/api.repository.impl.dart';

class AddUserController extends GetxController {
  //TODO: Implement AddUserController
  final _apiRepositoryImpl = ApiRepositoryImpl();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  void addUser() async {
    var name = nameController.text;
    var job = jobController.text;
    try {
      var response = await _apiRepositoryImpl.addUser(name, job);
      log("Response $response");
    } catch (e) {
      log("Response $e");
    }
  }
}
