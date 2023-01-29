import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up/app/modules/home/components/carousel.dart';
import 'package:up/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';

import '../initial/auth/auth_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  final AuthStore aStore = Modular.get();

  @override
  void initState() {
    // aStore.recover();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title, style: const TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 193, 143),

        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 255, 193, 143),
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Observer(builder: (_) {
                                  return Text(
                                      "Olá ${aStore.controllerName.text}",
                                      style: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white));
                                })),
                          ),

                          CustomCarouselFB2()
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
