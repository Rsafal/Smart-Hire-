// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:student_store/Screens/ProductCatalog.dart';

// class CreateProfilePage extends StatefulWidget {
//   const CreateProfilePage({required Key key}) : super(key: key);

//   @override
//   _CreateProfilePageState createState() => _CreateProfilePageState();
// }

// class _CreateProfilePageState extends State<CreateProfilePage> {
//   final GlobalKey<FormState> createProfileKey = new GlobalKey<FormState>();

//   var name;
//   var address;
//   var state;
//   var phoneNumber;

//   static List<String> states = [
//     'Karnataka',
//     'Tamil Nadu',
//     'Kerala',
//     'Jammu & Kashmir',
//     'Goa',
//     'Rajasthan',
//     'Madhya Pradesh',
//     'Bihar'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff79201B),
//       appBar: AppBar(
//         title: Text(
//           'Create Profile',
//           style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: Color(0xffD7A74F)),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.95,
//             height: MediaQuery.of(context).size.height * 0.9,
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(20)),
//             child: Form(
//               key: createProfileKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 30, left: 20),
//                     child: Text('Full Name', style: TextStyle(fontSize: 20)),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 3, color: Color(0xff79201B))),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 3, color: Color(0xff79201B))),
//                           hintText: "Bob",
//                           errorStyle: TextStyle(fontSize: 20)

//                           //labelText: "FullName"
//                           ),
//                       validator: (name) {
//                         if (name.isEmpty) {
//                           return 'Full Name is Mandatory';
//                         }
//                         return null;
//                       },
//                       onSaved: (name) {
//                         this.name = name;
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10, left: 20),
//                     child: Text('Phone Number', style: TextStyle(fontSize: 20)),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                     child: TextFormField(
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 3, color: Color(0xff79201B))),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 3, color: Color(0xff79201B))),
//                           hintText: "1234567890",
//                           errorStyle: TextStyle(fontSize: 20)

//                           //labelText: "FullName"
//                           ),
//                       validator: (phno) {
//                         if (phno.isEmpty) {
//                           return 'Phone Number is Mandatory';
//                         }
//                         if (phno.length != 10) {
//                           return 'Invalid Phone Number';
//                         }
//                         return null;
//                       },
//                       onSaved: (phno) {
//                         this.phoneNumber = phno;
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10, left: 20),
//                     child: Text('Address', style: TextStyle(fontSize: 20)),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                     child: TextFormField(
//                       keyboardType: TextInputType.text,
//                       maxLines: 4,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 3, color: Color(0xff79201B))),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 3, color: Color(0xff79201B))),
//                           hintText: "House No. Street No, City",
//                           errorStyle: TextStyle(fontSize: 20)

//                           //labelText: "FullName"
//                           ),
//                       validator: (address) {
//                         if (address.isEmpty) {
//                           return 'Address is Mandatory';
//                         }

//                         return null;
//                       },
//                       onSaved: (address) {
//                         this.address = address;
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10, left: 20),
//                     child: Text('State', style: TextStyle(fontSize: 20)),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 5, vertical: 5),
//                       child: Autocomplete<String>(
//                         optionsBuilder: (TextEditingValue textEditingValue) {
//                           if (textEditingValue.text == '') {
//                             return const Iterable<String>.empty();
//                           }
//                           return states.where((String option) {
//                             return option.toLowerCase().startsWith(
//                                 textEditingValue.text.toLowerCase());
//                           });
//                         },
//                         onSelected: (String state) {
//                           debugPrint('You just selected $state');
//                           this.state = state;
//                         },
//                       )),
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 40),
//                       child: ElevatedButton(
//                           style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.all(Color(0xffD7A74F)),
//                               padding: MaterialStateProperty.all(
//                                   EdgeInsets.symmetric(
//                                       vertical: 15, horizontal: 30)),
//                               shape: MaterialStateProperty.all(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(40))),
//                               side: MaterialStateProperty.all(
//                                   BorderSide(width: 2, color: Colors.white))),
//                           onPressed: () async {
//                             createProfileKey.currentState.save();
//                             if (createProfileKey.currentState.validate()) {
//                               //
//                               FirebaseFirestore firebaseFirestore =
//                                   FirebaseFirestore.instance;
//                               String email =
//                                   FirebaseAuth.instance.currentUser.email;
//                               debugPrint('Successfully Form validated');
//                               var uData = {
//                                 "name": name,
//                                 "phone": phoneNumber,
//                                 "address": address,
//                                 "state": state,
//                                 "email": email
//                               };

//                               await firebaseFirestore
//                                   .collection('Users')
//                                   .doc(email)
//                                   .set(uData);
//                               print('Data added');
//                               Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => ProductCatalog()));
//                             } else {
//                               debugPrint('Please fill the form again');
//                             }
//                           },
//                           child: Text('Create Profile',
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold))),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
