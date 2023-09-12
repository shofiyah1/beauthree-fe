import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pollearn/pages/addclass.dart';
import 'package:pollearn/pages/dashboard.dart';
import 'package:pollearn/pages/detailClass.dart';
import 'package:pollearn/pages/task.dart';
import 'package:pollearn/pages/dashboard.dart';
import 'package:http/http.dart' as http;

class Kelas extends StatefulWidget {
  const Kelas({Key? key}) : super(key: key);

  @override
  State<Kelas> createState() => _KelasState();
}

class _KelasState extends State<Kelas> {
  List<Map<String, dynamic>> courses = [];

  @override
  void initState() {
    super.initState();
    fetchKelas();
  }

  Future<void> fetchKelas() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/kelas/'));

    if (response.statusCode == 200) {
      setState(() {
        courses = (jsonDecode(response.body) as List<dynamic>)
            .map((dynamic item) => {
                  'jenis_kelas': item['jenis_kelas'],
                  'nama_kelas': item['nama_kelas'],
                })
            .toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

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
                'Kelas',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: "Poppins Regular",
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              ListView.builder(
                itemCount: courses.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 0),
                              blurRadius: 5)
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailKelas()));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailKelas()));
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
                                        courses[index]['nama_kelas'],
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                          courses[index]['jenis_kelas'],
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontFamily: "Poppins Regular",
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () => Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return const Kelas();
                                            })),
                                            child: Container(
                                              height: 30,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.blueAccent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Lihat",
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 11,
                                                    fontFamily:
                                                        "Poppins Medium",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
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
        initialActiveIndex: 1,
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
