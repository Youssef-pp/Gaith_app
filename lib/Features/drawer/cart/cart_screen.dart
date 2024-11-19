import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/drawer/cart/widget/card_cart.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/sharde/widget/navigation.dart';
import '../../main/donor/cubit/home_view_cubit.dart';
import '../../main/donor/cubit/home_view_state.dart';
import '../../main/payment/payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FE),

      body: Builder(
        builder: (context) {
          BlocProvider.of<DonorViewCubit>(context).getCartAll();
          return BlocConsumer<DonorViewCubit, DonorViewState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Center(
                child: BlocProvider.of<DonorViewCubit>(context).cartModel ==
                        null
                    ? SizedBox(height: MediaQuery.of(context).size.height,width:MediaQuery.of(context).size.width,child: const Center(child: CircularProgressIndicator(color: Color(0xff529C9C),)))
                    : Stack(
                  alignment: Alignment.bottomLeft,
                      children: [
                        ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = BlocProvider.of<DonorViewCubit>(context)
                                  .cartModel!
                                  .carts![index];
                              return Dismissible(
                                key: Key(item.id.toString()),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: const Text(
                                    'حذف',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onDismissed: (direction) {
                                  setState(() {
                                    BlocProvider.of<DonorViewCubit>(context)
                                        .cartModel!
                                        .carts!
                                        .removeAt(index);
                                  });

                                  BlocProvider.of<DonorViewCubit>(context)
                                      .deleteItemInCart(donationId: item.id!);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(backgroundColor: Colors.red,content: Text('تم الحذف')),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 4),
                                  child: CardCart(
                                    title: item.name,
                                    idDonation: item.id!,
                                    image: item.img!,
                                    price: item.price!,
                                  ),
                                ),
                              );
                            },
                            itemCount: BlocProvider.of<DonorViewCubit>(context)
                                .cartModel!
                                .carts!
                                .length,
                          ),

                        InkWell(
                          onTap: (){
                               if(int.parse(BlocProvider.of<DonorViewCubit>(context).cartModel!.total)>0)
                                 {
                                   navigato(context, PaymentScreen(price: BlocProvider.of<DonorViewCubit>(context).cartModel!.total,));
                                 }

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height:60,
                              decoration: BoxDecoration(
                                  color: const Color(0xff22AAE4),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              padding: const EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width,

                              child: Column(

                                children: [
                                  Text('اجمالى مبلغ السله',
                                    style:  TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      fontFamily: 'Tajawal',


                                    ),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(' ${BlocProvider.of<DonorViewCubit>(context).cartModel!.total}',
                                        style:  TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          fontFamily: 'Tajawal',


                                        ),),
                                      Text('تبرع بالمبلغ',
                                        style:  TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          fontFamily: 'Tajawal',


                                        ),),


                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
              );
            },
          );
        }
      ),
    );
  }
}
