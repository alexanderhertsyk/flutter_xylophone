import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                MusicalNote('C', 1),
                MusicalNote('D', 2),
                MusicalNote('E', 3),
                MusicalNote('F', 4),
                MusicalNote('G', 5),
                MusicalNote('A', 6),
                MusicalNote('B', 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MusicalNote extends StatelessWidget {
  MusicalNote(this.noteName, this.order, {super.key});

  final String noteName;
  final int order;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await player.play(AssetSource('note$order.wav'));
      },
      child: Text(noteName),
    );
  }
}
