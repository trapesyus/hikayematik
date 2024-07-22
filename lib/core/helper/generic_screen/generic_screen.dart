import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:test_project/core/extensions/padding_extension.dart';
import 'package:test_project/core/extensions/size_extension.dart';
import 'package:test_project/core/helper/hikayematik_app_bar/hikayematik_app_bar.dart';
import 'package:test_project/core/widgets/progress_indicator.dart';

import '../../constants/color_constants.dart';
import '../../widgets/icon_button_widget.dart';
import '../../widgets/text_widget.dart';
import 'generic_screen_model/generic_screen_model.dart';

class GenericScreen extends StatelessWidget {
  final String tableName;

  GenericScreen({required this.tableName, super.key}) {
    reaction(
        (_) async => await _genericScreenModel.initialize(tableName), (_) {});
  }

  final GenericScreenModel _genericScreenModel = genericInstance;

  @override
  Widget build(BuildContext context) {
    final GenericScreenModel _screenModel = genericInstance;

    return Scaffold(
      backgroundColor: ColorConstants.bgColor,
      appBar: const HikayematikAppBar(),
      body: Observer(
        builder: (_) {
          return _screenModel.isLoading
              ? ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.containterDarkColor,
                      ),
                      alignment: Alignment.center,
                      height: context.getSizeHeight(size: 0.5),
                      padding: EdgeInsets.only(
                          top: context.getSizeHeight(size: 0.04)),
                      margin: EdgeInsets.symmetric(
                          horizontal: context.getSizeWidth(size: 0.2)),
                      child: GridView.builder(
                        padding: EdgeInsets.only(
                            bottom: context.getSizeHeight(size: 0.04)),
                        itemCount: _screenModel.data
                            .length, // Öğelerin sayısını burada belirliyoruz
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // İki sütunlu düzen
                          crossAxisSpacing: context.getSizeWidth(
                              size: 0.02), // Sütunlar arası boşluk
                          mainAxisSpacing: context.getSizeHeight(
                              size: 0.02), // Satırlar arası boşluk
                          childAspectRatio: 6, // Çocuk elemanların en-boy oranı
                        ),
                        itemBuilder: (context, index) => Container(
                          color: ColorConstants.appbarTitleColor,
                          child: Observer(builder: (context) {
                            return ListTile(
                              onTap: () async {
                                await _screenModel.getData(tableName);
                                await showDialog(
                                  // ignore: use_build_context_synchronously
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actionsAlignment: MainAxisAlignment.start,
                                    alignment: Alignment.topCenter,
                                    backgroundColor:
                                        ColorConstants.appbarTitleColor,
                                    actions: [
                                      SizedBox(
                                        height:
                                            context.getSizeHeight(size: 0.1),
                                        width: context.getSizeWidth(size: 0.22),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  CustomText(
                                                          text: _screenModel
                                                                  .isPrinting
                                                              ? 'Yazdırma İşlemi Gerçekleştiriliyor..'
                                                              : 'Yazdırma İşlemi Gerçekleştirildi.',
                                                          color: ColorConstants
                                                              .whiteColor)
                                                      .getPadding(
                                                          context: context,
                                                          sizeHeight: 0.02,
                                                          sizeWidth: 0.02),
                                                  CustomText(
                                                      text: _screenModel
                                                          .data[index].content,
                                                      color: ColorConstants
                                                          .whiteColor)
                                                ],
                                              ),
                                              CustomIconButton(
                                                  icon: const Icon(Icons.close),
                                                  onPressed: () =>
                                                      Navigator.pop(context))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              leading: CustomText(
                                  text:
                                      '${tableName.toUpperCase()}  ${index + 1}',
                                  color: ColorConstants.whiteColor),
                            );
                          }),
                        ),
                      ),
                    ).getPaddingOnly(context: context, top: 0.23),
                  ],
                )
              : const CustomCircularProgress();
        },
      ),
    );
  }
}
