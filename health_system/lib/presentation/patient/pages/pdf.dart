import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class PDFPAGESSSS extends StatefulWidget {
  const PDFPAGESSSS({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<PDFPAGESSSS> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
      ),
      body: Center(
        child: TextButton(
          child: Text("Open PDF Viewer"),
          onPressed: () {
            // Show the dialog directly when the button is pressed
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    width: 600,
                    height: 600, 
                    child: Column(
                      children: [
                        AppBar(
                          title: const Text('PDF Viewer'),
                          automaticallyImplyLeading: false,
                          actions: [
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        Expanded(
                          child: SfPdfViewer.asset(
                            'assets/pdf.pdf',
                            key: _pdfViewerKey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
