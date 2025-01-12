import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReviewStars extends StatelessWidget {
  final double rating;
  final int totalStars;
  final int? numberOfReviews;
  final double? starSize;
  final Color activeColor;
  final Color inactiveColor;

  const ReviewStars({
    Key? key,
    required this.rating,
    this.totalStars = 5,
    this.numberOfReviews,
    this.starSize,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
  })  : assert(rating >= 0 && rating <= totalStars),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(totalStars, (index) {
            return Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: index < rating ? activeColor : inactiveColor,
              size: starSize ?? 12.sp,
            );
          }),
        ),
        if (numberOfReviews != null) ...[
          SizedBox(width: 1.w),
          Text(
            '$numberOfReviews reviews',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.blue,
            ),
          ),
        ],
      ],
    );
  }
}