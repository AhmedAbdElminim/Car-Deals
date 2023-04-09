import 'package:car_deals/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BadgeComponent extends StatelessWidget {
  const BadgeComponent({
    Key? key,
    required this.isFinished,
    required this.remainingDays,
    required this.child,
  }) : super(key: key);
  final bool isFinished;
  final String remainingDays;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 20, end: 30),
      badgeContent: isFinished
          ? const Icon(
              Icons.done_outline,
              color: Colors.white,
            )
          : Text(
              remainingDays,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.square,
        badgeColor: defaultColor,
        padding: const EdgeInsets.all(5),
        borderRadius: BorderRadius.circular(4),
        elevation: 0,
      ),
      child: child,
    );
  }
}
