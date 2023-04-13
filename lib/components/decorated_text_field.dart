// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:weather_app_assignment/extensions/padding_extension.dart';

class DecoratedTextField extends StatefulWidget {
  const DecoratedTextField({
    Key? key,
    required this.textFieldController,
    required this.hintField,
    required this.isObsecured,
    this.validator,
  }) : super(key: key);

  final TextEditingController textFieldController;

  final String hintField;
  final bool isObsecured;
  final String? Function(String?)? validator;

  @override
  State<DecoratedTextField> createState() => _DecoratedTextFieldState();
}

class _DecoratedTextFieldState extends State<DecoratedTextField> {
  bool checkIfClicked = false;
  @override
  Widget build(BuildContext context) => Padding(
        padding: context.paddingExtraLowSymmetric,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.hintField),
            const SizedBox(height: 5),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.validator,
              textInputAction: TextInputAction.next,
              controller: widget.textFieldController,
              obscureText: widget.isObsecured && checkIfClicked == false,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                suffixIcon: widget.isObsecured == true
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            checkIfClicked = !checkIfClicked;
                          });
                        },
                        icon: checkIfClicked == true
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off))
                    : null,
              ),
            ),
          ],
        ),
      );
}
