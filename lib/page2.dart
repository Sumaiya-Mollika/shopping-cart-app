import 'package:exam/model.dart';
import 'package:exam/page1.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Page2 extends StatefulWidget {
  //const Page2({ Key? key }) : super(key: key);
  final Model? model;
  Page2({this.model});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Order Details",
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pop(MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.grey,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Text(
              "My Cart",
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "${widget.model!.image}",
                height: 150,
                width: 120,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.model!.name}",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.indigo),
                ),
                Text("${widget.model!.price}",
                    style: TextStyle(
                      fontSize: 25,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (_counter > 0) _counter--;
                          });
                        },
                        child: const Icon(Icons.remove_circle_outline,
                            color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '$_counter',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _counter++;
                          });
                        },
                        child: const Icon(Icons.add_circle_outline,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Text(
            "Order Info",
            style: TextStyle(
                color: Colors.indigo,
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub Total",
                style: TextStyle(fontSize: 20),
              ),
              Text("${widget.model!.price! * _counter}"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping Cost",
                  style: TextStyle(fontSize: 20),
                ),
                Text(" ${shippingcost}"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(fontSize: 20),
              ),
              Text("${widget.model!.price! * _counter + shippingcost}"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "ORDER NOW",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  int shippingcost = 10;
}
