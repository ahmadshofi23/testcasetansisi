import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testcasepttransisi/app/data/model/user.model.dart';
import 'package:testcasepttransisi/app/style/colors.dart';

import '../controllers/detail_user_controller.dart';

class DetailUserView extends GetView<DetailUserController> {
  const DetailUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Data _data = Get.arguments;
    log(_data.toString());

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail User'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.33,
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                  color: ColorApps.kPrimaryColor,
                  image: DecorationImage(
                      image: NetworkImage(
                        _data.avatar!,
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "${_data.firstName!} ${_data.lastName!}",
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: ColorApps.kPrimaryColor,
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _data.email!,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
