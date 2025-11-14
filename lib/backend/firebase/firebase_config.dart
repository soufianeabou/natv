import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA2ukUKiqIhz8YmJJ-jECjEUIt5NsrG-JU",
            authDomain: "natv-qji7gm.firebaseapp.com",
            projectId: "natv-qji7gm",
            storageBucket: "natv-qji7gm.firebasestorage.app",
            messagingSenderId: "659876607355",
            appId: "1:659876607355:web:f10e70edfeb85a72ab79de"));
  } else {
    await Firebase.initializeApp();
  }
}
