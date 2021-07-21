import 'package:dukka_challenge/model/database.dart';
import 'package:dukka_challenge/model/employee_data.dart';
import 'package:dukka_challenge/user_interface/component/app_button.dart';
import 'package:dukka_challenge/user_interface/component/input_field.dart';
import 'package:dukka_challenge/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  late String fullName, phoneNumber, email, position, salary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Icon(
                    CupertinoIcons.bars,
                    size: 50,
                  ),
                ),
                Container(
                  height: double.infinity,
                  margin: EdgeInsets.only(bottom: 20),
                  width: 1,
                  color: Colors.black,
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(right: 10),
                        child: FittedBox(
                          child: Text(
                            'SAMASYS',
                            style: TextStyle(
                                color: Colors.black, letterSpacing: 20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Text(
                          'combat salary fraud',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CREATE EMPLOYEE PROFILE ',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                AppInputField(
                  validator: (str) => Validator.isName(str!),
                  onSaved: (string) => fullName = string!.trim(),
                  label: 'Full Name *',
                ),
                AppInputField(
                  validator: (str) => Validator.isPhoneNumber(str!),
                  onSaved: (string) => phoneNumber = string!.trim(),
                  label: 'Phone Number *',
                  keyboardType: TextInputType.number,
                ),
                AppInputField(
                  validator: (str) => Validator.isEmail(str!),
                  onSaved: (string) => email = string!.trim(),
                  label: 'Email *',
                ),
                AppInputField(
                  validator: (str) => Validator.isNotEmpty(str!),
                  onSaved: (string) => position = string!.trim(),
                  label: 'Position *',
                ),
                AppInputField(
                  validator: (str) => Validator.isSalary(str!),
                  onSaved: (string) => salary = string!.trim(),
                  keyboardType: TextInputType.number,
                  label: 'Salary *',
                ),
                SizedBox(
                  height: 20,
                ),
                AppButton(
                  () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      var employee = EmployeeData(null,
                          fullName: fullName,
                          position: position,
                          phoneNumber: phoneNumber,
                          email: email,
                          salary: salary);
                      formKey.currentState!.reset();

                      await DBProvider.db.newEmployee(employee).then((value) {
                        Navigator.pushNamed(context, '/employeeList');
                      });
                    }
                  },
                  label: 'Save',
                  bgColor: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
