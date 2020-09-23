import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeassionCard extends StatelessWidget {
  final String name;
  final String ImgUrl;

  const SeassionCard({
    Key key,
    this.name,
    this.ImgUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    body:CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Coding with Curry'),
          backgroundColor: Colors.deepPurple,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
                widget.bImg,
                fit: BoxFit.cover),
          ),
        ),
        PersistHeader(Colors.purple, widget.bName),
        SliverFixedExtentList(
          itemExtent: 150,
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container();
          }
          ),
        ),
      ],
    ),

  }
  return modellistview(
  modelList[index].name,
  modelList[index].imgUrl,
  modelList[index].price,
  modelList[index].desc);
  itemCount: modelList.length,
  ),
}