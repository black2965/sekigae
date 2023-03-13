import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PdfCreator {
  static Future<Document> create() async {
    final pdf = Document();
    final font = await PdfGoogleFonts.sawarabiGothicRegular();

    // 表紙
    final sheet = Page(
      pageTheme: PageTheme(
        theme: ThemeData.withFont(base: font),
        pageFormat: PdfPageFormat.a4,
        orientation: PageOrientation.portrait,
      ),
      build: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //write here
            Text("this is preview"),
            Text("これはプレビューです"),
          ],
        ),
      ),
    );

    pdf.addPage(sheet);
    return pdf;
  }
}
