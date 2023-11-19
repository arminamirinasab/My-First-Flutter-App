import 'package:flutter/material.dart';
import 'productPage.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search, color: Colors.white),
                  Icon(Icons.shopping_cart, color: Colors.white),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  Icon(Icons.person, color: Colors.white)
                ],
              ),
            )
          ],
        ),
      ),
      color: Colors.black87,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
    );
  }
}

Card MyCard(product,context) {
  return Card(
    borderOnForeground: true,
    margin: EdgeInsets.all(7),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
    elevation: 0.5,
    child: InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => productPage()))
      },
      child: Center(
        child: Column(children: [
          Container(
              height: 110,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Image.network(product.image)),
          Container(
            child: Text(product.name,
                style: TextStyle(fontSize: 12)),
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: Text("\$" + product.price.toString(),
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          )
        ], crossAxisAlignment: CrossAxisAlignment.center),
      ),
    ),
  );
}

class productItem {
  int id;
  String name;
  double price;
  String desc;
  String image;
  bool off;

  productItem(
      this.id, this.name, this.price, this.desc, this.image, this.off);
}
