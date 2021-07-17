/*
CREDIT to
https://github.com/MarcusNg
 */

import 'package:flutter/material.dart';

import 'MovieScreen.dart';
import 'content_scroll.dart';
import 'models/movie_model.dart';

class NetFlixHome extends StatefulWidget {
  const NetFlixHome({Key? key}) : super(key: key);

  @override
  _NetFlixHomeState createState() => _NetFlixHomeState();
}

class _NetFlixHomeState extends State<NetFlixHome> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270,
            width: Curves.easeInOut.transform(value) * 400,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => MovieScreen(movie: movies[index]))),
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage(movies[index].imageUrl),
                    height: 220.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  movies[index].title.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image(
          height: 60,
          image: AssetImage("assets/images/netflix_logo.png"),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          onPressed: () {
            print('Search');
          },
          color: Colors.black,
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => print('hello'),
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 280,
            width: double.infinity,
            child: PageView.builder(
              itemCount: movies.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return _movieSelector(index);
              },
            ),
          ),
          Container(
            height: 90.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFD45253),
                          Color(0xFF9E1F28),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF9E1F28),
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        )
                      ]),
                  child: Center(
                    child: Text(
                      labels[index].toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ContentScroll(
            images: myList,
            title: "My List",
            imageHeight: 250,
            imageWidth: 150,
          ),
          SizedBox(height: 10),
          ContentScroll(
              title: "Popular",
              imageHeight: 250,
              imageWidth: 150,
              images: popular)
        ],
      ),
    );
  }
}
