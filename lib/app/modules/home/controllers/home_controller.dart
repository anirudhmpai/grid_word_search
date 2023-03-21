import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final rowCount = 0.obs;
  final columnCount = 0.obs;
  final wordSearchEnabled = false.obs;

  var rowController = TextEditingController();
  var columnController = TextEditingController();
  var searchWordController = TextEditingController();

  var gridItemControllers = List<TextEditingController>.empty();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  rowValueChanged(String text) {
    if (text.trim().isNotEmpty) {
      rowCount.value = int.parse(text);
    } else {
      rowCount.value = 0;
    }
    createDynamicGridItems();
    update();
  }

  columnValueChanged(String text) {
    if (text.trim().isNotEmpty) {
      columnCount.value = int.parse(text);
    } else {
      columnCount.value = 0;
    }
    createDynamicGridItems();
    update();
  }

  searchWordValueChanged(String text) {
    
  }

  reset() {
    rowCount.value = 0;
    columnCount.value = 0;
    rowController.text = '';
    columnController.text = '';
    searchWordController.text = '';
    update();
  }

  void checkGridEmpty() {
    if (rowCount > 2 && columnCount > 2) {
      var gridController = gridItemControllers.firstWhere(
        (element) => element.text.trim() == '',
        orElse: () => TextEditingController(text: 'Success'),
      );
      if (gridController.text != 'Success') {
        wordSearchEnabled.value = false;
        debugPrint('failed');
      } else {
        wordSearchEnabled.value = true;
        debugPrint('success');
      }
      update();
    }
  }

  void createDynamicGridItems() {
    if (rowCount > 2 && columnCount > 2) {
      gridItemControllers = List.generate(rowCount.value * columnCount.value,
          (index) => TextEditingController());
    }
  }
}
