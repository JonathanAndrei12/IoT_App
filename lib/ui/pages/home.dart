part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final databaseRef = FirebaseDatabase.instance.reference();
  int lembabRendah = 60;
  int lembabTinggi = 75;
  var lembab;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Automatic Plant Sprayer', 
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green[200],
        ),
        body: Container(
          child: Center(
            child: StreamBuilder(
              stream: databaseRef.onValue,
              builder: (context, snap){
                if(snap.hasError){
                  return Text(snap.error.toString());
                }
                if(snap.data.snapshot.value['now_moisture'] <= 75 && snap.data.snapshot.value['now_moisture'] >= 60){
                  DataSnapshot snapshot = snap.data.snapshot;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                      'Soil Moisture Percentage',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.value["now_moisture"].toString(),
                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 100)
                          ),
                          Text(
                            "%",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70)
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status : ', 
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black)
                          ),
                          Text(
                            'Normal', 
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green[400]),
                          )
                        ],
                      )
                    ],
                  );
                }else if(snap.data.snapshot.value['now_moisture'] < 60){
                  DataSnapshot snapshot = snap.data.snapshot;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                      'Soil Moisture Percentage',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.value["now_moisture"].toString(),
                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 100)
                          ),
                          Text(
                            "%",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70)
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status : ', 
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black)
                          ),
                          Text(
                            'Too Dry!', 
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red[300]),
                          )
                        ],
                      )
                    ],
                  );
                }else if(snap.data.snapshot.value['now_moisture'] > 75){
                  DataSnapshot snapshot = snap.data.snapshot;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                      'Soil Moisture Percentage',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.value["now_moisture"].toString(),
                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 100)
                          ),
                          Text(
                            "%",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70)
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status : ', 
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black)
                          ),
                          Text(
                            'Too Wet!', 
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[300]),
                          )
                        ],
                      )
                    ],
                  );
                }else{
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}