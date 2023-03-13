import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pollearn/pages/home_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pollearn/pages/addclass.dart';
import 'package:pollearn/pages/class.dart';
import 'package:pollearn/pages/dashboard.dart';

class Tugas extends StatefulWidget {
  const Tugas({Key? key}) : super(key: key);

  @override
  State<Tugas> createState() => _TugasState();
}

class _TugasState extends State<Tugas> {
  List courses = [
    'Design Tools Bundle',
    'Web Development Bundle',
  ];

  String tugas =
      "Tugas"; // Tambah variabel tugas dengan nilai default "Praktikum"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        // title: Text('Home', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                backgroundImage: Image.network(
                        'https://qph.cf2.quoracdn.net/main-qimg-c94eaf0949908232ebbbfa12738a09f9-lq')
                    .image,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$tugas', // Gunakan variabel tugas untuk mengganti tulisan
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: "Poppins Medium",
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                margin: EdgeInsets.fromLTRB(
                    0, 1, 1, 20), // nilai margin bagian bawah diubah menjadi 20
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Belum dikerjakan'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Sudah dikerjakan'),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: courses.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 120,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 0),
                              blurRadius: 2)
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TambahKelas()));
                          },
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: Image.network(
                                          'https://assets.pikiran-rakyat.com/crop/0x0:1080x908/x/photo/2023/02/07/2709288676.jpg')
                                      .image,
                                ),
                                title: Text(
                                  courses[index],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('Tugas Proyek 4'),
                                trailing: Text(
                                  '100%',
                                  style: TextStyle(
                                      fontFamily: "Poppins Medium",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 20),
                              LinearPercentIndicator(
                                  lineHeight: 5,
                                  percent: 1.0,
                                  backgroundColor: Colors.grey[300],
                                  progressColor: Colors.blueAccent),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        style: TabStyle.reactCircle,
        color: Colors.blueGrey,
        activeColor: Colors.blue,
        items: [
          TabItem(icon: Icons.add, title: 'Add Class'),
          TabItem(icon: Icons.class_, title: 'Class'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.task, title: 'Task'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 3,
        onTap: (int i) {
          switch (i) {
            case 0:
              // Handle Add Class tap
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddClassPage()));
              break;
            case 1:
              // Navigate to Class page
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Kelas()));
              break;
            case 2:
              // Handle Home tap
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardPage()));
              break;
            case 3:
              // Handle Task tap
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Tugas()));
              break;
            case 4:
              // Handle Profile tap
              break;
          }
        },
      ),
    );
  }
}
