import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_e_attandance/model/user_model.dart';
import 'package:flutter_e_attandance/services/api_service.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getHistoryabsen());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getDatapulang() async {
    _userModel = (await ApiService().getHistorypulang());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(
          child: const Text("history Absen"),
          onPressed: () {
              _getData();
          },
        ),
        ElevatedButton(
            child: const Text("history pulang"),
            onPressed: () {
                _getDatapulang();
            }),
      ]),
      SizedBox(
        height: 550.0,
        width: 500.0,
        child: _userModel == null || _userModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _userModel!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(_userModel![index].tanggal.toString()),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(_userModel![index].waktu.toString()),
                            Text(_userModel![index].status.toString()),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    ]);
  }
}
