import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget modellistview(String name,String imgUrl,int price,String desc) {
  return new Container(
    height: 150,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
      BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
    ]),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                desc,
                style: const TextStyle(fontSize: 17, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "\$ $price",
                style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Image.network(
            imgUrl,
            fit: BoxFit.cover,
            height: 100,
          ),
        ],
      ),
    ));
}