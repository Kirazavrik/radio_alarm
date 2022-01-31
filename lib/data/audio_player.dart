import 'package:just_audio/just_audio.dart';

class Player{
  late AudioPlayer _audioPlayer;

  Player() {
    _init();
  }

  _init() async {
    _audioPlayer = AudioPlayer();
  }

  void playStation(String url) async{
    await _audioPlayer.setUrl(url);
    _audioPlayer.pause();
    _audioPlayer.play();
  }


}