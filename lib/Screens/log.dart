import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intership01/widget/field.dart';

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  GlobalKey<FormState> key =GlobalKey();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController userIDController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when not needed to avoid memory leaks
    firstNameController.dispose();
    lastNameController.dispose();
    emailAddressController.dispose();
    userIDController.dispose();
    districtController.dispose();
    phoneNoController.dispose();
    pincodeController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            // Tablet layout
            return _buildTabletLayout();
          } else {
            // Mobile layout
            return _buildMobileLayout();
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Image.asset(
            'assets/Logo.png', // Replace 'your_image.png' with your actual image asset path
            width: 100, // Adjust width as needed
            height: 80, // Adjust height as needed
          ),
        ),
        leadingWidth: 150,
      ),
      body: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BASIC DETAILS',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Fields(
                      labelText: 'First Name',
                      controller: firstNameController,
                      keyboardType: TextInputType.text,
                    ),
                    Fields(
                      labelText: 'Last Name',
                      controller: lastNameController,
                      keyboardType: TextInputType.text,
                    ),
                    Fields(
                      labelText: 'Email Address',
                      controller: emailAddressController,
                      keyboardType: TextInputType.emailAddress,
                      validator: _isEmailValid,
                      // validator:
                    ),
                    Fields(
                      labelText: 'User ID',
                      controller: userIDController,
                      keyboardType: TextInputType.text,
                    ),
                    Fields(
                      labelText: 'District',
                      controller: districtController,
                      keyboardType: TextInputType.text,
                    ),
                    Fields(

                      labelText: 'Phone No',
                      controller: phoneNoController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
                    ),
                    Fields(
                      labelText: 'Pincode',
                      controller: pincodeController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    Fields(
                      labelText: 'Country',
                      controller: countryController,

                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
if(key.currentState!.validate()){
  ///onSubmit...
}
                              // if (!_isEmailValid(emailAddressController.text)) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text('Invalid email address'),
                              //     ),
                              //   );
                              // } else if (!_isPhoneNumberValid(phoneNoController.text)) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text('Invalid phone number'),
                              //     ),
                              //   );
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Background color
                            ),
                            child: Text(
                              "Save & Proceed",
                              style: TextStyle(color: Colors.white), // Text color
                            ),
                          ),

                          SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              firstNameController.clear();
                              lastNameController.clear();
                              emailAddressController.clear();
                              userIDController.clear();
                              districtController.clear();
                              phoneNoController.clear();
                              pincodeController.clear();
                              countryController.clear();
                            },
                            child: Text(
                              "Reset All",
                              style: TextStyle(color: Colors.black), // Text color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        Container(
          width: 200,
          color: Colors.blue,
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 80,
                child: Image.asset(
                  'assets/Logo.png', // Replace with your actual image path
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BASIC DETAILS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Fields(
                          labelText: 'First Name',
                          controller: firstNameController,
                          keyboardType: TextInputType.text,
                        )),
                        SizedBox(width: 8),
                        Expanded(
                            child: Fields(
                          labelText: 'Last Name',
                          controller: lastNameController,
                          keyboardType: TextInputType.text,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Fields(
                          labelText: 'Email Address',
                          controller: emailAddressController,
                          keyboardType: TextInputType.text,
                        )),
                        SizedBox(width: 8),
                        Expanded(
                            child: Fields(
                          labelText: 'User ID',
                          controller: userIDController,
                          keyboardType: TextInputType.text,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Fields(
                          labelText: 'District',
                          controller: districtController,
                          keyboardType: TextInputType.text,
                        )),
                        SizedBox(width: 8),
                        Expanded(
                            child: Fields(
                          labelText: 'Phone No',
                          controller: phoneNoController,inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
                          keyboardType: TextInputType.phone,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Fields(
                          labelText: 'Pincode',
                          controller: pincodeController,
                          keyboardType: TextInputType.phone,
                        )),
                        SizedBox(width: 8),
                        Expanded(
                            child: Fields(
                          labelText: 'Country',
                          controller: countryController,
                          keyboardType: TextInputType.text,
                        )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // if (!_isEmailValid(emailAddressController.text)) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text('Invalid email address'),
                              //     ),
                              //   );
                              // } else if (!_isPhoneNumberValid(phoneNoController.text)) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text('Invalid phone number'),
                              //     ),
                              //   );
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Background color
                            ),
                            child: Text(
                              "Save & Proceed",
                              style: TextStyle(color: Colors.white), // Text color
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              firstNameController.clear();
                              lastNameController.clear();
                              emailAddressController.clear();
                              userIDController.clear();
                              districtController.clear();
                              phoneNoController.clear();
                              pincodeController.clear();
                              countryController.clear();
                            },
                            child: Text(
                              "Reset All",
                              style: TextStyle(color: Colors.black), // Text color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String? _isEmailValid(String? email) {
  if(email!=null){
    String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email)?null:"Invalid";
  }
  else{
    return "Invalid";
  }

}

bool _isPhoneNumberValid(String phoneNumber) {
  return phoneNumber.trim().length == 10 &&
      int.tryParse(phoneNumber.trim()) != null;
}