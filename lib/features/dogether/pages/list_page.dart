import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/features/dogether/widgets/custom_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key, this.lid});

  final String? lid;

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppConst.prLight),
            onPressed: () => context.pop(),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: "List Name",
                style: customTextStyle(32, AppConst.prLight, FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppConst.secGold,
              borderRadius: BorderRadius.all(
                Radius.circular(AppConst.appRadius),
              ),
            ),
            child: TabBar(
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                color: AppConst.prGray,
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConst.appRadius)),
              ),
              labelPadding: EdgeInsets.zero,
              isScrollable: false,
              labelColor: Colors.transparent,
              unselectedLabelColor: AppConst.secGold,
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  child: SizedBox(
                    width: AppConst.appWidth * 0.5,
                    child: Center(
                      child: CustomText(
                        text: "Pending",
                        style: customTextStyle(
                            16, AppConst.prLight, FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: AppConst.appWidth * 0.5,
                    child: Center(
                      child: CustomText(
                        text: "Completed",
                        style: customTextStyle(
                            16, AppConst.prLight, FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
