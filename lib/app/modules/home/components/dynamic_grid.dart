import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_search/app/modules/home/components/grid_item.dart';
import 'package:grid_search/app/modules/home/controllers/home_controller.dart';

class DynamicLetterGrid extends StatelessWidget {
  const DynamicLetterGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Obx(
      () {
        if (controller.rowCount > 2 && controller.columnCount > 2) {
          return generateGrid(controller);
        } else {
          return const Text('enter both row and column counts greater than 2');
        }
      },
    );
  }

  Widget generateGrid(HomeController controller) {
    return Obx(() {
      return GridView.count(
        crossAxisCount: controller.columnCount.value,
        shrinkWrap: true,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: List.generate(
          controller.columnCount.value * controller.rowCount.value,
          (index) => GridItem(
            gridItemController: controller.gridItemControllers.elementAt(index),
            gridItemTextChanged: (_) {},
            shouldGlow: index % 8 == 0,
          ),
        ),
      );
    });
  }
}
