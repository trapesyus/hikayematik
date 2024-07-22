import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/constants/color_constants.dart';
import 'package:test_project/core/widgets/icon_button_widget.dart';
import 'package:test_project/core/widgets/title_text_widget.dart';

class HikayematikAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool centerTitle;

  const HikayematikAppBar({
    super.key,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CustomIconButton(
        icon: const Icon(
          CupertinoIcons.back,
          color: ColorConstants.whiteColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: centerTitle,
      title: CustomTitleText(
        title: 'Hikayematik',
        color: ColorConstants.whiteColor,
      ),
      backgroundColor: ColorConstants.appbarTitleColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
