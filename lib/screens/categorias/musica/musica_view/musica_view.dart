import 'package:flutter/material.dart';

class MusicaView extends StatelessWidget {
  const MusicaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          title: Row(
            children: const [
              Icon(Icons.music_note_rounded),
              Text("Musicas"),
            ],
          ),
          backgroundColor: Colors.yellow[500],
        ),
      ],
    );
  }
}
