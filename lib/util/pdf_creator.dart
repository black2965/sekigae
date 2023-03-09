import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PdfCreator {
  static Future<Document> create() async {
    final pdf = Document();
    final Font font = await PdfGoogleFonts.shipporiMinchoRegular();

    // 表紙
    final sheet = Page(
      pageTheme: const PageTheme(
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