import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up/app/modules/tasks/conteudo/primeiro/primeiro_store.dart';
import 'package:up/app/modules/tasks/conteudo/primeiro/tarefas/comps/comps.dart';


import 'denverLG.dart';

class AvaliacaoPage extends StatefulWidget {
  final String title;
  const AvaliacaoPage({Key? key, this.title = 'Avaliação Pessoal - Social'}) : super(key: key);
  @override
  AvaliacaoPageState createState() => AvaliacaoPageState();
}
class AvaliacaoPageState extends State<AvaliacaoPage> {
  final PrimeiroStore store = Modular.get();
  Map? answers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        child: Observer(builder: (_) {return Column(
          children: [
            Expanded(child: LayoutBuilder(
              builder: (_, constraints) => SingleChildScrollView(
                child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Center(child: Text(
                    "Avaliação Pessoal - Social",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  )),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * 3.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Image.asset('images-dev/ps/A1 - color.jpg'),
                          denverRadio(index: 1, text: 'Observa o rosto/olha para voce?'),
                          Image.asset('images-dev/ps/A2 - color.jpg'),
                          denverRadio(index: 2,text: 'Sorrir em resposta, quando conversa com '),
                          Image.asset('images-dev/ps/A3 - color.jpg'),
                          denverRadio(index: 3,text: 'Sorrir espontaneamente?'),
                          Image.asset('images-dev/ps/A4 - color.jpg'),
                          denverRadio(index: 4,text: 'Observa sua própria mão?'),
                          Image.asset('images-dev/ps/A5 - color.jpg'),
                          denverRadio(index: 5,text: 'Tenta alcançar um brinquedo?'),
                          // Center(child: ElevatedButton(
                          //   onPressed: (){
                          //     Navigator.push(
                          //       context, MaterialPageRoute(
                          //         builder: (context) => const DenverLGPage(),
                          //       )
                          //     );
                          //   },
                          //   child: const Text("Proxima avaliação"),
                          // ),)
                      ],),
                    ),
                  )
                 
                ]),
              )
            ))
          ],
        );
  }),
    ));
  }
}