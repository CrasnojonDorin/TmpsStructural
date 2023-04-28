class PdfReader {
  void readPdf(String filename) {
    print('Reading PDF file: $filename');
  }
}

abstract class FileReader {
  void readFile(String filename);
}

class PdfReaderAdapter implements FileReader {
  final PdfReader _pdfReader;

  PdfReaderAdapter(this._pdfReader);

  @override
  void readFile(String filename) {
    if (filename.endsWith('.pdf')) {
      _pdfReader.readPdf(filename);
    } else {
      print('Converting $filename to PDF');

      final pdfFilename = '${filename.split('.').first}.pdf';
      print('Converted $filename to $pdfFilename');

      _pdfReader.readPdf(pdfFilename);
    }
  }
}

class Client {
  void readFile(FileReader fileReader, String filename) {
    fileReader.readFile(filename);
  }
}

void main() {
  final client = Client();

  final pdfReader = PdfReader();
  final pdfReaderAdapter = PdfReaderAdapter(pdfReader);

  client.readFile(pdfReaderAdapter, 'myFile.pdf');

  client.readFile(pdfReaderAdapter, 'myFile.doc');
}
