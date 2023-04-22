import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/songs_model.dart';
import '../services/song_provider.dart';
import '../widgets/song_list_Item.dart';
class SongList extends StatefulWidget {
  const SongList({Key? key}) : super(key: key);
  @override
  State<SongList> createState() => _SongListState();
}
class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10),
    child: Column(
        children: [
          Row(
            children: const [
             Text('New Album', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
             Spacer(),
          Text('See all', style: TextStyle(
                fontSize:  12,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
          const SizedBox(height: 10,),
           Consumer<SongService>(builder: (context, songService, child){
             Future<List<Songs>> songList = songService.getSongs();
              return FutureBuilder<List<Songs>>(
          future: songList,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
      var songs = snapshot.data as List<Songs>;
      return listItem(songs);
    }
    else if (snapshot.hasError) {
    return Text('${snapshot.error}');
    }
    return const CircularProgressIndicator();
    },
    );
    },
          )
        ]
    ),);
  }
}
