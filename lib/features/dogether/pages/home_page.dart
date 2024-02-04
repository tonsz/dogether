import 'package:dogether/common/models/list_model.dart';
import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_outlined_box.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_field.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:dogether/features/dogether/controllers/list_provider.dart';
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
    ref.watch(listStateProvider.notifier).refresh();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(170.h),
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
                  hintStyle:
                      customTextStyle(16, AppConst.prGray, FontWeight.normal),
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
                HeightSpacer(ht: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "My lists",
                      style: customTextStyle(
                          24, AppConst.prLight, FontWeight.bold),
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
              ],
            ),
          ),
        ),
      ),
      body: MyLists(),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => context.push('/add_list'),
      ),
    );
  }
}

class MyLists extends ConsumerWidget {
  const MyLists({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ListModel> listData = ref.watch(listStateProvider);

    // fetching lists that are the user's
    // var myLists = listData.where((element) => element.creatorId == 1);

    return ListView.builder(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 40,
      ),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        final data = listData[index];
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: OutlinedBox(
            onTap: () => context.push('/list/:${data.id}', extra: data),
            height: AppConst.appHeight * 0.1,
            child: ListTitle(
                listName: data.name!,
                listDate: data.dateCreated!,
                listStatus: "Hello"),
          ),
        );
      },
    );
  }
}
