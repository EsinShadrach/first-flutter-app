import 'package:flutter/material.dart';
import 'package:namr/utilities/api.dart';
import 'package:namr/utilities/snapshot_widgets/error_widget.dart';
import 'package:namr/utilities/snapshot_widgets/waiting_widget.dart';

import 'bottom_drawer_widgets/bottom_drawer_widgets.dart';
import 'bottom_drawer_widgets/definition_widget.dart';
import 'bottom_drawer_widgets/word_phonetics_widget.dart';

class BottomDrawer extends StatefulWidget {
  const BottomDrawer({super.key, required this.data});

  final String data;
  @override
  State<BottomDrawer> createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  late Future<dynamic> _wordData;
  dynamic _data;
  bool _noErrors = true;

  Map _wordInfo = <String, dynamic>{
    "phonetic": "",
    "audioUrl": "",
    "meanings": <dynamic>[],
  };

  @override
  void initState() {
    _wordData = WordDetails(
      word: widget.data,
    ).fetchWord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _wordData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final TextTheme textTheme = Theme.of(context).textTheme;
        final ColorScheme colorScheme = Theme.of(context).colorScheme;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SnapShotWaitingWidget(colorScheme: colorScheme);
        } else if (snapshot.hasError) {
          return SnapShotErrorWidget(
            colorScheme: colorScheme,
            textTheme: textTheme,
          );
        } else {
          _data = snapshot.data;
          try {
            _wordInfo["phonetic"] = _data["phonetic"] ?? "";
            _wordInfo["audioUrl"] = _data["phonetics"][0]["audio"] == ""
                ? _data["phonetics"][1]["audio"]
                : _data["phonetics"][0]["audio"];

            _wordInfo["meanings"] = _data["meanings"];
          } catch (error) {
            // * THE ONLY ERROR WE CAN GET IS NULL
            _noErrors = false;
          }

          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                25,
              ),
              topRight: Radius.circular(
                25,
              ),
            ),
            child: _noErrors
                ? Container(
                    height: 400,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: ListView(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      children: [
                        WordAndPhoneticsWidget(
                          textTheme: textTheme,
                          colorScheme: colorScheme,
                          phonetic: _wordInfo["phonetic"],
                          audioUrl: _wordInfo["audioUrl"],
                          word: widget.data,
                        ),
                        for (var meaning in _wordInfo["meanings"])
                          Card(
                            color: colorScheme.secondary,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${meaning["partOfSpeech"]}',
                                    style: textTheme.bodyLarge!.copyWith(
                                      color: colorScheme.onPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  for (var definition in meaning["definitions"])
                                    DefinitionWidget(
                                      colorScheme: colorScheme,
                                      definition: definition,
                                      textTheme: textTheme,
                                    ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SynonymsWidget(
                                    meaning: meaning,
                                    textTheme: textTheme,
                                    colorScheme: colorScheme,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : SnapShotErrorWidget(
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
          );
        }
      },
    );
  }
}
