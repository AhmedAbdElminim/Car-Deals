import 'package:flutter/material.dart';
import 'package:car_deals/shared/style/colors.dart';

class CommentItemComponent extends StatelessWidget {
  const CommentItemComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: defaultColor,
        child: const Center(
          child: Text(
            'A',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      title: Text(
        'Ahmed AbdelMoniem',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey[700]),
      ),
      subtitle: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          '2500000 EGP',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }
}
