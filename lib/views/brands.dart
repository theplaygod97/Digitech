import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitech/model/brandname.dart';
import 'package:digitech/views/modelview.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class brands extends StatefulWidget {
  final String pName;

  brands({Key key, @required this.pName}) : super(key: key);

  @override
  _brandState createState() => _brandState();
}

class _brandState extends State<brands> {
  List<Brandname> brandsList = [];

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
        .child("brands");
    reference.once().then((DataSnapshot datasnapShot) {
      brandsList.clear();
      Map<dynamic, dynamic> p = datasnapShot.value;
      print(datasnapShot.value);
      p.forEach((key, value) {
        print(key);

        print(value['imgUrl']);

        Brandname brands = new Brandname(key, value['imgUrl']);
        brandsList.add(brands);
      });
      setState(() {
        //
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[500],
        body: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {Navigator.pop(context);},
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Brands',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),

              ],
            ),
          ),
          SizedBox(height: 35.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child:

            brandsList.length == 0
                ? Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
              padding: EdgeInsets.only(top: 10),
                    itemBuilder: (context, index) {
                      return brandlistview(
                          brandsList[index].name, brandsList[index].imgUrl);
                    },
                    itemCount: brandsList.length,
                  ),
          ),
        ]));
  }

  Widget brandlistview(String name, String imgUrl) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => modelview(
                        pName: widget.pName,
                        bName: name,
                        bImg: imgUrl
                      )));
        },
        child: new Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 16),
          height: 150,
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 170,
                decoration: BoxDecoration(
                    color: Colors.black45.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(6)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.white),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text("")
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
