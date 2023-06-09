import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class WordAndPhoneticsWidget extends StatefulWidget {
  const WordAndPhoneticsWidget({
    super.key,
    required this.textTheme,
    required this.colorScheme,
    required this.phonetic,
    required this.audioUrl,
    required this.word,
  });

  final String word;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final String phonetic;
  final String audioUrl;

  @override
  State<WordAndPhoneticsWidget> createState() => _WordAndPhoneticsWidgetState();
}

class _WordAndPhoneticsWidgetState extends State<WordAndPhoneticsWidget> {
  late AudioPlayer _audioPlayer;
  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    super.initState();
  }

  void _playAudio(String audioUrl) async {
    try {
      await _audioPlayer.setUrl(audioUrl); // * Set the audio URL to play
      await _audioPlayer.play(); // * Start playing the audio
    } catch (e) {
      // ! Handle Errors here
      print('Error playing audio: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.word.titleCase(),
                style: widget.textTheme.displayMedium!.copyWith(
                  color: widget.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
                semanticsLabel: widget.word,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  _playAudio(widget.audioUrl);
                },
                icon: Icon(
                  Icons.mic_none_rounded,
                  size: 35,
                ),
                color: widget.colorScheme.onPrimary,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.phonetic,
            style: widget.textTheme.titleLarge!.copyWith(
              color: widget.colorScheme.onPrimary.withOpacity(0.8),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

extension TitleCase on String {
  String titleWord(String data) {
    String returnData = data[0].toUpperCase();

    for (var i = 1; i < data.length; i++) {
      returnData += data[i];
    }
    return returnData;
  }

  String titleCase() {
    List<String> wordList = [];

    for (var word in split(" ")) {
      wordList.add(titleWord(word));
    }
    return (wordList.join(" "));
  }
}
