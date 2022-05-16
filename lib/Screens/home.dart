import 'package:api_call/provider/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GetApiProvider getApiProvider = GetApiProvider();

  @override
  void initState() {
    getApiProvider = Provider.of<GetApiProvider>(context, listen: false);
    getApiProvider.getApiProvider();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GetApiProvider>(
        builder: (context, value, child) {
          var nData = value.customModal.data;
          return Center(
              child: ListView.builder(
            itemCount: value.customModal.data?.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text("${nData?[index].abv}"),
                ],
              );
            },
          ));
        },
      ),
    );
  }
}
