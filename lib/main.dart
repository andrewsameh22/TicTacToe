import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/bloc/tictactoe_cubit.dart';
import 'package:tictactoe/screens/game_screen.dart';

void main() {
  runApp(TicTacToe());
}

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => tictactoeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GameScreen(),
      ),
    );
  }
}
