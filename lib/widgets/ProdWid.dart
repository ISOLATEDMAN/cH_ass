import 'package:ass_captianhub/Screens/detailedpage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ass_captianhub/widgets/bulletpts.dart';
import 'package:ass_captianhub/widgets/review.dart';
import '../models/prod.dart';

class ProdWid extends StatefulWidget {
  final Prod product;

  const ProdWid({Key? key, required this.product}) : super(key: key);

  @override
  State<ProdWid> createState() => _ProdWidState();
}

class _ProdWidState extends State<ProdWid> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Detailedpage(prod: widget.product),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: FadeTransition(opacity: animation, child: child));
            },
          ),
        );
      },
      child: Container(
        width: 45.w,
        height: 39.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  widget.product.offerthere ?

                  Column(
                    children: [
                      Text(widget.product.offervalue.toString(),
                      style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),),
                      Text(widget.product.cost,
                      style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough
                    ),
                      ),
                    ],
                  ):

                  Text(
                    widget.product.cost,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                  
                ],
              ),
              Text(
                widget.product.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              BulletPoints(items: widget.product.features),
              SizedBox(height: 1.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Icon(
                      widget.product.likeornot ? Icons.favorite : Icons.favorite_border,
                      color: widget.product.likeornot ? Colors.red : Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                        widget.product.likeornot = !widget.product.likeornot;
                      });
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Save for',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'later',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReviewStars(rating: widget.product.reviews.toDouble()),
                      Text(
                        '${widget.product.noOfReviews} reviews',
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
