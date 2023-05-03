import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Songspage extends StatefulWidget {
  var song_name, artist_name, song_url, image_url;

  Songspage(
      {required this.song_name, required this.artist_name, required this.song_url, required this.image_url });
  @override
  _SongspageState createState() => _SongspageState();
}
class _SongspageState extends State<Songspage> {
  AudioPlayer musicPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  AudioCache audioCache = AudioCache();
  late String localFilePath;
  late String localAudioCacheUrl;
  @override
  void initState() {

    super.initState();
    setAudio();
    initPlatformState();
    musicPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });

    });
    musicPlayer.onDurationChanged.listen((newDuration){
      setState(( ){
        duration = newDuration;
      });
    });
    musicPlayer.onPositionChanged.listen((newPosition){
      setState(() {
        position = newPosition;
      });
    });
  }
  String formatTime (Duration duration){
    String twoDigits(int n)=>n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if(duration.inHours>0) hours,
      minutes, seconds
    ].join(':');
  }

  Future<void> initPlatformState() async {
    //musicPlayer = MusicPlayer();
    // AudioPlayer.logEnabled = true;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('  Now Playing',

          style: TextStyle(

            color: Colors.white,
            fontSize: 38.0,
            fontWeight: FontWeight.bold,

          ),),
        shadowColor: Colors.indigo,
        backgroundColor: Colors.indigo,
        // title: Text("Music Player App"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.white70,
              ]

          ),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,

              child: Container(
                child: Column(
                    children: <Widget>[
                      // Text('Now Plalying',
                      // style: TextStyle(
                      //   color: Colors.white,
                      //       fontSize: 38.0,
                      //   fontWeight: FontWeight.bold,
                      //
                      // ),),
                      SizedBox(
                        height: 10,
                      ),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(50.0),
                      //   child: Image.network(widget.image_url, height: 350.0,
                      //     width: double.infinity,
                      //     fit: BoxFit.cover,),
                      //
                      //
                      // ),
                      Center(
                        child: Container(
                          width: 280.0,
                          height: 280.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(image:NetworkImage(widget.image_url,) )
                          ),

                        ),
                      ),

                      SizedBox(
                        height: 18.0,
                      ),
                      Text(  widget.song_name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(  widget.artist_name,
                        textAlign: TextAlign.center,
                        style: TextStyle(

                          fontSize: 15.0,
                          color: Colors.indigo,
                        ),
                      ),

                      // SizedBox(
                      //   height:12,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16.0,),
                      // child:
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     SizedBox(
                      //       width: 100.0,
                      //     ),
                      Slider(
                          activeColor: Colors.indigo,


                          min: 0.0,
                          max: duration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          onChanged: (value) async {
                            final position = Duration(seconds: value.toInt());
                            await musicPlayer.seek(position);
                            await musicPlayer.resume();
                            // await musicPlayer.seek(Duration(seconds: value.toInt()));

                          }),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Expanded(
                            flex: 1,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children:[ Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      formatTime(position),
                                    ),
                                    Text(
                                      formatTime(duration - position),
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ],
                                ),]
                            ),
                          )
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // children:[ CircleAvatar(
                          //   radius: 35.0,
                          //   backgroundColor: Colors.indigo,
                          // ),
                          children:[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                SizedBox(width: 80,),
                                IconButton
                                  (
                                    iconSize: 50,
                                    onPressed: (){}, icon: Icon(Icons.skip_previous,
                                  color: Colors.indigo,
                                )
                                  //iconSize: 50.0,
                                ),
                                SizedBox(width: 10,),
                                CircleAvatar(
                                  radius: 35.0,
                                  backgroundColor: Colors.indigo,
                                  child: IconButton(
                                    icon: Icon(
                                      isPlaying ? Icons.pause : Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    iconSize: 50.0,
                                    onPressed: () async{
                                      if(isPlaying){
                                        await musicPlayer.pause();
                                        setState(() {
                                          isPlaying = false;
                                        });
                                      }else{
                                        await musicPlayer.resume();

                                        setState(() {
                                          isPlaying = true;
                                        });
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: 8,),
                                IconButton(
                                    iconSize: 50.0,
                                    onPressed: (){}, icon: Icon(Icons.skip_next
                                  ,color: Colors.indigo,)),
                                //   SizedBox(width: 1,),
                                IconButton( icon: Icon(
                                  Icons.stop,
                                  color: Colors.indigo,
                                ),
                                    color: isPlaying?Colors.black:Colors.blue,
                                    iconSize: 60.0,

                                    onPressed: () async {
                                      void result =await  musicPlayer.stop();
                                      setState(() {
                                        isPlaying=false;
                                        //documentSnapshot.data()["podcast_name"],
                                      });
                                    })],
                            )
                          ]
                      )



                    ]),
              )),
        ),
      ),);

    //       ),]
    // )),));

  }

  Future setAudio() async{
    musicPlayer.setReleaseMode(ReleaseMode.loop);
    String url = widget.song_url;
    musicPlayer.setSourceAsset(url);
  }
}
