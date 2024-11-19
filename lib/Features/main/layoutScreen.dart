import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:gaith/Features/main/payment/payment_screen.dart';
import 'package:gaith/Features/main/payment/widget/payment_error_screen.dart';
import 'package:gaith/Features/main/payment/widget/payment_scuccess_screen.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../core/sharde/widget/log_out.dart';
import '../../core/sharde/widget/navigation.dart';

import '../Auth/profile/Controller/profile_view_cubit.dart';
import '../Auth/profile/Controller/profile_view_state.dart';
import '../Auth/profile/Screens/profile_view.dart';

import '../drawer/zakat/zakat_screen.dart';
import 'home/feature/manager/home_cubite.dart';
import 'home/feature/manager/home_view__state.dart';


class LayoutScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
          Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'غيث',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Ottoman',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              actions: [

                BlocConsumer<ProfileViewCubit, ProfileViewState>(
                  listener: (context,state)
                  {},
                  builder: (context,state)
                  {
                    return  ConditionalBuilder(
                      condition: BlocProvider.of<ProfileViewCubit>(context).profileModel!=null,
                      builder: (context)=>
                          Container(
                            child: ClipOval(
                              child: InkWell(
                                onTap: (){
                                  navigato(context, const ProfileView());
                                },
                                child: Image.network(
                                  BlocProvider.of<ProfileViewCubit>(context).profileModel!.user!.img,
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                      fallback: (context)=>const Text('jj'),
                    );

                  },


            ),
              ],
              leading: IconButton(
                icon: const Icon(Icons.menu_open_sharp),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
            drawer:

            FractionallySizedBox(
              widthFactor: 0.7,

              child: Drawer(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
              
                        Colors.white,
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.centerStart,
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      DrawerHeader(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Image.asset(AppAssets.logo3,),
                      ),
                      ListTile(
                        leading: const Icon(Icons.person, color:Color(0xff529C9C)),
                        title: const Text(
                          'الملف الشخصى',
                          style: TextStyle(
                            color: Color(0xff2B2B2B),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                        onTap: () {
                          navigato(context, const ProfileView());
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.closed_caption, color: Color(0xff529C9C)),
                        title: const Text(
                          'احسب زكاتك',
                          style: TextStyle(
                            color: Color(0xff2B2B2B),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                        onTap: () {
                          navigato(context, ZakatScreen());
                        },
                      ),
                      
                   
                      ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color:Color(0xff529C9C),
                        ),
                        title: const Text(
                          'تسجيل خروج',
                          style: TextStyle(
                            color: Color(0xff2B2B2B),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'تسجيل الخروج',
                                  style: GoogleFonts.cairo(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff2B2B2B),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Lottie.asset('assets/images/logOut3.json'),
                                    const SizedBox(height: 20),
                                    Text(
                                      'هل أنت متأكد أنك تريد تسجيل الخروج؟',
                                      style: GoogleFonts.cairo(
                                        textStyle: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff2B2B2B),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      'إلغاء',
                                      style: GoogleFonts.cairo(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff2B2B2B),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      'تسجيل الخروج',
                                      style: GoogleFonts.cairo(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff22AAE4),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      SingOut(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

              bottomNavigationBar:BlocConsumer<HomeViewCubit, HomeViewState>(
    listener: (context, state) {},
    builder: (context, state) {
    return
            SalomonBottomBar(
                curve: Curves.easeOutQuint,
                currentIndex:
                    BlocProvider.of<HomeViewCubit>(context).CurrentIndex,
                onTap: (index) {
                  BlocProvider.of<HomeViewCubit>(context)
                      .Changecurrentindex(index);
                },
                items: [
                  SalomonBottomBarItem(
                    icon: Icon(FeatherIcons.home),
                    title: const Text("الصفحه الرئسيه"),
                    selectedColor: const Color(0xff22AAE4),
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(FeatherIcons.anchor),
                    title: const Text("المحتاجين"),
                    selectedColor: const Color(0xff22AAE4),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.shopping_cart),
                    title: const Text("السله"),
                    selectedColor: const Color(0xff22AAE4),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.volunteer_activism),
                    title: const Text("التطوع"),
                    selectedColor: const Color(0xff22AAE4),
                  ),
                ],
              );}
            ),
            body: BlocConsumer<HomeViewCubit, HomeViewState>(
    listener: (context, state) {},
    builder: (context, state) {
    return
             Stack(
                children: [
                  BlocProvider.of<HomeViewCubit>(context).Scrreen[
                      BlocProvider.of<HomeViewCubit>(context).CurrentIndex],
                ],
              );}

            ));


  }
}
