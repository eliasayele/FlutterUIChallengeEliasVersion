import 'package:flutter/material.dart';
import 'package:uichallengesflutter/socialmedia/tab_one.dart';

class TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Expanded(
        child: Scaffold(
            body: Column(
          children: [
            Container(
              color: Colors.blueGrey.shade50,
              child: TabBar(
                labelColor: Colors.black,
                // indicatorSize: ,
                labelPadding: EdgeInsets.all(12),
                indicatorWeight: 2,
                indicatorColor: Color(0xff000000),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.grid_on_outlined,
                      // color: Colors.grey,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.ondemand_video_sharp,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.tv,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.account_box_outlined,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TabOne(),
                  Text("Hello, World 2"),
                  Text("Hello, World 3"),
                  Text("Hello, World 4"),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

/*

TabBarView(
            children: [
              TabOne(),
              Text("Hello, World 2"),
              Text("Hello, World 3"),
              Text("Hello, World 4"),
            ],
          ),
 */
