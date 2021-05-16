import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(Soundboard());

class Soundboard extends StatefulWidget {
  @override
  _SoundboardState createState() => _SoundboardState();
}

class _SoundboardState extends State<Soundboard> {
  AudioCache audioCache = AudioCache();
  AudioPlayer? audioPlayer;

  void playSound(String localPath) async {
    await audioPlayer?.stop();
    audioPlayer = await audioCache.play(localPath);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soundboard',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Soundboard'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    playSound('zdravko_mamic.mp3');
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('images/zdravko_mamic.jpg'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    playSound('mark_zuckerberg.mp3');
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('images/mark_zuckerberg.jpg'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    playSound('elon_musk.mp3');
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('images/elon_musk.jpg'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
