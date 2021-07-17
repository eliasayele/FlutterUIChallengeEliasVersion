import 'package:flutter/material.dart';

class ContentScroll extends StatelessWidget {
  const ContentScroll(
      {Key? key,
      required this.title,
      required this.imageHeight,
      required this.imageWidth,
      required this.images})
      : super(key: key);
  final List<String> images;
  final String title;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () => print('View ${title}'),
                child: Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30),
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  width: imageWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6.0,
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0)),
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
