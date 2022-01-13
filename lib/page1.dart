import 'package:exam/model.dart';

import 'package:exam/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> product = [];
  _HomePageState() {
    product.add(Model(
        name: "Artisti Shirt for man",
        details: "Red,  Full Sleve",
        price: 680,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpihlBSWTwv_MbA9ApuCJHD1Z_Jf0l9fO-_w&usqp=CAU"));
    product.add(Model(
        name: "Ipad 12.9 inch",
        details: "F54j8",
        price: 100000,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrnkfIBgTkGNPEJiB4NXGyX7Hb3SKd7Rjv1dtyV5P2SbopbYloWa9b41YVnjUg3qOK7qw&usqp=CAU"));

    product.add(Model(
        name: "JBL Wireless Headphones",
        details: "Blue,  T450BT",
        price: 2500,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMIakZdvlWLKpfeuDKBupb0T4j70SvXlXb8ck9Qp9VWFOxUQyP98-C1Atg92-tEsyaBVE&usqp=CAU"));
    product.add(Model(
        name: "Wonder Hodie for woman",
        details: "Blue,  Full Sleve",
        price: 1100,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUbRvf68HvumDuNvKG9sg2G2rkTo6iGm4z9Q&usqp=CAU"));
    product.add(Model(
        name: "JBL Wireless Headphones",
        details: "Blue,  T450BT",
        price: 2500,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMIakZdvlWLKpfeuDKBupb0T4j70SvXlXb8ck9Qp9VWFOxUQyP98-C1Atg92-tEsyaBVE&usqp=CAU"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 30, color: Colors.grey),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: Colors.deepOrange,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "5 Items in your cart",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: product.length,
              itemBuilder: (context, index) {
                final list = product[index];
                return ListTile(
                  isThreeLine: true,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Page2(
                              model: list,
                            )));
                  },
                  leading: Hero(
                    tag: list,
                    child: Image.network(
                      "${product[index].image}",
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    "${product[index].name}",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black87),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${product[index].details}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      Text(
                        "${product[index].price}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.blueAccent),
                      ),
                    ],
                  ),
                );
              }),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(onPressed: () {}, child: Text("   CHECKOUT   "))
        ],
      ),
    );
  }
}
