import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cymplyfi/homePage/dashboard.dart';
import 'package:cymplyfi/homePage/TaskList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double screenHeight = 0;
  double screenwidth = 0;
  Color primary = const Color(0xffeef444c);

  int currentIndex = 1;

  List<IconData> navigationIcons = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.file,
    FontAwesomeIcons.tasks,
    FontAwesomeIcons.tableColumns,
    FontAwesomeIcons.user,
  ];
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [TaskList()],
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: const EdgeInsets.only(
          left: 0,
          right: 0,
          bottom: 2,
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(2, 2),
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < navigationIcons.length; i++) ...<Expanded>{
                Expanded(
                    child: GestureDetector(
                  onTap: (() {
                    setState(() {
                      currentIndex = i;
                    });
                  }),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(navigationIcons[i],
                          color: i == currentIndex ? primary : Colors.black54,
                          size: i == currentIndex ? 25 : 20),
                      i == currentIndex
                          ? Container(
                              margin: EdgeInsets.only(top: 6),
                              height: 3,
                              width: 22,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )
                          : const SizedBox()
                    ],
                  )),
                ))
              }
            ],
          ),
        ),
      ),
    );
  }
}
