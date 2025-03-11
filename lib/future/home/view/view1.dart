import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapi/future/home/controller/home_controller.dart';

class View1 extends StatelessWidget {

 // const View1({super.key});

  final viewController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: Obx((){
        return ListView.builder(
            itemCount: viewController.newsList.length,
            itemBuilder: (_,index){


          return ListTile(
           // title: Text(viewController.newsList[index].articles.length),
          );
        });
      }),
    );
  }
}
