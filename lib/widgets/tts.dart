import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTS extends StatefulWidget {
  const TTS({super.key});

  @override
  State<TTS> createState() => _TTSState();
}

FlutterTts ftts = FlutterTts();

class _TTSState extends State<TTS> {
  bool isPlaying = false;
  String article = "Hello World";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          onPressed: () async {
            await ftts.setLanguage('en-US');
            await ftts.setPitch(1.0);
            await ftts.setVolume(1.0);
            await ftts.speak(article);
            setState(
              () {
                isPlaying = !isPlaying;
              },
            );
          },
          child: SvgPicture.asset(
            isPlaying ? "assets/icons/tts_off.svg" : "assets/icons/tts_on.svg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
