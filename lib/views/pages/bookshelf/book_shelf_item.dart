import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello/views/components/color_wrapper.dart';

class BookShelfCardItem extends StatelessWidget {
  final BookInfo bookInfo;

  BookShelfCardItem(this.bookInfo);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
          height: double.maxFinite,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Hero(
                tag: bookInfo.name,
                child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(bookInfo.image)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ))
                  // color: Colors.green,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 15, right: 15, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      bookInfo.name,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Theme.of(context).primaryColor,
                                offset: const Offset(.2, .2),
                                blurRadius: .5)
                          ]),
                    ),
                    Spacer(),
                    WrapColor(
                      radius: 6,
                      padding:
                      EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 3),
                      child: Text(
                        "加油～",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Text(
                  bookInfo.info,
                  style: TextStyle(color: Colors.grey, shadows: [
                    Shadow(
                        color: Theme.of(context).primaryColor,
                        offset: const Offset(.2, .2),
                        blurRadius: .5)
                  ]),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ))),
    );
  }
}

class BookInfo {
  final String name;
  final String info;
  final String image;
  final String router;

  const BookInfo({required this.name, required this.info, required this.image, required this.router});

  factory BookInfo.fromJson(Map<String, dynamic> map) {
    return BookInfo(
        name: map["name"] ?? "",
        image: map["image"] ?? "assets/images/girl.webp",
        router: map["router"] ?? "",
        info: map["info"] ?? ""
    );
  }
}