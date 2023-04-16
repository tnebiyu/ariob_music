import 'package:flutter/material.dart';

import '../model/songs_model.dart';

class SongCard extends StatelessWidget {
  final String? trackName;
  final String? artistName;
  final String? backgroundImage;
  final Function addFavourite;
  final Songs songs;
  const SongCard({super.key, this.trackName, this.artistName, this.backgroundImage, required this.songs, required this.addFavourite} );

  @override
  Widget build(BuildContext context) {

    return Container(
        width:119,
        height: 132,
        child: Column(
          children: [
            Container(
              height: 105,
              width: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(backgroundImage!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text(trackName!,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),),
              subtitle: Text(artistName!, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),),
              trailing: IconButton(
                  onPressed: () {
                    addFavourite();
                  },
                  icon: Icon(Icons.favorite_border, color: Colors.white,)
              ),),
          ],
        )

    ); }

}