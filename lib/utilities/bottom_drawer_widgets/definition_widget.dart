import 'package:flutter/material.dart';

class DefinitionWidget extends StatelessWidget {
  const DefinitionWidget({
    super.key,
    required this.colorScheme,
    required this.definition,
    required this.textTheme,
  });

  final ColorScheme colorScheme;
  final Map<String, dynamic> definition;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 10,
        top: 5,
      ),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 1,
            color: colorScheme.onSecondary.withOpacity(0.3),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${definition["definition"]}',
            style: textTheme.bodyLarge!.copyWith(
              color: colorScheme.onPrimary,
              // fontWeight: FontWeight.bold,
            ),
          ),
          definition["example"] != null
              ? Text(
                  '${definition["example"]}',
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
