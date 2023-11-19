import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'classes.dart';

void main() => runApp(Test());

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();

  }
    List<productItem> _item = [];

  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: "SanFransisco",
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: GridView.count(
            padding: EdgeInsets.all(5),
            crossAxisCount: 2,
            children: List.generate(_item.length, (int i) {
              return MyCard(_item[i],context);
            }),
          ),
          appBar: AppBar(
            title: Icon(Icons.apple_rounded,color: Colors.black,size: 40,),
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            elevation: 0.5,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.dark_mode_rounded, color: Colors.black87),
                  onPressed: () => {})
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: Center(child: Icon(Icons.apple, size: 35)),
              backgroundColor: Colors.black,

              onPressed: () => {}),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigation(),
        ));
  }

  void fetchProducts() async {
    String ProductsURL = "https://ixwp.ir/products.json";
    Response response = await get(Uri.parse(ProductsURL));

    setState(() {
      var MyProducts = jsonDecode(response.body);
      for(var prd in MyProducts) {
        var Product = productItem(prd['id'],prd['name'],prd['price'],prd['desc'],prd['image'],prd['off']);
        _item.add(Product);
      }
    });

  }
}
