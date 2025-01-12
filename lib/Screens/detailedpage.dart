import 'package:ass_captianhub/models/prod.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; 

class Detailedpage extends StatefulWidget {
  final Prod prod;
  Detailedpage({super.key, required this.prod});

  @override
  State<Detailedpage> createState() => _DetailedpageState();
}

class _DetailedpageState extends State<Detailedpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.prod.name),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 80.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), 
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.prod.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),

              Text(
                widget.prod.name,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                widget.prod.cost,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Features',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 1.h),
              for (var feature in widget.prod.features)
                Row(
                  children: [
                    Icon(Icons.check, size: 14.sp, color: Colors.green),
                    SizedBox(width: 5),
                    Text(
                      feature,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
              SizedBox(height: 2.h),

              Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20.sp,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${widget.prod.reviews.toString()} stars',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '(${widget.prod.noOfReviews} reviews)',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 2.h),

              Row(
                children: [
                  InkWell(
                    
                    child: Icon(
                      size: 22.sp,
                      widget.prod.likeornot ? Icons.favorite : Icons.favorite_border,
                      color: widget.prod.likeornot ? Colors.red : Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                        widget.prod.likeornot = !widget.prod.likeornot;
                      });
                    },
                  ),
                  SizedBox(width: 5),
                  Text(
                    widget.prod.likeornot ? 'Liked' : 'Like',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),

              // Additional Details
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              SizedBox(height: 3.h),

              // Add to Cart Button
              ElevatedButton(
                onPressed: () {
                  // Add to Cart functionality
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
