import 'package:flutter/material.dart';

class KeyBoardButton extends StatelessWidget {
  const KeyBoardButton(
      {required this.buttonTitle, required this.onTap, Key? key})
      : super(key: key);
  final String buttonTitle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
