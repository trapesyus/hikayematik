import 'package:flutter/material.dart';
import 'package:test_project/core/constants/color_constants.dart';
import 'package:test_project/core/constants/image_constants.dart';
import 'package:test_project/core/constants/string_constants.dart';
import 'package:test_project/core/extensions/navigate_effective_extension.dart';
import 'package:test_project/core/extensions/padding_extension.dart';
import 'package:test_project/core/extensions/size_extension.dart';
import 'package:test_project/core/extensions/snackbar_extension.dart';
import 'package:test_project/core/widgets/text_widget.dart';
import 'package:test_project/core/widgets/title_text_widget.dart';
import 'package:test_project/screen/biografi_screen/biografi_screen.dart';
import 'package:test_project/screen/deografi_screen/deografi_screen.dart';
import 'package:test_project/screen/deyimler_ve_hikayeler_screen/deyimler_ve_hikayeler_screen.dart';
import 'package:test_project/screen/dram_ask_screen/dram_ask_screen.dart';
import 'package:test_project/screen/masal_screen/masal_screen.dart';
import 'package:test_project/screen/pratik_bilgiler_screen/pratik_bilgiler_screen.dart';
import 'package:test_project/screen/tarihi_yerler_screen/tarihi_yerler_screen.dart';

// deografi,dram aşk, masal , deyimler ve hikayeler,tarihi yerler,I'm sohbet ,pratik bilgiler, biografi

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: CustomTitleText(
            title: StringConstants.appName, color: ColorConstants.whiteColor),
        backgroundColor: ColorConstants.appbarTitleColor,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.center,
            height: context.getSizeHeight(size: 0.94),
            width: context.getSizeWidth(size: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox().getPaddingOnly(context: context, bottom: 0.1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: context.getSizeHeight(size: 0.06),
                              right: context.getSizeWidth(size: 0.04)),
                          child: Column(
                            children: [
                              _circleAvatarTitle(
                                context: context,
                                image: ImageConstants.imageDeografi,
                                categoryTitle: 'Deografi',
                                onTap: () async => await const DeografiScreen()
                                    .navigateEffectiveTo(context: context),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: context.getSizeHeight(size: 0.06)),
                          child: Column(
                            children: [
                              _circleAvatarTitle(
                                  onTap: () async => await const DramAskScreen()
                                      .navigateEffectiveTo(context: context),
                                  context: context,
                                  image: ImageConstants.imageDramaVeAsk,
                                  categoryTitle: StringConstants.dramAsk),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: context.getSizeHeight(size: 0.06),
                              left: context.getSizeWidth(size: 0.04)),
                          child: Column(
                            children: [
                              _circleAvatarTitle(
                                  onTap: () async => await const MasalScreen()
                                      .navigateEffectiveTo(context: context),
                                  context: context,
                                  image: ImageConstants.imageMasal,
                                  categoryTitle: StringConstants.masal),
                            ],
                          ),
                        ),
                      ],
                    ).getPaddingOnly(context: context, bottom: 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _circleAvatarTitle(
                            onTap: () async => await const BiografiScreen()
                                .navigateEffectiveTo(context: context),
                            context: context,
                            image: ImageConstants.imageBiografi,
                            categoryTitle: StringConstants.biografi),
                        Container(
                            margin: EdgeInsets.only(
                                left: context.getSizeWidth(size: 0.07),
                                right: context.getSizeWidth(size: 0.06)),
                            child: _circleAvatarTitle(
                                onTap: () {},
                                context: context,
                                image: ImageConstants.imageAppLogo,
                                categoryTitle: '')),
                        _circleAvatarTitle(
                            onTap: () async =>
                                await const DeyimlerVeHikayelerScreen()
                                    .navigateEffectiveTo(context: context),
                            context: context,
                            image: ImageConstants.imageDeyimlerVeHikayeler,
                            categoryTitle: StringConstants.deyimlerVeHikayeler)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: context.getSizeHeight(size: 0.04)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _tarihiYerler(context),
                          _pratikBilgiler(context),
                          _sohbet(context),
                        ],
                      ).getPaddingOnly(context: context, bottom: 0.04),
                    ),
                  ],
                ),
                _bottomLogo(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _tarihiYerler(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: context.getSizeHeight(size: 0.04),
          right: context.getSizeWidth(size: 0.04)),
      child: Column(
        children: [
          _circleAvatarTitle(
              onTap: () async => await const TarihiYerlerScreen()
                  .navigateEffectiveTo(context: context),
              context: context,
              image: ImageConstants.imageTarihiYerler,
              categoryTitle: StringConstants.tarihiYerler),
        ],
      ),
    );
  }

  Container _pratikBilgiler(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.getSizeHeight(size: 0.06)),
      child: Column(
        children: [
          _circleAvatarTitle(
              onTap: () async => await const PratikBilgilerScreen()
                  .navigateEffectiveTo(context: context),
              context: context,
              image: ImageConstants.imagePratikBilgiler,
              categoryTitle: StringConstants.pratikBilgiler),
        ],
      ),
    );
  }

  Container _sohbet(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: context.getSizeHeight(size: 0.04),
        left: context.getSizeWidth(size: 0.04),
      ),
      child: Column(
        children: [
          _circleAvatarTitle(
              onTap: () => context.snackBarExtension(
                  content: 'Bu sayfa henüz hazır değil..'),
              context: context,
              image: ImageConstants.imageImSohbet,
              categoryTitle: StringConstants.imSohbet),
        ],
      ),
    );
  }

  Image _bottomLogo(BuildContext context) {
    return Image.asset(
      ImageConstants.imageLogo,
      filterQuality: FilterQuality.high,
      fit: BoxFit.cover,
      height: context.getSizeHeight(size: 0.18),
    );
  }

  GestureDetector _circleAvatarTitle(
      {required BuildContext context,
      required String image,
      required Function() onTap,
      required String categoryTitle}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
              radius: context.getSizeWidth(size: 0.03),
              backgroundImage: AssetImage(
                image,
              )),
          CustomText(text: categoryTitle, color: ColorConstants.whiteColor)
        ],
      ),
    );
  }
}
