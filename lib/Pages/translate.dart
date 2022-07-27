import 'package:flutter/material.dart';
import 'services/translateget.dart';
import 'services/languages.dart';

class Translate extends StatefulWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
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
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _controller,
                onFieldSubmitted: (String value){
                  if (_controller.text != ""){
                    lang1 = langMap[firstDropdownValue]!;
                    lang2 = langMap[secondDropdownValue]!;
                    t.getTranslate(_controller.text, lang1, lang2).then((a){
                      query = a;
                      showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                          title: const Text("Translated Text"),
                          content: Text(query["data"]["translations"]["translatedText"]),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Ok")),
                          ],
                        )
                      );
                    });
                  }
                },
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
                  items: langList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(value: value, child: Text(value),);
                  }).toList(), 
                  onChanged: (String? newValue) {
                    setState(() {
                      firstDropdownValue = newValue!;
                    });
                  }
                ),
                const Text("to"),
                DropdownButton(
                  value: secondDropdownValue,
                  items: langList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(value: value, child: Text(value),);
                  }).toList(), 
                  onChanged: (String? newValue) {
                    setState(() {
                      secondDropdownValue = newValue!;
                    });
                  }
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (){
                if (_controller.text != ""){
                  lang1 = langMap[firstDropdownValue]!;
                  lang2 = langMap[secondDropdownValue]!;
                  bool _isLoading = true;
                  t.getTranslate(_controller.text, lang1, lang2).then((a){
                    query = a;
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
          ],
        ),
      ),
    );
  }
}