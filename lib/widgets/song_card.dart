import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final String? songName;
  final String? artistName;
  final String? songImage;


  const SongCard({super.key, required this.songName, required this.artistName, required this.songImage, } );

  @override
  Widget build(BuildContext context) {

    return SizedBox(
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
                  image: NetworkImage(songImage!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text(songName!,style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),),
              subtitle: Text(artistName!, style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),),
            ),
          ],
        )

    ); }

}