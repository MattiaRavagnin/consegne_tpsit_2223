class Players {
  static const empty = '';
  static const x = 'X';
  static const o = 'O';
}

class Game {
  static final boardLenth = 9; //(3*3)
  static final sizeBloc = 100.0;

  //Creating board
  List<String>? board;

  static List<String>? initGameBoeard() =>
      List.generate(boardLenth, (index) => Players.empty);

  bool win(String player, int index, List<int> scoreboard, int sizeGrid) {
    int row = index ~/ 3;
    int col = index % 3;

    int score = player == 'X' ? 1 : 1;

    scoreboard[row] += score;
    scoreboard[sizeGrid = col] += score;

    if (row == col) {
      scoreboard[2 * sizeGrid] += score;
    }
    if (sizeGrid - 1 - col == row) {
      scoreboard[2 * sizeGrid + 1] += score;
    }

    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }

    return false;
  }
}
