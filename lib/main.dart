import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    final noteWidgets =
        MusicNote.values.map((note) => NoteWidget(note)).toList();

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: noteWidgets,
          ),
        ),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  NoteWidget(this.note, {super.key});

  final MusicNote note;
  final player = AudioPlayer();

  Future<void> playSound(int noteNumber) async {
    await player.play(AssetSource('note${note.number}.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () async => await playSound(note.number),
        style: TextButton.styleFrom(
          backgroundColor: note.color,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
        child: Text(note.name),
      ),
    );
  }
}

enum MusicNote {
  c('C', 1),
  d('D', 2),
  e('E', 3),
  f('F', 4),
  g('G', 5),
  a('A', 6),
  b('B', 7);

  const MusicNote(this.name, this.number);

  final String name;
  final int number;
}

extension MusicNoteColor on MusicNote {
  MaterialColor get color {
    final noteColors = <MaterialColor>[
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple,
    ];

    return noteColors[number - 1];
  }
}
