import 'package:flutter/material.dart';
import 'package:car_deals/shared/style/colors.dart';

class CommentItemComponent extends StatelessWidget {
  const CommentItemComponent(
      {required this.userName, required this.userPrice, Key? key})
      : super(key: key);
  final String userName;
  final int userPrice;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: defaultColor,
        child: Center(
          child: Text(
            userName[0].toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      title: Text(
        userName,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey[700]),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          '$userPrice EGP',
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }
}
