import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grid_search/app/modules/home/components/search_logic.dart';

class HomeController extends GetxController {
  final rowCount = 0.obs;
  final columnCount = 0.obs;
  final wordSearchEnabled = false.obs;

  var rowController = TextEditingController();
  var columnController = TextEditingController();
  var searchWordController = TextEditingController();

  var gridItemControllers = List<TextEditingController>.empty();
  var grid = List<List<int>>.empty();
  RxList<int> gridSelectedIndexes = RxList<int>.empty();

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
    if (text.trim().isEmpty) {
      gridSelectedIndexes.clear();
      return;
    }
    createGrid(text);
  }

  reset() {
    columnController.text = '';
    columnCount.value = 0;
    grid = [];
    gridItemControllers = [];
    gridSelectedIndexes = RxList.empty();
    rowController.text = '';
    rowCount.value = 0;
    searchWordController.text = '';
    wordSearchEnabled.value = false;
    update();
  }

  checkGridEmpty() {
    if (rowCount > 2 && columnCount > 2) {
      var gridController = gridItemControllers.firstWhere(
        (element) => element.text.trim() == '',
        orElse: () => TextEditingController(text: 'Success'),
      );
      if (gridController.text != 'Success') {
        wordSearchEnabled.value = false;
        // debugPrint('failed');
      } else {
        wordSearchEnabled.value = true;
        if (searchWordController.text.isNotEmpty) {
          createGrid(searchWordController.text);
        }
        // debugPrint('success');
      }
      update();
    }
  }

  void createDynamicGridItems() {
    if (rowCount > 2 && columnCount > 2) {
      gridItemControllers = List.generate(rowCount.value * columnCount.value,
          (index) => TextEditingController());
    } else {
      gridItemControllers = [];
    }
  }

  void createGrid(String text) {
    grid = List.generate(
        rowCount.value,
        (rowIndex) => List.generate(
              columnCount.value,
              (columnIndex) {
                var index = (rowIndex * columnCount.value) + columnIndex;
                return gridItemControllers.elementAt(index).text.codeUnitAt(0);
              },
            ));
    gridSelectedIndexes.value = RxList.from(SearchLogic()
        .getAllCombos(grid, text, rowCount.value, columnCount.value));
    update();
    // debugPrint(grid.toString());
  }
}
