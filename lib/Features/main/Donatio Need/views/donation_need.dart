import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/main/Donatio%20Need/views/widget/item_need_donation.dart';
import 'package:gaith/Features/main/Donatio%20Need/views/widget/personal%20_needs%20_page.dart';
import 'package:gaith/Features/main/Donatio%20Need/views/widget/report_need_page.dart';
import 'package:gaith/core/sharde/app_assets.dart';

class DonationNeedPage extends StatelessWidget {
  const DonationNeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xffF4F6FE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ItemNeedDonation(
              image: AppAssets.location_icon,
              text: 'تبليغ عن محتاج',
              screen: ReportNeedPage()),
          20.verticalSpace,
          ItemNeedDonation(
              image: AppAssets.open_hand,
              text: 'إحتياج شخصي',
              screen: PersonalNeedsPage()),
        ],
      ),
    );
  }
}
