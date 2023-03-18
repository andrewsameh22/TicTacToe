import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ReusableWidgets/alert_dialog.dart';
import 'tictactoe_state.dart';

class tictactoeCubit extends Cubit<tictactoeStates> {
  tictactoeCubit() : super(TicInitial());
  static tictactoeCubit get(context) => BlocProvider.of(context);

  List<List<String>> board =
      List.generate(3, (_) => List.generate(3, (_) => ""));
  String currentPlayer = '';

  void initializeBoard() {
    board = List.generate(3, (_) => List.generate(3, (_) => ""));
    currentPlayer = "X";
    emit(TicReset());
  }

  void makeMove(int row, int col, context) {
    // print('makemove');
    if (board[row][col] == "") {
      board[row][col] = currentPlayer;
      currentPlayer = (currentPlayer == "X") ? "O" : "X";
      emit(TicWinner());
      String winner = checkWinner(board);
      if (winner != "") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              title: 'Winner',
              content: "Player $winner has won the game!",
            );
          },
        );
      } else if (board.every((row) => row.every((cell) => cell != ""))) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              title: 'Draw',
              content: "The game is a draw!",
            );
          },
        );
      }
    }
  }

  String checkWinner(List<List<String>> board) {
    // Check rows for a win
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0] != "") {
        return board[i][0];
      }
    }

    // Check columns for a win
    for (int i = 0; i < 3; i++) {
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i] != "") {
        return board[0][i];
      }
    }

    // Check diagonals for a win
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0] != "") {
      return board[0][0];
    }
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2] != "") {
      return board[0][2];
    }

    return "";
  }
}
