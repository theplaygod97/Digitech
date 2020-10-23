import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:digitech/model/products.dart';
import 'package:digitech/views/brands.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mob.dart';

class comp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<comp> {
  List<Products> productList = [];

  // Products prod ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseReference reference = FirebaseDatabase.instance
        .reference()
        .child("category")
        .child("comp")
        .child("products");
    reference.once().then((DataSnapshot datasnapShot) {
      productList.clear();
      Map<dynamic, dynamic> p = datasnapShot.value;
      p.forEach((key, value) {
        print(key);

        print(value['imgUrl']);

        Products products = new Products(key, value['imgUrl']);
        productList.add(products);
      });
      setState(() {
        //
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/one.jpg'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Digitech Sale",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Shop Now",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: productList
                    .map((item) => Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => brands(
                                            pName: item.name,
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(item.imgUrl),
                                      fit: BoxFit.cover)),
                              child: Transform.translate(
                                offset: Offset(10, 50),
                                child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 45, vertical: 75),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white38,
                                    ),
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.grey[900],
        selectedIndex: 0,
        showElevation: true,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        curve: Curves.easeInOutBack,
        animationDuration: Duration(milliseconds: 200),
        // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          if (index == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => mob()));
          }
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Computer'),
            activeColor: Colors.white54,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Mobile"),
              activeColor: Colors.purpleAccent),
        ],
      ),
    );
  }
}
