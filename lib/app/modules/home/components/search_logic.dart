class SearchLogic {
  final List<int> x = [-1, -1, -1, 0, 0, 1, 1, 1];
  final List<int> y = [-1, 0, 1, -1, 1, -1, 0, 1];
  List<int> indexes = [];

  List<int> allIndexes = [];

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
      indexes = [];
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
        allIndexes.addAll(indexes);
        // debugPrint(indexes.toString());
        // return true;
      } else {
        indexes = [];
      }
    }
    indexes = [];
    return false;
  }

  void searchGridWord(List<List<int>> grid, String word, int r, int c) {
    allIndexes = [];
    for (int row = 0; row < r; row++) {
      for (int col = 0; col < c; col++) {
        var searchGridBool = searchGrid(grid, row, col, word, r, c);
        if ((grid[row][col] == word.codeUnitAt(0)) && searchGridBool) {
          // Get.snackbar("Found", indexes.toString(),
          //     backgroundColor: Colors.blueGrey);
          indexes = [];
        }
      }
    }
    // debugPrint(allIndexes.toString());
  }

  List<int> getAllCombos(List<List<int>> grid, String word, int r, int c) {
    searchGridWord(grid, word, r, c);
    return allIndexes;
  }

  int getIndex(int row, int column, int columnCount) {
    return (row * columnCount) + column;
  }
}
