import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';
import 'package:qr_scanner_app/validationScreen.dart';

GlobalKey qrKey = GlobalKey();
var qrText = "-CHECKING-";
var instring = "";
var payIDtxt = "";
var siz;

var resultText = "";
var refText = "";
int found = 0;
List dataData = [];
List d = ["abhay", "ysd", "kk"];
var readData = 0;
var DoneComputing = 0;
int v = 0;
bool canScan = true;

class HomeScreen extends StatefulWidget {
  final int foundReset;
  HomeScreen({Key key, @required this.foundReset}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  QRViewController controller;
  var changeText = "cgange me!";

  @override

//My function ends here
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    if (widget.foundReset != null) {
      found = 0;
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // 'QR SCANNER: $changeText',
          'QR SCANNER',
          style: TextStyle(
              color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black45,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        siz = constraints.maxHeight;
        if (constraints.maxHeight < 600)
          return _SmallPhoneView();
        else
          return _LargePhoneView();
      }),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void setTextFun() {
    if (readData == 1) {
      for (var a in dataData) {
        if (a == qrText) {
          found = 1;
          break;
        } else
          found = 0;
      }
      if (found == 1) {
        setState(() {
          changeText = 'Verified';
          found = 0;
        });
      } else {
        setState(() {
          changeText = 'Couldnt Verify';
          found = 0;
        });
      }
    } else {
      setState(() {
        changeText = 'Sorry, Try again later!';
      });
    }
  }

  Widget _LargePhoneView() {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Center(
              child: QRView(
                  key: qrKey,
                  overlay: QrScannerOverlayShape(
                      borderRadius: 10,
                      borderColor: Colors.yellowAccent,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: 250),
                  onQRViewCreated: _onQRViewCreated),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '-SCANNING-',
                style:
                    TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _SmallPhoneView() {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Center(
              child: QRView(
                  key: qrKey,
                  overlay: QrScannerOverlayShape(
                      borderRadius: 8,
                      borderColor: Colors.yellowAccent,
                      borderLength: 18,
                      borderWidth: 8,
                      cutOutSize: 230),
                  onQRViewCreated: _onQRViewCreated),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '-SCANNING-',
                style:
                    TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    print("Executing");
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (found == 0) {
        setState(() {
          instring = scanData;
          print("'''''''''''''''''''''''''''''''''''''''''''''''''''''''''");
          print("Instring: " + instring);
          //Decryption

          String result = "";
          List finalstring = [];

          int i = 0;
          for (; i < instring.length; i++) {
            switch (instring[i]) {
              case 'z':
                finalstring.add('a');
                break;
              case 'y':
                finalstring.add('b');
                break;
              case 'x':
                finalstring.add('c');
                break;
              case 'w':
                finalstring.add('d');
                break;
              case 'v':
                finalstring.add('e');
                break;
              case 'u':
                finalstring.add('f');
                break;
              case 't':
                finalstring.add('g');
                break;
              case 's':
                finalstring.add('h');
                break;
              case 'r':
                finalstring.add('i');
                break;
              case 'q':
                finalstring.add('j');
                break;
              case 'p':
                finalstring.add('k');
                break;
              case 'o':
                finalstring.add('l');
                break;
              case 'n':
                finalstring.add('m');
                break;
              case 'm':
                finalstring.add('n');
                break;
              case 'l':
                finalstring.add('o');
                break;
              case 'k':
                finalstring.add('p');
                break;
              case 'j':
                finalstring.add('q');
                break;
              case 'i':
                finalstring.add('r');
                break;
              case 'h':
                finalstring.add('s');
                break;
              case 'g':
                finalstring.add('t');
                break;
              case 'f':
                finalstring.add('u');
                break;
              case 'e':
                finalstring.add('v');
                break;
              case 'd':
                finalstring.add('w');
                break;
              case 'c':
                finalstring.add('x');
                break;
              case 'b':
                finalstring.add('y');
                break;
              case 'a':
                finalstring.add('z');
                break;
              case 'Z':
                finalstring.add('A');
                break;
              case 'Y':
                finalstring.add('B');
                break;
              case 'X':
                finalstring.add('C');
                break;
              case 'W':
                finalstring.add('D');
                break;
              case 'V':
                finalstring.add('E');
                break;
              case 'U':
                finalstring.add('F');
                break;
              case 'T':
                finalstring.add('G');
                break;
              case 'S':
                finalstring.add('H');
                break;
              case 'R':
                finalstring.add('I');
                break;
              case 'Q':
                finalstring.add('J');
                break;
              case 'P':
                finalstring.add('K');
                break;
              case 'O':
                finalstring.add('L');
                break;
              case 'N':
                finalstring.add('M');
                break;
              case 'M':
                finalstring.add('N');
                break;
              case 'L':
                finalstring.add('O');
                break;
              case 'K':
                finalstring.add('P');
                break;
              case 'J':
                finalstring.add('Q');
                break;
              case 'I':
                finalstring.add('R');
                break;
              case 'H':
                finalstring.add('S');
                break;
              case 'G':
                finalstring.add('T');
                break;
              case 'F':
                finalstring.add('U');
                break;
              case 'E':
                finalstring.add('V');
                break;
              case 'D':
                finalstring.add('W');
                break;
              case 'C':
                finalstring.add('X');
                break;
              case 'B':
                finalstring.add('Y');
                break;
              case 'A':
                finalstring.add('Z');
                break;
              case '9':
                finalstring.add('0');
                break;
              case '8':
                finalstring.add('1');
                break;
              case '7':
                finalstring.add('2');
                break;
              case '6':
                finalstring.add('3');
                break;
              case '5':
                finalstring.add('4');
                break;
              case '4':
                finalstring.add('5');
                break;
              case '3':
                finalstring.add('6');
                break;
              case '2':
                finalstring.add('7');
                break;
              case '1':
                finalstring.add('8');
                break;
              case '0':
                finalstring.add('9');
                break;
              default:
                finalstring.add(instring[i]);
                break;
            }
          }

          result = finalstring.join();
          print(result);
          payIDtxt = result;

          //Decryption Ends here
          print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
          print(payIDtxt);

//String parsing start
          qrText = payIDtxt;
          print("QRTEXT: " + qrText);

          //String parsing end

          found = 1;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ValidationScreen(
                        textt: qrText,
                        val: v,
                        fullText: payIDtxt,
                      )));
        });
      }
    });
  }
}
