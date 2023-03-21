import 'package:flutter/material.dart';

class SearchLogic {
  final List<int> x = [-1, -1, -1, 0, 0, 1, 1, 1];
  final List<int> y = [-1, 0, 1, -1, 1, -1, 0, 1];
  List<int> indexes = [];

  bool searchGrid(
      List<List<int>> grid, int row, int col, String word, int r, int c) {
    indexes = [];
    if (grid[row][col] != word.codeUnitAt(0)) {
      indexes = [];
      return false;
    }
    int len = word.length;
    // debugPrint('initial -> row($row) column($col)');
    for (int dir = 0; dir < 8; dir++) {
      int k;
      int rd = (row + x[dir]);
      int cd = (col + y[dir]);
      // debugPrint('combination -> $rd $cd');
      for ((k = 1); k < len; k++) {
        if ((((rd >= r) || (rd < 0)) || (cd >= c)) || (cd < 0)) {
          break;
        }
        if (grid[rd][cd] != word.codeUnitAt(k)) {
          break;
        }
        // debugPrint('loop -> row($rd) column($cd)');
        indexes.add(getIndex(rd, cd, c));
        rd += x[dir];
        cd += y[dir];
      }
      if (k == len) {
        // debugPrint('final -> row(${rd}) column(${cd})');
        indexes.add(getIndex(row, col, c));
        debugPrint(indexes.toString());
        return true;
      } else {
        indexes = [];
      }
    }
    indexes = [];
    return false;
  }

  List<int> searchGridWord(List<List<int>> grid, String word, int r, int c) {
    for (int row = 0; row < r; row++) {
      for (int col = 0; col < c; col++) {
        if ((grid[row][col] == word.codeUnitAt(0)) &&
            searchGrid(grid, row, col, word, r, c)) {
          // Get.snackbar("Found", indexes.toString(),
          //     backgroundColor: Colors.blueGrey);
          return indexes;
        }
      }
    }
    return [];
  }

  int getIndex(int row, int column, int columnCount) {
    return (row * columnCount) + column;
  }
}
