import 'package:ariob_music/widgets/song_card.dart';
import 'package:flutter/material.dart';

Widget listItem(data){
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