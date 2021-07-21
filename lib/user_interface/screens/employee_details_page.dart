import 'package:dukka_challenge/model/employee_data.dart';
import 'package:dukka_challenge/user_interface/component/employee_item_card.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EmployeeData employeeData =
        ModalRoute.of(context)!.settings.arguments as EmployeeData;
    return Scaffold(
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
                  child: BackButton(
                    color: Colors.black,
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.3),
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Image.asset(
                          'assets/dummy_profile.jpeg',
                          fit: BoxFit.cover,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              employeeData.fullName,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(employeeData.position),
                            Text(employeeData.phoneNumber),
                            Text(employeeData.salary),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Text(
              'LOAN RECORD',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.3)),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.grey.withOpacity(0.3),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.calendar_today_rounded),
                                  Text('FEB')
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Container(
                                  child: Text('BORROWED: \u{20A6}50,000'),
                                )),
                                Divider(),
                                Expanded(
                                    child: Container(
                                  child: Text('RECEIVEABLE: \u{20A6}50,000'),
                                )),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
