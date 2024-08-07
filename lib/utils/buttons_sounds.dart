import 'package:just_audio/just_audio.dart';

class ClickButton {
  AudioPlayer audioPlayer = AudioPlayer();

  /// Función para reproducir el sonido al pulsar un boton
  void playButton({String? sound}) async {
    final soundPath = sound ?? "assets/sounds/click_button.mp3";
    try {
      await audioPlayer.dispose();
      audioPlayer = AudioPlayer();
      await audioPlayer.setAsset(soundPath);
      audioPlayer.play();
    } catch (e) {
      print(e);
    }
  }

  /// Función para reproducir el sonido de campanita
  void playBell({String? sound}) async {
    final soundPath = sound ?? "assets/sounds/bell_sound.mp3";
    try {
      await audioPlayer.setAsset(soundPath);
      audioPlayer.seek(Duration.zero);
      audioPlayer.play();
    } catch (e) {
      print(e);
    }
  }
}

class ButtonsSounds {
  // static AudioPlayer sound1 = new AudioPlayer();
  static AudioPlayer audioPlayer = AudioPlayer();
  // Función para reproducir el sonido
  static void playSound({String? sound}) async {
    print(
        "--------------------------------------------------------------------------------------------");
    final soundPath = sound ?? "assets/sounds/click_button.mp3";
    print(soundPath);
    try {
      await audioPlayer.setAsset(soundPath);
      audioPlayer.seek(Duration.zero);
      audioPlayer.play();
    } catch (e) {
      print(e);
    }
  }
}
