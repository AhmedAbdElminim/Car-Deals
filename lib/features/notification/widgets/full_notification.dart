import 'package:flutter/material.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/style/colors.dart';

class FullNotification extends StatelessWidget {
  const FullNotification(
      {required this.content,
      required this.senderName,
      required this.index,
      Key? key})
      : super(key: key);
  final String content;
  final String senderName;
  final int index;
  final String x =
      'We have received your\nrequest to inspect your car\nand present it to the application\nfor sale.Accordingly,\nwe have scheduled an appointment\nto have your car checked out on day\n(10-11-2022 , 10:00 AM)\nlocation:10 str,nasr city,cairo,egypt';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: defaultColor,
                child: Center(
                  child: Text(
                    '$index',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      senderName,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      content,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[600],
          )
        ],
      ),
    );
  }
}
