import 'package:flutter/material.dart';
import 'package:starter/Pages/information.dart';
import 'package:starter/Pages/translate.dart';
import 'Pages/items.dart';
import 'Pages/health.dart';
import 'Pages/news.dart';
import 'Pages/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class bottomBar extends StatefulWidget {
  const bottomBar({Key? key}) : super(key: key);

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  int selected_Index = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const _MainScreen(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            selected_Index = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(selected_Index),
    );
  }
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: bottomBar());
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen({Key? key}) : super(key: key);

  @override
  State<_MainScreen> createState() => __MainScreenState();
}

class __MainScreenState extends State<_MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Welcome"),
          centerTitle: true,
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(60, 35, 60, 35),
                          primary: Colors.grey),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => const News(),
                          )
                        );
                       // Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.newspaper,
                        color: Colors.black,
                        size: 45,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(60, 35, 60, 35),
                          primary: Colors.grey),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Health()));
                      },
                      child: const Icon(
                        Icons.medical_services,
                        color: Colors.black,
                        size: 45,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(60, 35, 60, 35),
                          primary: Colors.grey),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const Items();
                        }));
                      },
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.black,
                        size: 45,
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(60, 35, 60, 35),
                            primary: Colors.grey),
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context){
                              return const Information();
                            })
                          );
                        },
                        child: const Icon(
                          Icons.menu_book,
                          color: Colors.black,
                          size: 45,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(60, 35, 60, 35),
                          primary: Colors.grey),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const Translate();
                        }));
                      },
                      child: const Icon(
                        Icons.translate,
                        color: Colors.black,
                        size: 45,
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}