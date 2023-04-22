import 'package:ariob_music/pages/home_page.dart';
import 'package:ariob_music/services/song_provider.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SongService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ariob Music',
      home: Home()
    );
  }
}
