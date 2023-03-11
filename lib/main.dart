import 'package:flutter/material.dart';
import 'package:untitled/home_page.dart';

//
// void main() {
//   runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Exploring UI Widgets",
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Basic List View"),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){
//             debugPrint("clicked");
//           },
//           backgroundColor: Colors.indigo,
//           tooltip: "add one more item",
//           child: const Icon(Icons.add),
//           ,
//         ),
// body: Column(
//   children: [
//     Container(
//       constraints: const BoxConstraints.expand(),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.bottomLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Colors.blue,
//               CupertinoColors.secondarySystemBackground
//             ]),
//       ),
//       transform: Matrix4.rotationZ(0.6),
//     ),
//     Container(
//       child: getListView(),
//     )
//   ],
// )
//       )
//   )
//   );
// }

// getListView() {
//   var listView = ListView(
//     children: [
//       ListTile(
//         leading: const Icon(Icons.image),
//         title: const Text("LANDSCAPE"),
//         subtitle: const Text("Beautiful view"),
//         trailing: const Icon(Icons.ice_skating_outlined),
//         onTap: () {
//           debugPrint("clicked");
//         },
//       ),
//       ListTile(
//         leading: const Icon(Icons.icecream_sharp),
//         title: const Text("ICE-CREAM"),
//         subtitle: const Text("Yup"),
//         trailing: const Icon(Icons.coffee),
//         onTap: () {
//           debugPrint("coffee");
//         },
//       ),
//       const ListTile(
//         leading: Icon(Icons.airplanemode_active),
//         title: Text("PLANE"),
//         subtitle: Text("Caught"),
//         trailing: Icon(Icons.access_alarm),
//       )
//     ],
//   );
//   return listView;
// }
// List <String> getListElement() {
//   var items = List<String>.generate(1000, (index) => "ITEM $index")
//   return items;
// }
//
// Widget getListView() {
//   var listItems = getListElement();
//   var listView = ListView.builder(itemBuilder: (context, index) {
//     return ListTile(leading: const Icon(Icons.contact_mail_sharp),
//       title: Text(listItems[index],),
//       onTap: () {
//         debugPrint("${listItems[index]} was clicked");
//       },);
//   });
// }
// }

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: "Simple Interest Calculator",
//     home: const SIForm(),
//     theme: ThemeData(
//         brightness: Brightness.dark, primaryColor: Colors.indigoAccent),
//   ));
// }
//
// class SIForm extends StatefulWidget {
//   const SIForm({Key? key}) : super(key: key);
//
//   @override
//   State<SIForm> createState() => _SIFormState();
// }
//
// class _SIFormState extends State<SIForm> {
//   var _currencies = ["Rupees", "Dollars", "Pounds"];
//   final _minimumPadding = 5.0;
//   var currentItemSelected = "Rupees";
//   TextEditingController principalController = TextEditingController();
//   TextEditingController roiController = TextEditingController();
//   TextEditingController termController = TextEditingController();
//   var displayResult = "";
//
//   void _onDropDownItemDSelected(String newValueSelected) {
//     setState(() {
//       currentItemSelected = newValueSelected;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo,
//         shadowColor: Colors.indigoAccent,
//         title: const Text("Simple Interest Calculator"),
//       ),
//       body: Container(
//           padding: const EdgeInsets.only(top: 50.0),
//           margin: const EdgeInsets.all(10.0),
//           constraints: const BoxConstraints.expand(),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 20.0),
//                   child: Image.asset(
//                     ("image/money-2724241__480.jpg"),
//                     height: 200.0,
//                     width: 200.0,
//                     fit: BoxFit.fill,
//                     alignment: Alignment.center,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       top: _minimumPadding, bottom: _minimumPadding),
//                   child: TextField(
//                       keyboardType: TextInputType.number,
//                       controller: principalController,
//                       style: textStyle,
//                       decoration: InputDecoration(
//                           labelText: "Principal",
//                           labelStyle: textStyle,
//                           hintText: "Enter Principal e.g. 12000",
//                           focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.indigoAccent)),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5.0)))),
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(
//                         top: _minimumPadding, bottom: _minimumPadding),
//                     child: TextField(
//                       keyboardType: TextInputType.number,
//                       style: textStyle,
//                       controller: roiController,
//                       decoration: InputDecoration(
//                           focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.indigoAccent)),
//                           labelText: "Rate of interest",
//                           labelStyle: textStyle,
//                           hintText: "In percentage",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5.0))),
//                     )),
//                 Padding(
//                     padding: EdgeInsets.only(
//                       top: _minimumPadding,
//                       bottom: _minimumPadding,
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             keyboardType: TextInputType.number,
//                             controller: termController,
//                             style: textStyle,
//                             decoration: InputDecoration(
//                                 labelText: "Term",
//                                 labelStyle: textStyle,
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.indigoAccent),
//                                 ),
//                                 hintText: "Enter in years",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(5.0))),
//                           ),
//                         ),
//                         const SizedBox(width: 25),
//                         Expanded(
//                           child: DropdownButton<String>(
//                               items: _currencies.map((String value) {
//                                 return DropdownMenuItem(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               value: currentItemSelected,
//                               style: textStyle,
//                               onChanged: (String? newValueSelected) {
//                                 setState(() {
//                                   currentItemSelected = newValueSelected!;
//                                 });
//                               }),
//                         ),
//                       ],
//                     )),
//                 Padding(
//                     padding: (EdgeInsets.only(
//                         top: _minimumPadding, bottom: _minimumPadding)),
//                     child: Row(
//                       children: [
//                         Expanded(
//                             child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.indigo),
//                           child: Text(
//                             "Calculate",
//                             style: textStyle,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               this.displayResult = _calculateTotalReturns();
//                             });
//                           },
//                         )),
//                         const SizedBox(
//                           width: 25.0,
//                         ),
//                         Expanded(
//                             child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.indigo),
//                                 child: Text("Reset", style: textStyle),
//                                 onPressed: () {
//                                   setState(() {
//                                     _result();
//                                   });
//                                 }))
//                       ],
//                     )),
//                 Padding(
//                     padding: EdgeInsets.only(
//                       top: _minimumPadding,
//                       bottom: _minimumPadding,
//                     ),
//                     child: Text(
//                       this.displayResult,
//                       style: textStyle,
//                     ))
//               ],
//             ),
//           )),
//     );
//   }
//
//   String _calculateTotalReturns() {
//     double principal = double.parse(principalController.text);
//     double roi = double.parse(roiController.text);
//     double term = double.parse(termController.text);
//     double totalAmountPayable = principal + (principal * roi * term) / 100;
//     String result =
//         "After $term years , your investment will be worth $totalAmountPayable $currentItemSelected";
//     return result;
//   }
//
//   void _result() {
//     principalController.text = "";
//     roiController.text = "";
//     termController.text = "";
//     displayResult = "";
//     currentItemSelected = _currencies[0];
//   }
// }
void main() {
  runApp(const MaterialApp(
      title: "News App", debugShowCheckedModeBanner: false, home: HomePage()));
}
