import 'package:ariob_music/widgets/song_card.dart';
import 'package:flutter/material.dart';

Widget listItem(data){
  return SizedBox(
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {

                return SongCard(
                    artistName: data[index]!.artistName!,
                    songImage: data[index]!.songImage!,
                  songName: data[index]!.songName,

                    );
              }

            ),
          ),
        ],
      )
  );
}