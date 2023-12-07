import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDo28Q7vEAqyucGzCOCJzU4UOTFOiZKEpw",
            authDomain: "digital-literacy-f0owkn.firebaseapp.com",
            projectId: "digital-literacy-f0owkn",
            storageBucket: "digital-literacy-f0owkn.appspot.com",
            messagingSenderId: "1004039114611",
            appId: "1:1004039114611:web:91d0f3d32002b4d3b3ff06"));
  } else {
    await Firebase.initializeApp();
  }
}
