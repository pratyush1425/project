import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

update(String collName, docName, field, var newFieldValue) async {
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName)
      .update({field: newFieldValue});
  print('Fields Updated');
}
