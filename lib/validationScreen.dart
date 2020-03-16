import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'mainScreen.dart';

GlobalKey qrKey = GlobalKey();
var resultText = "";
int canDisplayDetails = 0;
var refText = "";
int i = 0;
List dataData = [];
var readData = 0;
int cancheck = 0;
int canRead = 1;
int canValidate = 0;
List<String> stringTxt = [];
var result;
int value;

class ValidationScreen extends StatefulWidget {
  final String textt;
  final int val;
  final String fullText;
  ValidationScreen({Key key, @required this.textt, this.val, this.fullText})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<ValidationScreen> {
  int hasFetchedFromDatabase = 0;
  String compText = "";
  String qrText = "";
  String payIDtxt = "";
  var changeText = "cgange me!";
  Future userfuture;

  @override
  void initState() {
    super.initState();
    userfuture = _getId();
  }

  _getId() async {
    return await fetchData();
  }

//My function ends here
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    print("hasFetchedFromDatabase: ");
    print(hasFetchedFromDatabase);
    setValue();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //'QR SCANNER: ${widget.textt}',
          'QR SCANNER',
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black45,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/gif.gif"), fit: BoxFit.cover)),
        child: Center(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 80),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 4, right: 2),
                      child: Text(
                        (() {
                          if (canDisplayDetails == 1) {
                            var rT = "";
                            canDisplayDetails = 0;
                            int j = 0;
                            v = 0;
                            List<String> stringTxt = [];
                            while (v != widget.fullText.length) {
                              print(
                                  "Executing!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

                              stringTxt.add(widget.fullText[v]);

                              j++;
                              v++;
                            }

                            setState(() {
                              rT = stringTxt.join();
                              compText = rT.replaceAll(RegExp(','), '\n');

                              stringTxt = [];
                            });

                            return '$compText';
                          } else
                            return '';
                        })(),
                        style:
                            TextStyle(color: Colors.greenAccent, fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RaisedButton(
                      color: Colors.white30,
                      onPressed: () {
                        setTextFun();
                      },
                      child: Text(
                        'Go Back!',
                        style: TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //My function
  Future<String> fetchData() async {
    /* setState(() {
      resultText = "Calling!";
    });*/
    print(
        "calling###############################################################");
    http.Response response = await http.get('paste your link here');
    List fetchedItems = json.decode(response.body);
    print(fetchedItems[1]);

    print(
        "/////////////////////////////////////////////////////////////////////////////////////////////////");

    setState(() {
      dataData = fetchedItems;
    });
    print(
        "????????????????????????????????????????????????????????????????????????????????????????????????");
    print(dataData[1]);
    //validate();
    return fetchedItems[0];
  }

  void setQrText() {
    canRead = 1;
  }

  void setTextFun() {
    int k = 5;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  foundReset: k,
                )));
  }

  void setValue() {
    setState(() {
      qrText = widget.textt;
      value = widget.val;
      print(
          "qrText_________________________________________________________________");
      print(qrText);
    });
    canDisplayDetails = 1;
    //validate();
  }

  void validate() {
    print("validate called");
    int found = 0;
    int i = 0;
    while (i < dataData.length) {
      /* setState(() {
        resultText = "clicked";
      });*/
      print("dataData: " + dataData[i]);
      if (qrText == dataData[i]) {
        found = 1;
        break;
      }
      i++;
    }
    if (found == 1) {
      setState(() {
        resultText = "VERIFIED";
        canDisplayDetails = 1;
        found = 0;
      });
    } else if (cancheck == 1) {
      resultText = "COULDN'T VERIFY";
      found = 0;
    } else if (cancheck != 1) {
      resultText = "-WAITING-";
      found = 0;
    }
  }
}
