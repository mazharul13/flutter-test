import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:camera/camera.dart';
// import 'package:permissions/camera_screen.dart';
// import 'package:permissions/camera_screen.dart';

import 'phonelogs_screen.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// class SqliteService {
//   Future<Database> initializeDB() async {
//     String path = await getDatabasesPath();
//
//     return openDatabase(
//       join(path, 'database.db'),
//       onCreate: (database, version) async {
//         await database.execute(
//             "CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT NOT NULL)",
//         );
//       },
//       version: 1,
//     );
//   }
// }

// List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var db = await openDatabase('my_db.db');

// Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'demo.db');

// Delete the database
//   await deleteDatabase(path);

// open the database
// open the database
// open the database
// open the database
// open the database
// open the database
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
      });

// Insert some records in a transaction
//   await database.transaction((txn) async {
//     int id1 = await txn.rawInsert(
//         'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
//     print('inserted1: $id1');
//     int id2 = await txn.rawInsert(
//         'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
//         ['another name', 12345678, 3.1416]);
//     print('inserted2: $id2');
//   });

// Update some record
//   int count = await database.rawUpdate(
//       'UPDATE Test SET name = ?, value = ? WHERE name = ?',
//       ['updated name', '9876', 'some name']);
//   print('updated: $count');

// Get the records
  List<Map> list = await database.rawQuery('SELECT * FROM Test where value = 1234');
  List<Map> expectedList = [
    {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
    {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
  ];
  print(list);
  print(expectedList);


  // cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {




    return OKToast(
      child: MaterialApp(
        title: 'Flutter Permissions',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.deepPurple,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:PhonelogsScreen(), // MyHomePage(title: 'Flutter Permissions'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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

  // openCamera(){
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => CameraScreen(camera: cameras.first,),
  //     ),
  //   );
  // }

  openPhonelogs(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhonelogsScreen(),
      ),
    );
  }

  // checkallpermission_opencamera() async{
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.camera,
  //     Permission.microphone,
  //   ].request();
  //
  //   if(statuses[Permission.camera].isGranted){
  //     if(statuses[Permission.microphone].isGranted){
  //       openCamera();
  //     }else{
  //       showToast("Camera needs to access your microphone, please provide permission", position: ToastPosition.bottom);
  //     }
  //   }else{
  //     showToast("Provide Camera permission to use camera.", position: ToastPosition.bottom);
  //   }
  // }
  // checkpermission_opencamera() async{
  //   var cameraStatus = await Permission.camera.status;
  //   var microphoneStatus = await Permission.microphone.status;
  //
  //   print(cameraStatus);
  //   print(microphoneStatus);
  //   //cameraStatus.isGranted == has access to application
  //   //cameraStatus.isDenied == does not have access to application, you can request again for the permission.
  //   //cameraStatus.isPermanentlyDenied == does not have access to application, you cannot request again for the permission.
  //   //cameraStatus.isRestricted == because of security/parental control you cannot use this permission.
  //   //cameraStatus.isUndetermined == permission has not asked before.
  //
  //   if (!cameraStatus.isGranted)
  //     await Permission.camera.request();
  //
  //   if (!microphoneStatus.isGranted)
  //     await Permission.microphone.request();
  //
  //   if(await Permission.camera.isGranted){
  //     if(await Permission.microphone.isGranted){
  //       openCamera();
  //     }else{
  //       showToast("Camera needs to access your microphone, please provide permission", position: ToastPosition.bottom);
  //     }
  //   }else{
  //     showToast("Provide Camera permission to use camera.", position: ToastPosition.bottom);
  //   }
  // }

  checkpermission_phone_logs(BuildContext context) async{
    if(await Permission.phone.request().isGranted){
      openPhonelogs(context);
    }else {
      showToast("Provide Phone permission to make a call and view logs.", position: ToastPosition.bottom);
    }
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
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Container(
              //   child: IconButton(onPressed: checkpermission_opencamera, icon: Icon(Icons.camera), iconSize: 42,
              //     color: Colors.white,), color: Colors.amber, width: MediaQuery.of(context).size.width, height: (MediaQuery.of(context).size.height - 80) / 2,
              // ),
              Container(
                child: IconButton(onPressed: checkpermission_phone_logs(context), icon: Icon(Icons.phone), iconSize: 42,
                    color: Colors.white), color: Colors.deepPurple, width: MediaQuery.of(context).size.width, height: (MediaQuery.of(context).size.height - 80) / 2,),

            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
