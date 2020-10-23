import 'package:digitech/common/constants.dart';
import 'package:digitech/common/sizeConfig.dart';
import 'package:digitech/model/details.dart';
import 'package:digitech/views/pdetailscomp/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class pdetailsview extends StatefulWidget {
  final String mName;
  final String mImgUrl;
  final int mPrice;
  final String mDesc;
  pdetailsview({Key key, this.mName, this.mImgUrl, this.mPrice, this.mDesc})
      : super(key: key);

  @override
  _pdetailsviewState createState() => _pdetailsviewState();
}

class _pdetailsviewState extends State<pdetailsview> {
  @override
  Widget build(BuildContext context) {
    Details product =
        new Details(widget.mName, widget.mImgUrl, widget.mPrice, widget.mDesc);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_bag),
          onPressed: () {},
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
