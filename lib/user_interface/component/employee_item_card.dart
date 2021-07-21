import 'package:dukka_challenge/model/employee_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeItemCard extends StatefulWidget {
  final Function delete;
  final Function edit;
  final EmployeeData employeeData;

  EmployeeItemCard(
      {required this.delete, required this.edit, required this.employeeData});

  @override
  _EmployeeItemCardState createState() => _EmployeeItemCardState();
}

class _EmployeeItemCardState extends State<EmployeeItemCard> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        setState(() {
          hovering = true;
        });
      },
      onTap: () {
        if (hovering) {
          setState(() {
            hovering = false;
          });
        } else {
          Navigator.pushNamed(context, '/employeeDetails',
              arguments: widget.employeeData);
        }
      },
      child: Stack(
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
                            widget.employeeData.fullName,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(widget.employeeData.position),
                          Text(widget.employeeData.phoneNumber),
                          Text(widget.employeeData.salary),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Visibility(
              visible: hovering,
              child: Positioned(
                  bottom: 10,
                  right: 0,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          widget.edit();
                        },
                        child: Container(
                            color: Color(0xFFA0A0A0),
                            padding: EdgeInsets.all(2),
                            child: Icon(Icons.edit)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          widget.delete();
                        },
                        child: Container(
                            color: Color(0xFFA0A0A0),
                            padding: EdgeInsets.all(2),
                            child: Icon(CupertinoIcons.delete)),
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}
