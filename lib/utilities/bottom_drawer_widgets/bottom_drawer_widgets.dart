import 'package:flutter/material.dart';

class SynonymsWidget extends StatelessWidget {
  const SynonymsWidget({
    super.key,
    required this.meaning,
    required this.textTheme,
    required this.colorScheme,
  });

  final dynamic meaning;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        meaning["synonyms"].isEmpty
            ? Container()
            : Text(
                "Synonyms",
                style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.start,
            children: [
              for (var synonym in meaning["synonyms"])
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    border: Border.all(
                      width: 1,
                      color: colorScheme.onPrimary,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        50,
                      ),
                    ),
                  ),
                  child: Text(
                    synonym,
                    style: textTheme.bodyLarge!.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
