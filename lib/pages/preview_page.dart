import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../util/pdf_creator.dart';

class PreviewPage extends StatelessWidget {

  const PreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Preview"),
        ),
        body: PdfPreview(
          maxPageWidth: 1800,
          allowPrinting: false,
          allowSharing: false,
          canChangeOrientation: false,
          canChangePageFormat: false,
          canDebug: false,
          loadingWidget: const LinearProgressIndicator(),
          build: (format) async {
            final pdf = await PdfCreator.create();
            return await pdf.save();
          },
        ),
    );
  }
}