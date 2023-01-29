// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../tasks_store.dart';

enum Options { sim, nao, parcial }

// class Radin extends StatefulWidget {
//   const Radin({super.key});

//   @override
//   State<Radin> createState() => _RadinState();
// }

// class _RadinState extends State<Radin> {
//   Options? op;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [

//       ],
//     );
//   }
// }

class Radin extends StatefulWidget {
  Radin({super.key, this.task});
  String? task;
  String? uid;

  @override
  State<Radin> createState() => _RadinState();
}

class _RadinState extends State<Radin> {
  Options? op;
  String? group;
  String? task;
  final TasksStore tStore = Modular.get();

  @override
  // void initState() {
  //   if (widget.task!.length == 10){
  //     group = widget.task!.substring(0,5);
  //     task = widget.task!.substring(5);
  //   } else {
  //     group = widget.task!.substring(0,4);
  //     task = widget.task!.substring(4);
  //   }
  //   super.initState();
  //   tStore.getTasksFromFirebase(widget.uid!, group!);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
       decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 3.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Responder ao final de dois dias sobre a execução das tarefas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Sim'),
              Column(
                children: [
                  Radio(
                      groupValue: op,
                      value: Options.sim,
                      onChanged: (Options? value) {
                        setState(() {
                          op = value;
                          tStore.answer = value.toString();
                        });
                        tStore.uploadTaskToFirebase(
                            widget.uid, widget.task, "SIM");
                      })
                ],
              ),
              Text('Não'),
              Column(
                children: [
                  Radio(
                      groupValue: op,
                      value: Options.nao,
                      onChanged: (Options? value) {
                        setState(() {
                          op = value;
                          tStore.answer = value.toString();
                        });
                        tStore.uploadTaskToFirebase(
                            widget.uid, widget.task, "NAO");
                      })
                ],
              ),
              Text('Parcial'),
              Column(
                children: [
                  Radio(
                      groupValue: op,
                      value: Options.parcial,
                      onChanged: (Options? value) {
                        setState(() {
                          op = value;
                          tStore.answer = value.toString();
                        });
                        tStore.uploadTaskToFirebase(
                            widget.uid, widget.task, "PARCIAL");
                      })
                ],
              ),
            ],
          )
        ],
      ),
    );

    // return Container(
    //   padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(30.0),
      //     border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 3.0)),
    //   child: Column(
    //     children: <Widget>[
    // const Text('Responder ao final de dois dias sobre a execução das tarefas',
    //     style: TextStyle(
    //       fontWeight: FontWeight.bold,
    //       fontSize: 18,
    //     )),
    // RadioListTile(
    //     groupValue: op,
    //     value: Options.sim,
    //     title: const Text("Sim"),
    //     toggleable: false,
    // onChanged: (Options? value) {
    //   setState(() {
    //     op = value;
    //     tStore.answer = value.toString();
    //   });
    //   tStore.uploadTaskToFirebase(widget.uid, widget.task, "SIM");

    //     },

    //     ),
    //       RadioListTile(
    //           groupValue: op,
    //           value: Options.nao,
    //           title: const Text("Nao"),
    //           onChanged: (Options? value) {
    //             setState(() {
    //               op = value;
    //               tStore.answer = value.toString();
    //             });
    //             tStore.uploadTaskToFirebase(widget.uid, widget.task, "NAO");

    //           }),
    //       RadioListTile(
    //           groupValue: op,
    //           value: Options.parcial,
    //           title: const Text("Parcial"),
    //           onChanged: (Options? value) {
    //             setState(() {
    //               op = value;
    //               tStore.answer = op.toString();
    //             });
    //             tStore.uploadTaskToFirebase(widget.uid, widget.task, 'PARCIAL');

    //           }),
    //     ],
    //   ),
    // );
  }
}
