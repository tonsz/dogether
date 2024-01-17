import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_outlined_box.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_field.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:dogether/features/dogether/widgets/custom_fab.dart';
import 'package:dogether/features/dogether/widgets/list_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90.h),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    text: "Dogether",
                    style:
                        customTextStyle(32, AppConst.prLight, FontWeight.bold),
                  ),
                ),
                HeightSpacer(ht: 20.h),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  controller: search,
                  hintText: "Search...",
                  prefixIcon: Container(
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(
                        Icons.search,
                        color: AppConst.prGray,
                      ),
                    ),
                  ),
                ),
                HeightSpacer(ht: 10.h)
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "My lists",
                style: customTextStyle(24, AppConst.prLight, FontWeight.bold),
              ),
              Container(
                child: GestureDetector(
                  onTap: null,
                  child: const Icon(
                    Icons.filter_list,
                    color: AppConst.prLight,
                  ),
                ),
              ),
            ],
          ),
          HeightSpacer(ht: 20.h),
          OutlinedBox(
            onTap: () => context.push('/list/123'),
            height: AppConst.appHeight * 0.1,
            child: const ListTitle(
                listName: "Home Chores",
                listDate: "Jan 5",
                listStatus: "Ongoing"),
          ),
        ],
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
