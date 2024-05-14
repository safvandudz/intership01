import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Fields extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator; // Validation function

  const Fields({
    Key? key,
    required this.labelText,
    required this.controller,
     this.keyboardType =TextInputType.text,
    this.inputFormatters,
    this.validator, // Validation function parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 35,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 5,top: 10),
              child: Center(
                child: TextFormField(
                  keyboardType: keyboardType,
                  controller: controller,
                  inputFormatters: inputFormatters,
                  validator: validator, // Assigning the validator function
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
