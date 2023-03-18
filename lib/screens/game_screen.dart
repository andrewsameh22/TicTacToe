import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/bloc/tictactoe_cubit.dart';
import 'package:tictactoe/bloc/tictactoe_state.dart';

import '../styles/colours.dart';

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<tictactoeCubit, tictactoeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = tictactoeCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int j = 0; j < 3; j++)
                            Container(
                              width: 100,
                              height: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 5,
                                  color: primaryColor,
                                ),
                              ),
                              child: Center(
                                child: MaterialButton(
                                  onPressed: () =>
                                      cubit.makeMove(i, j, context),
                                  child: Center(
                                    child: Text(
                                      cubit.board[i][j],
                                      style: GoogleFonts.coiny(
                                        textStyle: TextStyle(
                                          fontSize: 60,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                ),
                Text(
                  'Reset',
                  style: TextStyle(
                    color: secondaryColor,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    cubit.initializeBoard();
                    cubit.emit(TicReset());
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Icon(
                    Icons.restart_alt_sharp,
                    color: accentColor,
                    size: 40.0,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
