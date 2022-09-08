import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testcasepttransisi/app/data/model/user.model.dart';
import 'package:testcasepttransisi/app/routes/app_pages.dart';
import 'package:testcasepttransisi/app/style/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<Data>>(
        future: controller.getData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.network(
                "https://assets5.lottiefiles.com/packages/lf20_rwq6ciql.json",
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              Data _data = snapshot.data![index];
              return GestureDetector(
                onTap: () => Get.toNamed(Routes.DETAIL_USER, arguments: _data),
                child: CardList(
                    name:
                        _data.firstName.toString() + _data.lastName.toString(),
                    email: _data.email.toString(),
                    image: _data.avatar!,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_USER);
        },
        backgroundColor: ColorApps.kPrimaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  CardList({
    Key? key,
    required this.name,
    required this.image,
    required this.email,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  String image;
  String name, email;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenHeight * 0.01,
      ),
      width: double.infinity,
      height: screenHeight * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: screenWidth * 0.16,
                  height: screenHeight * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(image: NetworkImage(image)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.star_border_outlined)),
          ],
        ),
      ),
    );
  }
}
