import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:app/models/song.dart';
class PlaylistProvider  extends ChangeNotifier{
  //playlist of song
  final List<Song> _playlist = [
    //song 1
    Song(
        songName: "Moi Em",
        artistName: "Wxrdie",
        albumArtImagePath: "assets/images/art1.png",
        audioPath: "audio/moiem.mp3",
    ),
    //song 2
    Song(
      songName: "Die With A Smile",
      artistName: "Lady Gaga, Bruno Mars",
      albumArtImagePath: "assets/images/art2.png",
      audioPath: "audio/diewithsmile.mp3",
    ),
    //song 3
    Song(
      songName: "FE!N",
      artistName: "Travis Scott ft. Playboi Carti",
      albumArtImagePath: "assets/images/art3.png",
      audioPath: "audio/fein.mp3",
    ),
    //song 4
    Song(
      songName: "Trước Khi Em Tồn Tại",
      artistName: "Thắng",
      albumArtImagePath: "assets/images/truockhiemtontai.jfif",
      audioPath: "audio/truockhiemtontai.mp3",
    ),
    //song 5
    Song(
      songName: "Em dạo này",
      artistName: "Ngọt",
      albumArtImagePath: "assets/images/emdaonay.jfif",
      audioPath: "audio/emdaonay.mp3",
    ),
    //song 6
    Song(
      songName: "Nứt",
      artistName: "Ngọt",
      albumArtImagePath: "assets/images/nut.jpg",
      audioPath: "audio/nut.mp3",
    ),
    //song 7
    Song(
      songName: "Đã xem",
      artistName: "Thắng",
      albumArtImagePath: "assets/images/daxem.jpg",
      audioPath: "audio/daxem.mp3",
    ),
    //song 8
    Song(
      songName: "Để Quên",
      artistName: "Ngọt",
      albumArtImagePath: "assets/images/dequen.jpg",
      audioPath: "audio/dequen.mp3",
    ),
    //song 9
    Song(
      songName: "Đốt",
      artistName: "Ngọt",
      albumArtImagePath: "assets/images/dot.jfif",
      audioPath: "audio/dot.mp3",
    ),
    //song 10
    Song(
      songName: "01 Chuyện Dở Dang",
      artistName: "Ngọt",
      albumArtImagePath: "assets/images/chuyendodang.jfif",
      audioPath: "audio/01chuyendodang.mp3",
    ),

  ];
  int? _currentSongIndex;
 /*
  AUDIO PLAYER
  */
  //audio player
  final AudioPlayer _audioPlayer= AudioPlayer();
  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PlaylistProvider(){
    listenToDuration();
  }
  // init not playing
  bool _isPlaying = false;
  //chich nhac
  void play() async{
    final String path=_playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();//dung nhac hien tai
    await _audioPlayer.play(AssetSource(path));// choi bai nhac moi
    _isPlaying = true;
    notifyListeners();
  }
  //dung nhac
  void pause() async{
      await _audioPlayer.pause();
      _isPlaying=false;
      notifyListeners();
  }
  // resume
  void resume() async{
    await _audioPlayer.resume();
    _isPlaying=true;
    notifyListeners();
  }
  //pause hoac resume
  void pauseOrResume() async{
    if (_isPlaying){
      pause();
    }else{
      resume();
    }
    notifyListeners();
  }
  //seek to a specific
  void seek(Duration position) async{
    await _audioPlayer.seek(position);
  }
  //play next song
  void playNextSong(){
    if(_currentSongIndex != null){
      if(_currentSongIndex! < _playlist.length -1){
        //neu ko phai bai cuoi thi di tiep
        currentSongIndex=_currentSongIndex! + 1;
      } else {
        //neu la bai cuoi thi vong ve bai dau
        currentSongIndex=0;
      }
    }
  }
  //play prev song
  void playPreviousSong() async {
    //neu hon 2 giay da qua thi res lai bai hien tai
    if(_currentDuration.inSeconds >2 ) {
      seek(Duration.zero);
    }
    // neu ko toi 2 giay thi toi bai truoc
    else {
      if(_currentDuration.inSeconds! > 0  ){
        currentSongIndex=_currentSongIndex! -1;
      } else  {
        //neu la bai dau thi  quay ve bai cuoi
        currentSongIndex = _playlist.length -1;
      }
    }
  }
  //listen to duration
  void listenToDuration(){
    //listen 4 total
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration=newDuration;
      notifyListeners();
    });
    //listen 4 current
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration=newPosition;
      notifyListeners();
    });
    //listen for song
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }
  //dispose audio player
  /*
    G E T T E R S
  */

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  /*
    S E T T E R S
   */

  set currentSongIndex(int? newIndex){

    //update  current song index
    _currentSongIndex=newIndex;
    if (newIndex != null){
      play(); // chich chet me bai nhac
    }
    //update UI
    notifyListeners();
  }
}