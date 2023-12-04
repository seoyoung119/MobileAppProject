import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project_cardmap/app.dart';
import 'package:project_cardmap/firebase_options.dart';
import 'package:project_cardmap/state.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // LocationPermission permission =
  //     await Geolocator.requestPermission(); //위치정보 허가

  await NaverMapSdk.instance.initialize(
    clientId: 'xiqeiz52zm',
    onAuthFailed: (ex) {
      print("********* 네이버맵 인증오류 : $ex *********");
    },
  );

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const CardMapp()),
  ));
}

/*
카드 인식, Badges, Card Swiper
DB Query 및 데이터 저장
반복문으로 데이터 저장. 
*/