import 'package:flutter/material.dart';

class SnapShotWaitingWidget extends StatelessWidget {
  const SnapShotWaitingWidget({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Center(
        child: CircularProgressIndicator(
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}
