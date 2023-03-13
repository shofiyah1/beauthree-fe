import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pollearn/pages/class.dart';
import 'package:pollearn/pages/dashboard.dart';
import 'package:pollearn/pages/task.dart';

class AddClassPage extends StatefulWidget {
  const AddClassPage({Key? key}) : super(key: key);

  @override
  State<AddClassPage> createState() => _AddClassPageState();
}

class _AddClassPageState extends State<AddClassPage> {
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 62,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Pilih Jenis Kelas",
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: "Poppins Medium",
                        ),
                      ),
                      items: ["Praktikum", "Teori"].map((jenisKelas) {
                        return DropdownMenuItem<String>(
                          value: jenisKelas,
                          child: Text(
                            jenisKelas,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins Regular",
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins Regular",
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Nama Mata Kuliah",
                            labelStyle: TextStyle(
                              fontSize: 11,
                              fontFamily: "Poppins Medium",
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins Regular",
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            // hintText: "Pilih Jenis Kelas",
                            labelText: "Tingkat",
                            labelStyle: TextStyle(
                              fontSize: 11,
                              fontFamily: "Poppins Medium",
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins Regular",
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Kode Kelas",
                            labelStyle: TextStyle(
                              fontSize: 11,
                              fontFamily: "Poppins Medium",
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      // border: Border.all(
                      //   color: Colors.blueAccent,
                      //   width: 1,
                      // ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        "Tambah Kelas",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "Poppins Medium",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
