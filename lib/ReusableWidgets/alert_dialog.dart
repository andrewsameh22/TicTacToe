import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/bloc/tictactoe_cubit.dart';

import '../bloc/tictactoe_state.dart';
import '../styles/colours.dart';

class CustomAlertDialog extends StatefulWidget {
  String title;
  String content;

  CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<tictactoeCubit, tictactoeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = tictactoeCubit.get(context);
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: secaccentColor,
          title: Text(
            widget.title,
            style: TextStyle(
                color: primaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          content: Text(
            widget.content,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: primaryColor,
                  child: Text(
                    "Play again",
                    style: TextStyle(
                      color: secaccentColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    cubit.initializeBoard();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
