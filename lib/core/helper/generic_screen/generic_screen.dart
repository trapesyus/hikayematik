import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:printing/printing.dart';
import 'package:test_project/core/extensions/padding_extension.dart';
import 'package:test_project/core/extensions/size_extension.dart';
import 'package:test_project/core/helper/hikayematik_app_bar/hikayematik_app_bar.dart';
import 'package:test_project/core/widgets/progress_indicator.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
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
                    _mainContainer(context, _screenModel)
                        .getPaddingOnly(context: context, top: 0.23),
                  ],
                )
              : const CustomCircularProgress();
        },
      ),
    );
  }

  Container _mainContainer(
      BuildContext context, GenericScreenModel _screenModel) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.containterDarkColor,
      ),
      alignment: Alignment.center,
      height: context.getSizeHeight(size: 0.5),
      padding: EdgeInsets.only(top: context.getSizeHeight(size: 0.04)),
      margin: EdgeInsets.symmetric(horizontal: context.getSizeWidth(size: 0.2)),
      child: _gridViewBuilder(context, _screenModel),
    );
  }

  GridView _gridViewBuilder(
      BuildContext context, GenericScreenModel _screenModel) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: context.getSizeHeight(size: 0.04)),
      itemCount:
          _screenModel.data.length, // Öğelerin sayısını burada belirliyoruz
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // İki sütunlu düzen
        crossAxisSpacing:
            context.getSizeWidth(size: 0.02), // Sütunlar arası boşluk
        mainAxisSpacing:
            context.getSizeHeight(size: 0.02), // Satırlar arası boşluk
        childAspectRatio: 6, // Çocuk elemanların en-boy oranı
      ),
      itemBuilder: (context, index) =>
          _buttonContainer(_screenModel, index, context),
    );
  }

  Container _buttonContainer(
      GenericScreenModel _screenModel, int index, BuildContext context) {
    return Container(
        color: ColorConstants.appbarTitleColor,
        child: _buttonListTile(_screenModel, context, index));
  }

  ListTile _buttonListTile(
      GenericScreenModel _screenModel, BuildContext context, int index) {
    return ListTile(
      onTap: () async {
        await _screenModel.getData(tableName);

        if (context.mounted) {
          await _showDialog(context, _screenModel, index);
        }
        final pdf = pw.Document();
        pdf.addPage(
          pw.Page(
            build: (pw.Context context) {
              return pw.Center(
                child: pw.Text(
                    '${_screenModel.data[index].title} \n${_screenModel.data[index].content}',
                    style: pw.TextStyle(font: pw.Font.helvetica())),
              );
            },
          ),
        );

        final output = await getTemporaryDirectory();
        final file = File("${output.path}/example.pdf");
        await file.writeAsBytes(await pdf.save());

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('PDF başarıyla kaydedildi: ${file.path}')),
        );

        // PDF dosyasını açmak için varsayılan PDF görüntüleyicisini kullanın
        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save(),
        );
      },
      leading: CustomText(
          text: '${tableName.toUpperCase()}  ${index + 1}',
          color: ColorConstants.whiteColor),
    );
  }

  Future<dynamic> _showDialog(
      BuildContext context, GenericScreenModel _screenModel, int index) {
    return showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.start,
        alignment: Alignment.topCenter,
        backgroundColor: ColorConstants.appbarTitleColor,
        actions: [
          SizedBox(
            height: context.getSizeHeight(size: 0.1),
            width: context.getSizeWidth(size: 0.22),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                              text: _screenModel.isPrinting
                                  ? 'Yazdırma İşlemi Gerçekleştiriliyor..'
                                  : 'Yazdırma İşlemi Gerçekleştirildi.',
                              color: ColorConstants.whiteColor)
                          .getPadding(
                              context: context,
                              sizeHeight: 0.02,
                              sizeWidth: 0.02),
                      CustomText(
                          text: _screenModel.data[index].content,
                          color: ColorConstants.whiteColor)
                    ],
                  ),
                  CustomIconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
