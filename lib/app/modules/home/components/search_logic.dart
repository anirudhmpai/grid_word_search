import 'package:flutter/foundation.dart';

class GFG {
  int r = 0;
  int c = 0;
  final List<int> x = [-1, -1, -1, 0, 0, 1, 1, 1];
  final List<int> y = [-1, 0, 1, -1, 1, -1, 0, 1];

  bool search2D(List<List<int>> grid, int row, int col, String word) {
    if (grid[row][col] != word.codeUnitAt(0)) {
      return false;
    }
    int len = word.length;
    for (int dir = 0; dir < 8; dir++) {
      int k;
      int rd = (row + x[dir]);
      int cd = (col + y[dir]);
      for ((k = 1); k < len; k++) {
        if ((((rd >= r) || (rd < 0)) || (cd >= c)) || (cd < 0)) {
          break;
        }
        if (grid[rd][cd] != word.codeUnitAt(k)) {
          break;
        }
        rd += x[dir];
        cd += y[dir];
      }
      if (k == len) {
        return true;
      }
    }
    return false;
  }

  void patternSearch(List<List<int>> grid, String word) {
    for (int row = 0; row < r; row++) {
      for (int col = 0; col < c; col++) {
        if ((grid[row][col] == word.codeUnitAt(0)) &&
            search2D(grid, row, col, word)) {
          debugPrint(("${"pattern found at $row"}, ") + col.toString());
        }
      }
    }
  }
}

void main(List<String> args) {
  int r = 3;
  int c = 13;
  List<List<int>> grid = [
    [
      'G'.codeUnitAt(0),
      'E'.codeUnitAt(0),
      'E'.codeUnitAt(0),
      'K'.codeUnitAt(0),
      'S'.codeUnitAt(0),
      'F'.codeUnitAt(0),
      'O'.codeUnitAt(0),
      'R'.codeUnitAt(0),
      'G'.codeUnitAt(0),
      'E'.codeUnitAt(0),
      'E'.codeUnitAt(0),
      'K'.codeUnitAt(0),
      'S'.codeUnitAt(0)
    ],
    [
      'G'.codeUnitAt(0),
      'E'.codeUnitAt(0),
      'E'.codeUnitAt(0),
      'K'.codeUnitAt(0),
      'S'.codeUnitAt(0),
      'Q'.codeUnitAt(0),
      'U'.codeUnitAt(0),
      'I'.codeUnitAt(0),
      'Z'.codeUnitAt(0),
      'G'.codeUnitAt(0),
      'E'.codeUnitAt(0),
      'E'.codeUnitAt(0),
      'K'.codeUnitAt(0)
    ],
    [
      'I'.codeUnitAt(0),
      'D'.codeUnitAt(0),
      'E'.codeUnitAt(0),
      'Q'.codeUnitAt(0),
      'A'.codeUnitAt(0),
      'P'.codeUnitAt(0),
      'R'.codeUnitAt(0),
      'A'.codeUnitAt(0),
      'C'.codeUnitAt(0),
      'T'.codeUnitAt(0),
      'I'.codeUnitAt(0),
      'C'.codeUnitAt(0),
      'E'.codeUnitAt(0)
    ]
  ];
  GFG().patternSearch(grid, "GEEKS");
  GFG().patternSearch(grid, "EEE");
}
