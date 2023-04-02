import 'package:flutter/material.dart';
import 'package:stra/stra.dart';

class Console extends StatefulWidget {
  const Console({super.key});

  @override
  State<Console> createState() => _ConsoleState();
}

class _ConsoleState extends State<Console> {
  static final _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void submit() {
    Stra.log("TextField.onSubmitted");
    Stra.log("TextField.value:$_textEditingController.text");
    if (_textEditingController.text.isNotEmpty) {
      setState(() {
        _textEditingController.clear();
        Stra.consoleLog += "\n$_textEditingController.text";
      });
    }
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(4),
      ),
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
    return Container(
      color: const Color.fromARGB(40, 0, 0, 0),
      padding: const EdgeInsets.only(
        top: 5,
        right: 5,
        bottom: 5,
        left: 5,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                reverse: true,
                padding: const EdgeInsets.all(10),
                child: Text(
                  Stra.consoleLog,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  focusNode: _focusNode,
                  onSubmitted: (value) => submit,
                  decoration: const InputDecoration(
                    hintText: "Command",
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true, //for padding
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                ),
                child: const Text("Submit"),
                onPressed: () => submit,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(4),
                    ),
                  ),
                ),
                child: const Text("Clear"),
                onPressed: () {
                  Stra.log("CONSOLE_CLEAR");
                  Stra.consoleLog = "";
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
