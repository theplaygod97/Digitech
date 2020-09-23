import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitech/model/modelname.dart';
import 'package:digitech/widgets/modellistview.dart';
import 'package:digitech/widgets/persistheader.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class modelview extends StatefulWidget {
  final String pName;
  final String bName;
  final String bImg;

  const modelview({Key key, this.pName, this.bName, this.bImg})
      : super(key: key);

  @override
  _modelviewState createState() => _modelviewState();
}

class _modelviewState extends State<modelview> {
  List<Modelname> modelList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DatabaseReference reference = FirebaseDatabase.instance
        .reference()
        .child("category")
        .child("comp")
        .child("products")
        .child(widget.pName)
        .child("brands")
        .child(widget.bName)
        .child("models");
    reference.once().then((DataSnapshot datasnapShot) {
      modelList.clear();
      Map<dynamic, dynamic> p = datasnapShot.value;
      print(datasnapShot.value);
      p.forEach((key, value) {
        print(key);
        print(value['imgUrl']);
        print(value['desc']);

        Modelname models =
            new Modelname(key, value['imgUrl'], value['price'], value['desc']);
        modelList.add(models);
      });

      setState(() {
        //
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(widget.bImg, fit: BoxFit.cover),
            ),
          ),
          PersistHeader(Colors.transparent, widget.bName),
          SliverFixedExtentList(
            itemExtent: 150,
            delegate: SliverChildBuilderDelegate((context, index) {
              return modellistview(
                  modelList[index].name,
                  modelList[index].imgUrl,
                  modelList[index].price,
                  modelList[index].desc);
            }, childCount: modelList.length),
          ),
        ],
      ),
    );
  }
}
