import 'dart:collection';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'services/translateget.dart';
import 'services/languages.dart';

List<Savedr> saved = [];

class Translate extends StatefulWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  bool isLoading = false;
  String lang1 = "en";
  String lang2 = "es";
  String firstDropdownValue = "English";
  String secondDropdownValue = "Spanish";
  Map query = {};
  late TextEditingController _controller;

  /// Function to initiate `TextEditiingController`
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  /// Function to remove controller after finished use
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TranslateGet t = TranslateGet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Translate"),
          centerTitle: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Input text",
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton(
                          value: firstDropdownValue,
                          items: langList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              firstDropdownValue = newValue!;
                            });
                          }),
                      const Text("to"),
                      DropdownButton(
                          value: secondDropdownValue,
                          items: langList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              secondDropdownValue = newValue!;
                            });
                          }),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_controller.text != "") {
                        setState(() {
                          isLoading = true;
                        });
                        lang1 = langMap[firstDropdownValue]!;
                        lang2 = langMap[secondDropdownValue]!;
                        t
                            .getTranslate(_controller.text, lang1, lang2)
                            .then((a) {
                          query = a;
                          setState(() {
                            isLoading = false;
                          });
                          saved.insert(
                              0,
                              Savedr(
                                  lang1,
                                  lang2,
                                  _controller.text,
                                  query["data"]["translations"]
                                      ["translatedText"]));
                          if (saved.length > 30) {
                            saved.length = 30;
                          }
                          /* showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: const Text("Translated Text"),
                            content: Text(query["data"]["translations"]["translatedText"]),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context), child: const Text("Ok")),
                            ],
                          )
                        ); */
                        });
                      }
                    },
                    child: const Text("Submit"),
                  ),
                  if (isLoading == true) ...[
                    const SizedBox(height: 20),
                    const CircularProgressIndicator(),
                  ] else if (isLoading == false) ...[
                    if (query.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          query["data"]["translations"]["translatedText"],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ]
                  ],
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    //scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: saved.length,
                    itemBuilder: ((context, index) {
                      return Column(children: [
                        ExpandablePanel(
                            theme: const ExpandableThemeData(
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                tapBodyToCollapse: true,
                                iconPadding: EdgeInsets.all(0)),
                            header: Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: RichText(
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: saved[index].lang1.toUpperCase() +
                                          ":", // Language From
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.visible),
                                    ),
                                    TextSpan(
                                      // pre translation
                                      text: saved[index].late1_text.substring(
                                          0,
                                          saved[index].late1_text.length < 10
                                              ? saved[index].late1_text.length
                                              : 10) + "...",
                                      style: TextStyle(
                                          // post language
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          color: Colors.black,
                                          overflow: TextOverflow.visible),
                                    ),
                                    TextSpan(
                                      // post translation
                                      text: "   " +
                                          saved[index].lang2.toUpperCase() +
                                          ":",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.visible),
                                    ),
                                    TextSpan(
                                      text: saved[index].late2_text.substring(
                                          0,
                                          saved[index].late1_text.length < 10
                                              ? saved[index].late1_text.length
                                              : 10) + "...",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          color: Colors.black,
                                          overflow: TextOverflow.visible),
                                    ),
                                  ]),
                                )),
                            collapsed: SizedBox.shrink(),
                            expanded:

                                ///Expanded text
                                RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: saved[index].lang1.toUpperCase() +
                                      ":", // Language From
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.visible),
                                ),
                                TextSpan(
                                  // pre translation
                                  text: saved[index].late1_text,
                                  style: TextStyle(
                                      // post language
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      overflow: TextOverflow.visible),
                                ),
                                TextSpan(
                                  // post translation
                                  text: "\n" +
                                      saved[index].lang2.toUpperCase() +
                                      ":",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.visible),
                                ),
                                TextSpan(
                                  text: saved[index].late2_text,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      overflow: TextOverflow.visible),
                                ),
                              ]),
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Expandable(
                                  collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
                                ),
                              );
                            }),
                      ]);
                    })),
              ),
            ),

            //Container(child: saved_lan())
          ],
        ));
  }
}

class Savedr {
  Savedr(String _lang1, String _lang2, String _late1_text, String _late2_text) {
    lang1 = _lang1;
    lang2 = _lang2;
    late1_text = _late1_text;
    late2_text = _late2_text;
  }
  late String lang1;
  late String lang2;
  late String late1_text;
  late String late2_text;
  List<String> format() {
    String pre;
    String post;
    List<String> l = [];

    if (lang1.isNotEmpty || lang2.isNotEmpty) {
      pre = "Language " + lang1 + ": " + late1_text;
      post = "Language " + lang2 + ": " + late2_text;
      l.add(pre);
      l.add(post);
    }
    return l;
  }
}

// class saved_lan extends StatelessWidget {
//   const saved_lan({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         shrinkWrap: true,
//           itemCount: saved.length,
//           itemBuilder: ((context, index) {
//             return Column(children: [
//               ExpandablePanel(
//                   theme: const ExpandableThemeData(
//                       headerAlignment: ExpandablePanelHeaderAlignment.center,
//                       tapBodyToCollapse: true,
//                       iconPadding: EdgeInsets.all(0)),
//                   header: Padding(
//                     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                     child: Text(
//                       // gets pre formatted text and then displays the first index of
//                       saved[index].format()[0],
//                       style: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontSize: 16,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           overflow: TextOverflow.visible),
//                     ),
//                   ),
//                   collapsed: SizedBox.shrink(),
//                   expanded: Text(
//                     "\u25cf After graduating from Ohlone College with an Associates degree in computer science I will continue my education by obtaining both a bachelors and masters degree in computer science/related fields. I aspire to attend Stanford or Berkeley as they are my dream schools.\n\u25cf Once graduted from my masters program, I will join a company and work full time. After a few years of experience I plan to switch to a more manegerial position in order to aquire a different set of skills.\n\u25cf Now with a background in programming and managment, I will venture off into my biggest aspiration of all, creating a business that truly contributes to the greater good of humainty",
//                     style: TextStyle(
//                         fontFamily: 'Montserrat',
//                         fontSize: 16,
//                         color: Colors.black,
//                         overflow: TextOverflow.visible),
//                   ),
//                   builder: (_, collapsed, expanded) {
//                     return Padding(
//                       padding: EdgeInsets.only(left: 10, right: 10, bottom: 0),
//                       child: Expandable(
//                         collapsed: collapsed,
//                         expanded: expanded,
//                         theme: const ExpandableThemeData(crossFadePoint: 0),
//                       ),
//                     );
//                   }),
//             ]);
//           })),
//     );
//   }
// }

//  ListView.builder(
//               scrollDirection: Axis.vertical,

//         shrinkWrap: true,
//           itemCount: saved.length,
//           itemBuilder: ((context, index) {
//             return Column(children: [
//               ExpandablePanel(
//                   theme: const ExpandableThemeData(
//                       headerAlignment: ExpandablePanelHeaderAlignment.center,
//                       tapBodyToCollapse: true,
//                       iconPadding: EdgeInsets.all(0)),
//                   header: Padding(
//                     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                     child: Text(
//                       // gets pre formatted text and then displays the first index of
//                       saved[index].format()[0].substring(4),
//                       style: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontSize: 16,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           overflow: TextOverflow.visible),
//                     ),
//                   ),
//                   collapsed: SizedBox.shrink(),
//                   expanded: Text(
//                     "\u25cf After graduating from Ohlone College with an Associates degree in computer science I will continue my education by obtaining both a bachelors and masters degree in computer science/related fields. I aspire to attend Stanford or Berkeley as they are my dream schools.\n\u25cf Once graduted from my masters program, I will join a company and work full time. After a few years of experience I plan to switch to a more manegerial position in order to aquire a different set of skills.\n\u25cf Now with a background in programming and managment, I will venture off into my biggest aspiration of all, creating a business that truly contributes to the greater good of humainty",
//                     style: TextStyle(
//                         fontFamily: 'Montserrat',
//                         fontSize: 16,
//                         color: Colors.black,
//                         overflow: TextOverflow.visible),
//                   ),
//                   builder: (_, collapsed, expanded) {
//                     return Padding(
//                       padding: EdgeInsets.only(left: 10, right: 10, bottom: 0),
//                       child: Expandable(
//                         collapsed: collapsed,
//                         expanded: expanded,
//                         theme: const ExpandableThemeData(crossFadePoint: 0),
//                       ),
//                     );
//                   }),
//             ]);
//           })),
