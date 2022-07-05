import 'package:flutter/material.dart';

import 'mockData.dart';

void main() {
  runApp(MyApp());
}

class bottomBar extends StatefulWidget {
  const bottomBar({Key? key}) : super(key: key);

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const _MainScreen(),
    const Fart(),
    const Random(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedLabelStyle:  const TextStyle(color: Colors.white),
        selectedLabelStyle: const TextStyle(color: Colors.red),
        items: const [
          BottomNavigationBarItem(
              icon: Icon( Icons.home, color: Colors.white,),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white,),
            label: "Person",
          ),
        ],
        onTap: (index) {
          setState(() {
            print(index);
            selectedIndex = index;
            
          });
        },
      ),
      body: _widgetOptions.elementAt(selectedIndex),
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

void _onTappedItem(int index) {}

const List<Widget> _pages = <Widget>[
  Icon(
    Icons.call,
    size: 150,
  ),
  Icon(
    Icons.camera,
    size: 150,
  ),
  Icon(
    Icons.chat,
    size: 150,
  ),
];

class _MainScreen extends StatefulWidget {
  const _MainScreen({Key? key}) : super(key: key);

  @override
  State<_MainScreen> createState() => __MainScreenState();
}

class __MainScreenState extends State<_MainScreen> {
  // int _selectedIndex = 0;
  // List<Widget> _widgetOptions = <Widget>[
  //   Fart(),
  //   Random(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Welcome"),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
          )),
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
                      style: 
                      ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(60, 35, 60, 35),
                        primary: Colors.grey
                        ),  
                      onPressed: () {
                        print("Button 1 ");
                      },
                      child: const Icon(Icons.newspaper,color: Colors.black,size: 45,),
                    ),
                    ElevatedButton(
                      style:
                        ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(60, 35, 60, 35),
                          primary: Colors.grey
                        ),
                      onPressed: () {
                        print("Button 1 ");
                      },
                      child: const Icon(Icons.medical_services,color: Colors.black,size: 45,),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(60, 35, 60, 35),
                        primary: Colors.grey
                        ),  
                      onPressed: () {
                        print("Button 1 ");
                      },
                      child: const Icon(Icons.shopping_bag,color: Colors.black,size: 45,),
                    ),
                    ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(60, 35, 60, 35),
                        primary: Colors.grey
                        ),  
                      onPressed: () {
                        print("Button 1 ");
                      },
                      child: const Icon(Icons.menu_book,color: Colors.black,size: 45,)
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style:
                        ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(60, 35, 60, 35),
                          primary: Colors.grey
                        ),
                      onPressed: () {
                        print("Button 1 ");
                      },
                      
                      child: const Icon(Icons.translate,color: Colors.black,size: 45,),
                    ),
                    ElevatedButton(
                      style:
                        ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(60, 35, 60, 35),
                          primary: Colors.grey
                        ),  
                      onPressed: () {
                        print("Button 1 ");
                      },
                      child: const Icon(Icons.shopping_bag,color:Colors.black,size: 45,),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

class Random extends StatelessWidget {
  const Random({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Hello world"),
    );
  }
}

class Fart extends StatelessWidget {
  const Fart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Fart"),
    );
  }
}

// class MYAPP extends StatefulWidget {
//   const MYAPP({Key? key}) : super(key: key);

//   @override
//   State<MYAPP> createState() => _MYAPPState();
// }


// class _MYAPPState extends State<MYAPP> {
//   String word = "";
//   bool guess = true;
//   @override
//   Widget build(BuildContext context) {
//     return (MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//             centerTitle: true,
//             title: Text(
//               "My first app",
//               textAlign: TextAlign.center,
//             )
//             // actions: [
//             // IconButton(
//             //     onPressed: () {
//             //       if (guess) {
//             //         print("True");
//             //         guess = false;
//             //       } else if (!guess) {
//             //         print("False");
//             //         guess = true;
//             //       }
//             //       setState(() {
//             //         word = "now you dont";
//             //         if (guess) word = "Now you see me";
//             //       });
//             //     },
//             //     icon: Icon(Icons.dangerous))
//             // ],
//             ),
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               Text("data"),
//               Text("data"),
//               ElevatedButton(
//                   onPressed: () {},
//                   child: Text("press me"),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.red,
//                   ))
//             ],
//           ),
//         ),
//         body: Container(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                       child: Text(
//                     'one',
//                     textAlign: TextAlign.center,
//                   )),
//                   Expanded(
//                       child: Text(
//                     "two",
//                     textAlign: TextAlign.center,
//                   )),
//                   Expanded(
//                       child: Text(
//                     "three",
//                     textAlign: TextAlign.center,
//                   )),
//                 ],
//               ),
//               Text("${word}"),
//               Row(
//                 children: [
//                                     Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0)),
//                   Expanded(
//                       child: Text(
//                     "one",
//                     textAlign: TextAlign.center,
//                   )),
//                   Expanded(
//                       child: Text(
//                     "two",
//                     textAlign: TextAlign.center,
//                   )),
//                   Expanded(
//                       child: Text(
//                     "three",
//                     textAlign: TextAlign.center,
//                   )),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton.icon(
//                         onPressed: () {},
//                         icon: Icon(Icons.accessible_rounded),
//                         label: Text("Family")),
//                   ),
//                   ButtonBar(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.inbox),
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.inbox),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }


























// void main() {
//   runApp(MaterialApp(home: Home()));

//   // runApp(MaterialApp(
//   // home: Scaffold(
//   //   appBar: AppBar(
//   //     title: Text("Lets make cool shit!"),
//   //     centerTitle: true,
//   //   ),
//   //   body: Center(
//   //     child: Text("lets see"),
//   //   ),
//   //   floatingActionButton: FloatingActionButton(
//   //     child: Text("click"),
//   //   ),
//   // ),
//   // ));
// }

// class Home extends StatelessWidget {
//   //const test({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Random text"),
//         centerTitle: true,
//         backgroundColor: Colors.red[600],
//       ),
//       body: Row(
//         children: [],
//       ),

//       // Padding(
//       //   padding: EdgeInsets.symmetric(horizontal: auto, vertical: 25),
//       //   child: Text("Sex on the beach"),
//       // ),

//       // Container(
//       //   padding: EdgeInsets.all(15),
//       //   color: Colors.blueGrey,
//       //   child: Text("Random text",style: TextStyle(fontSize: 20)),
//       //
//       // ),

//       // If going to be used, make sure to uncomment all the way down to buttom of Center
//       // Center(
//       //   child: IconButton(
//       //     icon: Icon(
//       //       Icons.free_breakfast,
//       //       color: Colors.red,
//       //       size: 50,
//       //     ),
//       //     onPressed: (){},
//       //   ),
//       //
//       //
//       //   // child: ElevatedButton.icon(
//       //   //     onPressed: (){},
//       //   //     icon: Icon(
//       //   //       Icons.free_breakfast
//       //   //     ),
//       //   //     label: Text(
//       //   //       "Free food"
//       //   //     ),
//       //   //   style: ElevatedButton.styleFrom(
//       //   //     primary: Colors.blue
//       //   //   ),
//       //   // ),
//       //
//       //   // child:ElevatedButton(
//       //   //   onPressed: (){},
//       //   //   child: Text("Click me", style: TextStyle(color: Colors.black),),
//       //   //   style: ElevatedButton.styleFrom(
//       //   //     primary: Colors.orange[900]
//       //   //   ),
//       //   // )
//       //
//       //   // child:Icon(
//       //   //   Icons.local_drink_sharp,
//       //   //   color: Colors.deepPurple,
//       //   //   size: 50,
//       //   // )
//       //
//       //   //child: Image(
//       //   //   image: NetworkImage("https://i.imgflip.com/4c32o8.jpg"),
//       //   // )
//       // ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.red[600],
//         child: Text("click "),
//         onPressed: () {
//         },
//       ),
//     );
//   }
// }
