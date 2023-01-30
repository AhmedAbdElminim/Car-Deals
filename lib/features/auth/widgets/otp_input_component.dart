import 'package:flutter/material.dart';

class OtpInput extends StatefulWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final bool lastInput;

  const OtpInput(this.controller, this.autoFocus, this.lastInput, {Key? key})
      : super(key: key);

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    widget.controller.dispose();
    super.dispose();
  }

  void _listenToController() {
    if (widget.controller.text.length == 1 && widget.lastInput) {
      FocusScope.of(context).nextFocus();
    }
    if (widget.controller.text.length == 1 && !widget.lastInput) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    widget.controller.addListener(_listenToController);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: widget.autoFocus,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.none,
        controller: widget.controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
      ),
    );
  }
}
