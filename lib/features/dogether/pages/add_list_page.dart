import 'package:dogether/common/models/list_model.dart';
import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_button.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_field.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:dogether/features/dogether/controllers/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddList extends ConsumerStatefulWidget {
  const AddList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddListState();
}

class _AddListState extends ConsumerState<AddList> {
  final TextEditingController listName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
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
                text: "Create a new list",
                style: customTextStyle(32, AppConst.prLight, FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: ListView(
          children: [
            HeightSpacer(ht: 40.h),
            CustomTextField(
              controller: listName,
              hintText: "Enter list name",
              hintStyle:
                  customTextStyle(16, AppConst.prGray, FontWeight.normal),
              keyboardType: TextInputType.name,
            ),
            HeightSpacer(ht: 20.h),
            CustomButton(
                onTap: () {
                  if (listName.text.isNotEmpty) {
                    ListModel list = ListModel(
                      name: listName.text,
                      creatorId: 1, // get this somewhere
                      dateCreated: DateTime.now().toString().substring(0, 10),
                    );
                    ref.read(listStateProvider.notifier).addList(list);
                    context.pop();
                  }
                },
                width: AppConst.appWidth * 0.8,
                height: AppConst.appHeight * 0.07,
                bgColor: AppConst.secTan,
                text: "Create")
          ],
        ),
      ),
    );
  }
}
