import 'package:dukka_challenge/model/database.dart';
import 'package:dukka_challenge/model/employee_data.dart';
import 'package:dukka_challenge/user_interface/component/employee_item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeesPage extends StatefulWidget {
  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  Future<List<EmployeeData>> getData = DBProvider.db.getEmployees();

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'EMPLOYEES',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: getData,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<EmployeeData>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        else
                          return ListView.builder(
                            itemBuilder: (context, index) => EmployeeItemCard(
                              employeeData: snapshot.data![index],
                              delete: () async {
                                await DBProvider.db
                                    .deleteContentById(snapshot.data![index].id)
                                    .then((value) {
                                  setState(() {
                                    getData = DBProvider.db.getEmployees();
                                  });
                                });
                              },
                              edit: () {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                        'Feature Not Available At The Moment')));
                              },
                            ),
                            itemCount: snapshot.data!.length,
                          );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
