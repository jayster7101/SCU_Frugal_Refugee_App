import 'package:flutter/material.dart';
import 'services/translateget.dart';
import 'services/languages.dart';

class Translate extends StatefulWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  List<Savedr> saved = [];
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
        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
      ),
      body: Center(
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
                    items:
                        langList.map<DropdownMenuItem<String>>((String value) {
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
                    items:
                        langList.map<DropdownMenuItem<String>>((String value) {
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
              onPressed: (){
                if (_controller.text != ""){
                  setState(() {
                    isLoading = true;
                  });
                  lang1 = langMap[firstDropdownValue]!;
                  lang2 = langMap[secondDropdownValue]!;
                  t.getTranslate(_controller.text, lang1, lang2).then((a){
                    query = a;
                    setState(() {
                      isLoading = false;
                    });
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
            ]
            else if (isLoading == false) ... [
              if (query.isNotEmpty)...[
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    query["data"]["translations"]["translatedText"],
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
              ]
            ]
          ],
        ),
      ),
    );
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
class saved_lan extends StatelessWidget {
  const saved_lan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex (
      direction: Axis.vertical,
      children: [
          Center(
      child: Column(
      children: [
        Row(
        children: [
          Text("data"),
          Text("data")
        ],
      )],
      ),
    )
    ]);

    
  }
}