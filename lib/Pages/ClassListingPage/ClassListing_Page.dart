import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_pathshala/controller/ClassListingController.dart';

class ClassListingPage extends StatelessWidget {
  final ClassListingController controller = Get.put(ClassListingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Classes')),
      body: Obx(() {
        if (controller.classes.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.classes.length,
            itemBuilder: (context, index) {
              var classData = controller.classes[index];
              return ListTile(
                leading: Image.network(classData['class_image']),
                title: Text(classData['title']),
                subtitle: Text('Time: ${classData['time']}, Teacher: ${classData['teacher_name']}'),
              );
            },
          );
        }
      }),
    );
  }
}