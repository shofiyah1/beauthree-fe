import 'package:flutter/material.dart';
import 'package:pollearn/pages/addclass.dart';
import 'package:pollearn/pages/detailClass.dart';
import 'package:pollearn/pages/home_page.dart';
import 'package:pollearn/pages/class.dart';
import 'package:pollearn/pages/task.dart';
import 'package:pollearn/pages/dashboard.dart';

class StartedPage extends StatefulWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  State<StartedPage> createState() => _StartedPage();
}

class _StartedPage extends State<StartedPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: const Text('Pollearn_UI')),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Container(
            height: size.height / 3,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Image.asset("assets/start.png"),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Create Your Own Plan Study",
                    style: TextStyle(
                      color: Color(0xFF263238),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: "Poppins Bold",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 50,
                      left: 50,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Study according to the study plan, make study more motivated",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "Poppins Regular",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DashboardPage();
                    })),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16,
                            fontFamily: "Poppins Medium",
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ],
      )),
    );
  }
}
