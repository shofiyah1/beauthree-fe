import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pollearn/pages/class.dart';
import 'package:pollearn/pages/dashboard.dart';
import 'package:pollearn/pages/task.dart';

import 'package:http/http.dart' as http;

class AddClassPage extends StatefulWidget {
  const AddClassPage({Key? key}) : super(key: key);

  @override
  State<AddClassPage> createState() => _AddClassPageState();
}

class _AddClassPageState extends State<AddClassPage> {
  final _formKey = GlobalKey<FormState>();
  String jenis_kelas = 'Praktikum';
  String nama_kelas = '';
  String kode_kelas = '';
  String tahun_ajar = '';

  void _insertClass() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/kelas/');
    final response = await http.post(url, body: {
      'jenis_kelas': jenis_kelas,
      'nama_kelas': nama_kelas,
      'kode_kelas': kode_kelas,
      'tahun_ajar': tahun_ajar,
    });

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Class added successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add class')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        initialActiveIndex: 0,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.topCenter,
              ),
            ),
            width: double.infinity,
            // height: 348,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Hi, User",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                fontFamily: "Poppins Bold",
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 0,
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                "Let's start learning!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Poppins Regular",
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Image.asset("assets/add.png"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(height: 50),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 62,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButtonFormField(
                        value: jenis_kelas,
                        decoration: InputDecoration(
                          labelText: 'Pilih Jenis Kelas',
                          border: InputBorder.none,
                        ),
                        items: <String>['Praktikum', 'Teori']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Poppins Regular",
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            jenis_kelas = value.toString();
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 62,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins Regular",
                        ),
                        decoration: InputDecoration(
                          labelText: 'Nama Mata Kuliah',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter class name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            nama_kelas = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 62,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins Regular",
                        ),
                        decoration: InputDecoration(
                          labelText: 'Kode Kelas',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter code class';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            kode_kelas = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 62,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins Regular",
                        ),
                        decoration: InputDecoration(
                          labelText: 'Tahun Ajar',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter school year';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            tahun_ajar = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _insertClass();
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          'Tambah Kelas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "Poppins Medium",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
