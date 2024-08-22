import 'package:flutter/material.dart';

void main() {
  runApp(const TwoHomework());
}

class TwoHomework extends StatelessWidget {
  const TwoHomework({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white38),
        useMaterial3: true,
      ),
      home: const TwoHomeworkHomePage(title: 'Dynamic To Do App Home Page'),
    );
  }
}

class TwoHomeworkHomePage extends StatefulWidget {
  const TwoHomeworkHomePage({super.key, required this.title});
  final String title;

  @override
  State<TwoHomeworkHomePage> createState() => _TwoHomeworkHomePageState();
}

class _TwoHomeworkHomePageState extends State<TwoHomeworkHomePage> {
  List<String> tasks = []; // Görevleri saklamak için liste oluşturduk
  final _controller = TextEditingController();//TextField içeriğini kontrol ettik.

  @override
  void dispose() {
    _controller.dispose(); // TextEditingController'ı dispose ediyoruz.
    super.dispose();
  }
//Set state build den sonrasını yeniler ve tekrar çalıştırılır. Bu yüzden değişkenleri buildden önce tanımlamalıyız.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title:  Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
               title: Text(tasks[index]), // Listeyi dolaştık dolaşırken indexlere göre dolaştık
               onTap:(){
                 showDialog(
                   context: context,
                   builder: (context) {
                     return AlertDialog(
                       title: Text(tasks[index]),
                       actions: [
                         IconButton(
                           icon: const Icon(Icons.delete),
                           onPressed: () {
                             setState(() => tasks.removeAt(index));
                             Navigator.pop(context);
                           },
                         ),
                         IconButton(
                           icon: const Icon(Icons.check),
                             onPressed: (){
                               setState(() {
                                 tasks[index] ='${tasks[index]} ✅';
                                 ListTile(
                                   title: Text(tasks[index],
                                     style: tasks[index].contains('✅')
                                     ? const TextStyle(decoration: TextDecoration.lineThrough)
                                         :null,

                                 ));
                               }
                               );
                               Navigator.pop(context);

                             },

                         ),

                       ],
                     );
                   },
                 );
               },


              );
               }),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add Task'), // Error verir uyarı ekranını gibi çıkan ekranı burada yaptık
                  content: TextField(
                    controller: _controller,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tasks.add(_controller.text);
                          _controller.clear();
                          // Her TextField de bir controller kullanılmalıdır yoksa her yazdığımız satırda aynı şeyi yazarız.
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );

              },
            );
              _controller.text = 'Add new task';

            });
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}









