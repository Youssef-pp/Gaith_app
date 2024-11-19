import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCart extends StatelessWidget {
  int idDonation;
  String image;
  int price;
  String ?title;
   CardCart({super.key,required this.idDonation,required this.image,required this.price,required this.title});

  @override
  Widget build(BuildContext context) {
    return
      Container(

        padding:const EdgeInsets.all(5.0),
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child:
        Row(

          children: [
            Expanded(flex: 1,child: ClipRRect(borderRadius: BorderRadius.circular(5),child: Image.network(image,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,height: MediaQuery.of(context).size.height,))),
           10.horizontalSpace,
            Expanded(
              flex: 2,
              child: Column(

         crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                Text(title.toString(),style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w700))) ,
                   5.verticalSpace,
                    Row(
                      children: [
                        Text(price.toString(),style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.w500))),
                        5.horizontalSpace,
                        Text('جنيه مصرى',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.w700))) ,
                      ],
                    ) ,
              ],),

            ),

          ],
        ),
      );
  }
}