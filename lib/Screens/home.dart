import 'package:flutter/material.dart';
import 'package:ass_captianhub/widgets/ProdWid.dart';
import 'package:sizer/sizer.dart';
import '../models/prod.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample products
    List<Prod> products = [
      Prod(
        name: "Samsung Vacuum Cleaner",
        cost: "\$75",
        features: ['Dry clean', 'Cyclone filter', 'Convenient cord'],
        reviews: 4,
        noOfReviews: 15,
        likeornot: false,
        image:
            "https://rukminim2.flixcart.com/image/850/1000/vacuum-cleaner/z/w/h/samsung-ultra-original-imaerwfkvya82vfr.jpeg?q=90&crop=false",
        offerthere: false,
        offervalue: '',
      ),
      Prod(
        name: "Apple iPhone 14",
        cost: "\$999",
        features: ['A16 Bionic chip', '6.1-inch Super Retina', 'Ceramic Shield'],
        reviews: 5,
        noOfReviews: 200,
        likeornot: false,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq1wPYXBH9otqHc02myG3yWeYqsVumGBr-KA&s",
        offerthere: true,
        offervalue: '\$870',
      ),
      Prod(
        name: "Sony WH-1000XM5",
        cost: "\$400",
        features: ['Noise-canceling', '30-hour battery life', 'Lightweight design'],
        reviews: 4,
        noOfReviews: 85,
        likeornot: false,
        image:
            "https://m.media-amazon.com/images/I/61D4Z3yKPAL._AC_SL1500_.jpg",
        offerthere: false,
        offervalue: '',
      ),
      Prod(
        name: "Dell XPS 13 Laptop",
        cost: "\$10",
        features: ['13.4-inch InfinityEdge', '11th Gen Intel Core', 'Ultra-slim'],
        reviews: 4,
        noOfReviews: 120,
        likeornot: false,
        image:
            "https://i.pinimg.com/474x/97/cb/b5/97cbb5592d151b4caf2a92f1c00717f8.jpg",
        offerthere: false,
        offervalue: '',
      ),
      Prod(
        name: "Nike Air Max 270",
        cost: "\$150",
        features: ['Air cushioning', 'Breathable material', 'Durable design'],
        reviews: 4,
        noOfReviews: 60,
        likeornot: false,
        image:
            "https://i.pinimg.com/474x/a7/bf/96/a7bf9685fb0da63d9af4e1dcce8f31ac.jpg",
        offerthere: true,
        offervalue: '\$50',
      ),
      Prod(
        name: "Canon EOS R6",
        cost: "\$250",
        features: ['20 MP Full-Frame', '4K 60p video', 'Dual card slots'],
        reviews: 5,
        noOfReviews: 30,
        likeornot: false,
        image:
            "https://i.pinimg.com/474x/00/e0/64/00e06484ed4b4daf336131ce1c322734.jpg",
        offerthere: false,
        offervalue: '',
      ),
    ];


    List<List<Prod>> createProductRows(List<Prod> products) {
      List<List<Prod>> rows = [];
      for (int i = 0; i < products.length; i += 2) {
        rows.add(products.sublist(i, (i + 2) > products.length ? products.length : i + 2));
      }
      return rows;
    }

    List<List<Prod>> productRows = createProductRows(products);

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productRows.length,
          itemBuilder: (context, rowIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: productRows[rowIndex].map((product) {
                  return SizedBox(
                    width: 45.w, // Each product card's width
                    child: ProdWid(product: product),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
