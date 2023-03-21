import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_search/app/modules/home/components/dynamic_grid.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Grid Word Search'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () => controller.reset(),
                  icon: const Icon(Icons.restore))
            ],
          ),
          body: gridViewBody(),
        ),
      ),
    );
  }

  Widget gridViewBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(child: Text('Enter the number of Rows:')),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: controller.rowController,
                  onChanged: (text) => controller.rowValueChanged(text),
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(counterText: ''),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(child: Text('Enter the number of Columns:')),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: controller.columnController,
                  onChanged: (text) => controller.columnValueChanged(text),
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(counterText: ''),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Expanded(child: Center(child: DynamicLetterGrid())),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(child: Text('Enter the word to search:')),
              GestureDetector(
                onTap: controller.checkGridEmpty,
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Obx(() {
                    return TextField(
                      controller: controller.searchWordController,
                      enabled: controller.wordSearchEnabled.value,
                      onTap: controller.checkGridEmpty,
                      onChanged: controller.searchWordValueChanged,
                      textAlign: TextAlign.center,
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
