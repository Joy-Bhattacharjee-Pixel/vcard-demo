import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';
import 'package:vcard_maintained/vcard_maintained.dart';
import 'package:vcard_qr_project/presentations/generate.vcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        fontFamily: "Lexend",
        appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white, foregroundColor: Colors.white),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const GenerateVCard(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class VCardGenerator extends StatefulWidget {
  const VCardGenerator({super.key});

  @override
  State<VCardGenerator> createState() => _VCardGeneratorState();
}

class _VCardGeneratorState extends State<VCardGenerator> {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController middlenamecontroller = TextEditingController();
  TextEditingController organizationcontroller = TextEditingController();
  TextEditingController workphonecontroller = TextEditingController();
  TextEditingController birthdaycontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController urlcontroller = TextEditingController();
  TextEditingController notecontroller = TextEditingController();

  VCard vcard = VCard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("V-Card Generator")),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                vcard.firstName = 'Joy';
                vcard.middleName = '';
                vcard.lastName = 'Bhattacherjee';
                vcard.organization = 'Pixel Consultancy';
                vcard.photo.attachFromUrl('/path/to/image/file.png', 'PNG');
                vcard.workPhone = '+918582987950';
                vcard.birthday = DateTime(1996, 11, 16);
                vcard.jobTitle = 'Software Developer';
                vcard.url = 'https://github.com/valerycolong';
                vcard.note = 'Notes on contact';

                final formattedstring = vcard.getFormattedString();

                final directory = await getApplicationDocumentsDirectory();
                final path = "${directory.path}/vcard.vcf";

                // vcard.saveToFile("vcard.vcf");

                File file = await _createFile(formattedstring);

                print(vcard.getFormattedString());

                // QrPainter data = QrPainter(
                //     data: vcard.getFormattedString(), version: QrVersions.auto);

                // ByteData? data1 = await data.toImageData(100);

                // final buffer = data1?.buffer;

                // var filePath = '$path/file_01.vcf';

                // File(filePath).deleteSync();

                // await File(filePath).writeAsBytes(buffer!
                //     .asUint8List(data1!.offsetInBytes, data1.lengthInBytes));

                await Share.shareFiles([file.path]);
              },
              child: const Text("VCard Generate")),
        ));
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/contact.vcf');
  }

  Future<File> _createFile(String data) async {
    final file = await _localFile;
    return await file.writeAsString(data);
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key, required this.hint, required this.controller});

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true, hintText: hint, border: border, enabledBorder: border),
    );
  }

  OutlineInputBorder get border =>
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.black12));
}

// ///Create a new vCard
// var vCard = VCard();

// ///Set properties
// vCard.firstName = 'FirstName';
// vCard.middleName = 'MiddleName';
// vCard.lastName = 'LastName';
// vCard.organization = 'ActivSpaces Labs';
// vCard.photo.attachFromUrl('/path/to/image/file.png', 'PNG');
// vCard.workPhone = 'Work Phone Number';
// vCard.birthday = DateTime.now();
// vCard.title = 'Software Developer';
// vCard.url = 'https://github.com/valerycolong';
// vCard.note = 'Notes on contact';

// /// Save to file
// vCard.saveToFile('./contact.vcf');

// /// Get as formatted string
// print(vCard.getFormattedString());
