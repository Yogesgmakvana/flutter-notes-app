import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasyS extends StatefulWidget {
  const TasyS({super.key});

  @override
  State<TasyS> createState() => _TasySState();
}

class _TasySState extends State<TasyS> {
  //texteditiong controller
  TextEditingController textController = TextEditingController();
  //task list
  List<String> tasks = [];
  
  //save task
  Future<void> saveTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', tasks);
  }
   
//remove task from list
   Future<void> removeTask(int index) async {
  setState(() {
    tasks.remove(tasks[index]); 
  });

  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('tasks', tasks); 
}
 
 //update task
 Future<void>updateTask(int index)async{
   textController.text=tasks[index];
    setState(() {
    tasks.remove(tasks[index]); 
  });

    final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('tasks', tasks); 


 }

  
  //get and load task
  Future<void> loadTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tasks = prefs.getStringList('tasks') ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    loadTask();
  }

  bool isChanged=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   isChanged?Color.fromARGB(255, 15, 2, 2) :Color.fromARGB(255, 228, 200, 127),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: Text("Yogesh Makvana"), accountEmail: Text("makwanay324@gmail.com")),
            ListTile(
              title: SwitchListTile(
                title: Text("Dark Mode"),
                value: isChanged,
               onChanged:(value) {
                setState(() {
                  isChanged=!isChanged;
                });
              },),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: () async {
                  if (textController.text.isNotEmpty) {
                    setState(() {
                      tasks.add(textController.text);
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Task added  Successfully!',
                      );
                    });
                     await saveTask();
                    textController.clear();
                  }
                 
                 
                },
                child: Text('CReate Note'),
              ),
            ),
           SizedBox(
            height: 30,
           ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    color: Colors.amberAccent,
                    child: ListTile(
                      title: Text(tasks[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                         trailing:SizedBox(
                          height: 50,
                          width: 97,
                          child: Row(
                            children: [
                            IconButton(
                              color: Colors.blue,
                              onPressed:() {
                            updateTask(index);
                          }, icon:Icon(Icons.edit)),

                            IconButton(
                              color: Colors.red,
                              onPressed:() {
                               removeTask(index);
                                 QuickAlert.show(
                        context: context,
                        type: QuickAlertType.warning,
                        text: 'Task Deleted  Successfully!',
                      );
                          }, icon:Icon(Icons.delete_forever)),

                          
                            ],
                          ),
                        )
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
