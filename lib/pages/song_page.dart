import 'package:ariob_music/provider/song_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/songs_model.dart';
import '../widgets/song_card.dart';
import '../widgets/song_list_Item.dart';

class SongList extends StatefulWidget {
  const SongList({Key? key}) : super(key: key);

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
final SongService songService = SongService();
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Songs>>(
        future: songService.getSongs(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    var songs =snapshot.data!;
    return Scaffold(
    appBar: AppBar(
    title: const Text('Student Management'),
    ),
    body: ListView.builder(
    itemCount: songs.length,
    itemBuilder: (context, index) {
    return Card(
    child: ListTile(
    title: Text('${songs[index].artistName} ${songs[index].songName}',

    ),
    subtitle: Text(
    '${songs[index].albumName}',

    ),
    trailing: Text(
    '${songs[index].songLength}',

    ),
    ),
    );
    },
    ),);
    }
    if(snapshot.hasError){
      return const Scaffold(
        body: Center(
          child: Text('Error', style: TextStyle(color: Colors.black),),
        ),
      );}
    if(snapshot.data == null){
      return const Scaffold(
        body: Center(
          child: Text('No data',style: TextStyle(color: Colors.black),),
        ),
      );}
    else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    });
    // return Padding(padding: EdgeInsets.all(10),
    // child: Column(
    //     children: [
    //       Row(
    //         children: [
    //           Text('New Album', style: TextStyle(
    //             fontSize: 20,
    //             fontWeight: FontWeight.bold,
    //           ),),
    //           const Spacer(),
    //           Text('See all', style: TextStyle(
    //             fontSize:  12,
    //             fontWeight: FontWeight.bold,
    //           ),),
    //           // TextButton(
    //           //   onPressed: () {
    //           //     albumProvider.fetchAlbums();
    //           //   },
    //           //   child: const Text('Refresh'),
    //           // ),
    //           ///TODO: Add Refresh Button
    //         ],
    //       ),
    //       SizedBox(height: 10,),
    //        Consumer<SongService>(builder: (context, songService, child){
    //          Future<List<Songs>> songList = songService.getSongs();
    //           return FutureBuilder<List<Songs>>(
    //       future: songList,
    // builder: (context, snapshot) {
    // if (snapshot.hasData) {
    //   var songs = snapshot.data as List<Songs>;
    //   return listItem(songs);
    // }
    // else if (snapshot.hasError) {
    // return Text('${snapshot.error}');
    // }
    // return const CircularProgressIndicator();
    // },
    // );
    //
    // },
    //
    //
    //       )
    //
    //
    //     ]
    // ),);
  }

  Widget listItem1(data){
    return Container(
        height: 200,
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {

                    return SongCard(songs: data[index].trackName,
                        artistName: data[index].artistName,
                        backgroundImage: data[index].trackCoverImage,
                        addFavourite: () {}
                    );
                  }

              ),
            ),
          ],
        )
    );
  }
}
