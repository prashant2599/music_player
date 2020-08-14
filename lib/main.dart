import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AudioPlayer newplayer = AudioPlayer();
    AudioCache audio = AudioCache(fixedPlayer: newplayer);

    var play = 0;
    var stop = 1;

    playAudio() {
      if (play == 0 || stop == 1) {
        audio.play("pyar.mp3");
        play = 1;
        stop = 0;
      }
    }

    pauseAudio() {
      if (play == 1) {
        newplayer.pause();
        play = 0;
      }
    }

    stopAudio() {
      if (play == 1 || stop == 0) newplayer.stop();
      play = 0;
      stop = 1;
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('MUSIC RIDE'),
            leading: GestureDetector(
              child: Icon(Icons.menu),
              onTap: () {},
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x11000000),
                            offset: Offset(0, 10),
                            spreadRadius: 0,
                            blurRadius: 100,
                          ),
                          BoxShadow(
                            color: Color(0x66000000),
                            offset: Offset(0, 10),
                            spreadRadius: 0,
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: NetworkImage(
                                'https://static.toiimg.com/thumb/72975551.cms?width=680&height=512&imgsize=881753'),
                            width: 2000,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Album Title',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\"Pyar tune kiya kya\"',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Slider(
                    onChanged: (v) {},
                    value: 10,
                    max: 100,
                    min: 0,
                    activeColor: Colors.teal,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          stopAudio();
                        },
                        icon: Icon(Icons.stop),
                      ),
                      IconButton(
                        icon: play != play
                            ? Icon(Icons.pause)
                            : Icon(Icons.play_arrow),
                        onPressed: () {
                          playAudio();
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          pauseAudio();
                        },
                        icon: Icon(Icons.pause),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
