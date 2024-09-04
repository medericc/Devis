import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/devis.dart';

Future<void> generateDevisPDF(Devis devis) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Devis pour ${devis.clientName}', style: pw.TextStyle(fontSize: 24)),
            pw.SizedBox(height: 20),
            pw.Text('Adresse: ${devis.clientAddress}'),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              headers: ['Description', 'Quantité', 'Prix unitaire', 'Total'],
              data: devis.services.map((service) {
                return [
                  service.description,
                  service.quantity.toString(),
                  service.cost.toString(),
                  (service.cost * service.quantity).toString(),
                ];
              }).toList(),
            ),
            pw.SizedBox(height: 20),
            pw.Text('Total général: ${devis.total.toStringAsFixed(2)}€'),
          ],
        );
      },
    ),
  );

  await Printing.sharePdf(bytes: await pdf.save(), filename: 'devis_${devis.clientName}.pdf');
}
