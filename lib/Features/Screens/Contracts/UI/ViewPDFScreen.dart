import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewScreen extends StatefulWidget {
  // const PDFViewScreen({Key? key}) : super(key: key);
  String namePDF;
  PDFViewScreen(this.namePDF);
  @override
  State<PDFViewScreen> createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    _pdfViewerKey.currentState?.openBookmarkView();
    log("${API.imageUrl}${widget.namePDF}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SfPdfViewer.network("${API.imageUrl}${widget.namePDF}"),
        ),
      ),
    )
      ;
  }
}
