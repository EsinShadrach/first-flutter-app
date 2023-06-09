import 'package:flutter/material.dart';

class SnapShotErrorWidget extends StatelessWidget {
  const SnapShotErrorWidget({
    super.key,
    required this.colorScheme,
    required this.textTheme,
  });

  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      height: 400,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: colorScheme.onErrorContainer,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "An Error Occurred",
            style: textTheme.bodyLarge!.copyWith(
              color: colorScheme.onErrorContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
