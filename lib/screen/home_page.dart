import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';

import 'scanned_text_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _ocrCamera = FlutterMobileVision.CAMERA_BACK;
  String _text = "null";

  @override
  void initState() {
    FlutterMobileVision.start().then((previewSizes) => setState(() {
          // _previewOcr = previewSizes[_cameraOcr]!.first;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, //Colors.white70,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('OCR In Flutter'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: _read,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assests/images/phone.png",
                      width: MediaQuery.of(context).size.width * .80,
                      color: Colors.blue,
                    ),
                    Container(
                      //color: Colors.red,
                      width: MediaQuery.of(context).size.width * .60,
                      child: Divider(
                        color: Colors.red,
                        thickness: 7,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: InkWell(
                  onTap: _read,
                  child: Text(
                    'Scan',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _read() async {
    List<OcrText> texts = [];
    try {
      _text = "";
      texts = [];
      texts = await FlutterMobileVision.read(
        multiple: true,
        camera: _ocrCamera,
        waitTap: true,
      );
      texts.forEach((element) {
        _text += ("\n ${element.value}");
      });
      // _text = texts.last.value;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScannedTextPage(scannedText: _text)),
      );
      setState(() {
        //_text = texts[0].value;
      });
    } on Exception {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ScannedTextPage(scannedText: "Failed to recognize text")),
      );
    }
  }
}
