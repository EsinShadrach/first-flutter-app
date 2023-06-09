import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namr/utilities/bottom_drawer.dart';


class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle textStyle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    String textData = "${pair.first}-${pair.second}";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(
        maxWidth: 390,
      ),
      width: double.infinity,
      child: Card(
        color: theme.colorScheme.primary,
        child: ClipRRect(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(2, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: Row(
                  key: ValueKey<String>(textData),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PairTextButtonWidget(
                      theme: theme,
                      pairText: pair.first,
                      style: textStyle,
                    ),
                    Text(
                      '-',
                      style: textStyle,
                    ),
                    PairTextButtonWidget(
                      theme: theme,
                      pairText: pair.second,
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PairTextButtonWidget extends StatelessWidget {
  /// Think of this as a text button, but this time it pops a modal when clicked
  const PairTextButtonWidget({
    super.key,
    required this.theme,
    required this.pairText,
    required this.style,
  });

  final ThemeData theme;
  final String pairText;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: theme.colorScheme.primary,
          context: context,
          builder: (BuildContext context) {
            return BottomDrawer(
              data: pairText,
            );
          },
        );
      },
      child: Text(
        pairText,
        style: style,
        softWrap: true,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        semanticsLabel: pairText,
      ),
    );
  }
}
