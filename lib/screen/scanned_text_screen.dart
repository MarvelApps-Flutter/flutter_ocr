import 'package:flutter/material.dart';

class ScannedTextPage extends StatefulWidget {
  String scannedText;
  ScannedTextPage({super.key, required this.scannedText});

  @override
  State<ScannedTextPage> createState() => _ScannedTextPageState();
}

class _ScannedTextPageState extends State<ScannedTextPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, //Colors.white70,
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text('OCR Text'),
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * .20,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/images/phone.png",
                            width: MediaQuery.of(context).size.width * .20,
                            color: Colors.blue,
                          ),
                          Container(
                            //color: Colors.red,
                            width: MediaQuery.of(context).size.width * .25,
                            child: Divider(
                              color: Colors.red,
                              thickness: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Scanned Text",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  widget.scannedText,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
