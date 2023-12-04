import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_cardmap/state.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  List<String> cardList = [];

  List<Widget> buildListCards(BuildContext context) {
    final provinceList = [
      '서울',
      '경기',
      '인천',
      '부산',
      '대구',
      '광주',
      '대전',
      '울산',
      '경남',
      '경북',
      '충남',
      '충북',
      '전남',
      '전북',
      '강원',
      '제주',
      '세종',
    ];

    return provinceList.map((item) {
      bool isItemChecked =
          cardList.contains(item); // Check if item is in cardList

      return Card(
        clipBehavior: Clip.antiAlias,
        child: GestureDetector(
          onTap: () async {
            setState(() {
              if (isItemChecked) {
                cardList.remove(item); // Remove item from cardList
              } else {
                cardList.add(item); // Add item to cardList
              }
            });

            await FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .set({
              'name': FirebaseAuth.instance.currentUser!.displayName,
              'cardList': cardList,
            });

            print('done add');
            EasyLoading.show(status: 'loading');
          },
          child: SizedBox(
            height: 50,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: isItemChecked
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item),
                          const Icon(Icons.check),
                        ],
                      )
                    : Text(item),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // No need to fetch cardList from appState, it's already maintained in the local state
    return Scaffold(
      appBar: AppBar(
        title: const Text('카드 추가'),
        centerTitle: true,
      ),
      body: ListView(
        children: buildListCards(context),
      ),
    );
  }
}
