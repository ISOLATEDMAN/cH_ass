import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BulletPoints extends StatelessWidget {
  final List<String> items;

  const BulletPoints({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Padding(
        padding: EdgeInsets.only(bottom: 0.5.h),
        child: Row(
          children: [
            Container(
              width: 1.w,
              height: 1.w,
              margin: EdgeInsets.only(right: 2.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
            Text(
              item,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w900,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }
}