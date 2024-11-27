import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulearning/common/service/storage_service.dart';

class Global {
  static late StoreageService storeageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    storeageService = await StoreageService().init();
  }
}
 