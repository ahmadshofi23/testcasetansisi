import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testcasepttransisi/app/style/colors.dart';

import '../controllers/add_user_controller.dart';

class AddUserView extends GetView<AddUserController> {
  const AddUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFromFieldCustome(
              controller: controller.nameController,
              name: "Name",
            ),
            SizedBox(height: screenHeight * 0.01),
            TextFromFieldCustome(
              controller: controller.jobController,
              name: "Job",
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorApps.kPrimaryColor,
                ),
                onPressed: () {
                  controller.addUser();
                },
                child: Text(
                  "Save Data",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: ColorApps.kWhiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
}

class TextFromFieldCustome extends StatelessWidget {
  TextFromFieldCustome({
    required this.controller,
    required this.name,
    Key? key,
  }) : super(key: key);
  String name;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: name,
        prefixIcon: const Icon(
          Icons.people,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
