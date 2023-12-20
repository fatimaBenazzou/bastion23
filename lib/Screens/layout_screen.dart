import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bastion23/Screens/gallery_screen.dart';
import 'package:bastion23/Screens/home_screen.dart';
import 'package:bastion23/Screens/photo_screen.dart';
import 'package:bastion23/Screens/profile_screen.dart';
import 'package:bastion23/Screens/quizzes_screen.dart';
import 'package:bastion23/Widgets/app_bar.dart';
import 'package:bastion23/Widgets/custom_nav.dart';
import 'package:bastion23/theme_config.dart';

class LayoutScreen extends StatefulWidget {
  final cameras;
  const LayoutScreen(this.cameras, {Key? key}) : super(key: key);

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late AudioPlayer _audioPlayer;
  late SharedPreferences _prefs;
  int _selectedPageIndex = 0;
  late bool playMusic; // Add this line
  late String music; // Add this line

  static const String playbackPositionKey = 'playback_position';

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
      _loadPlaybackPosition();

      setState(() {
        playMusic = prefs.getBool('playMusic') ?? true;
        music = playMusic ? 'On' : 'Off';
      });

      FlutterBackgroundService().startService();

      _audioPlayer.positionStream.listen((position) {
        _savePlaybackPosition(position);
      });

      _audioPlayer.setAsset('assets/audios/audiobg.mp3');
      if (playMusic) {
        _audioPlayer.play();
      }
    });
  }

  Future<void> _loadPlaybackPosition() async {
    final double savedPosition =
        _prefs.getDouble(playbackPositionKey) ?? 0.0;
    await _audioPlayer.seek(Duration(seconds: savedPosition.toInt()));
  }

  void _savePlaybackPosition(Duration position) async {
    await _prefs.setDouble(
        playbackPositionKey, position.inSeconds.toDouble());
  }

  void toggleMusic() async {
    setState(() {
      playMusic = !playMusic;
      music = playMusic ? 'On' : 'Off';
      if (playMusic) {
        _audioPlayer.play();
      } else {
        _audioPlayer.stop();
      }
    });

    _prefs.setBool('playMusic', playMusic);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_selectedPageIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return GalleryScreen();
      case 2:
        return ImageScreen(widget.cameras);
      case 3:
        return const QuizzesScreen();
      case 4:
        return const ProfileScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Appbar()),
      floatingActionButton: Positioned(
        bottom: 16.0,
        right: 16.0,
        child: ElevatedButton.icon(
          onPressed: toggleMusic,
          label: Text(
            'Music $music',
            style: ThemeConfig.squirkButton,
          ),
          icon: const Icon(Icons.music_note_rounded,
              color: ThemeConfig.buttonColor),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTabSelect: _selectPage,
      ),
    );
  }
}
