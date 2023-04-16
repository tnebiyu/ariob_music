import 'package:ariob_music/pages/song_page.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child:  Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,

                color: kAppBarColor,
                child: ButtonsTabBar(
                    radius: 16,
                    buttonMargin: const EdgeInsets.only(left: 35,right: 22, top: 15, bottom: 10),
                    decoration: BoxDecoration(
                      color: kAppBarTitleColor,
                      borderRadius: BorderRadius.circular(6),

                    ),

                    contentPadding: const EdgeInsets.only(left: 12,right: 12,),
                    unselectedBorderColor: kAppBarColor,

                    unselectedBackgroundColor: kAppBarColor,
                    unselectedLabelStyle: const TextStyle(color: kUnselectedButtonTextColor, fontWeight: FontWeight.w600),
                    labelStyle:
                    const TextStyle(color: kTextColor, fontWeight: FontWeight.w600),
                    tabs: const [
                      Tab(
                        text: "Home",
                      ),
                      Tab(
                        text: "Albums",
                      ),
                      Tab(
                        text: "Favorites",
                      ),

                    ]),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                   SongList(),
                    SongList(),
                    SongList()

                  ],
                ),
              ),
            ],

          ),
        ),
      ),
    );

  }
}
