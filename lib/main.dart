import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const ContactAdd(),
    );
  }
}

class ContactAdd extends StatefulWidget {
  const ContactAdd({ Key? key }) : super(key: key);

  @override
  State<ContactAdd> createState() => _ContactAddState();
}
List<Map<String, dynamic>> name = [
  {
    'name': 'Ranjita', 'contact' :'983125785786'},
     {
    'name': 'Ranjita', 'contact' :'983125785786'},

     {
    'name': 'Ranjita', 'contact' :'983125785786'},
    ];

class _ContactAddState extends State<ContactAdd> {
  final namecon = TextEditingController();
  final contactscon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact App'),
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index){
          return UserDetailedWidget(
            name: name[index]['name'],
            contact: name[index]['contact'],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
          context: context,
          builder: (c){
            return AlertDialog(
              title: const Text("Add new contact"),
              content: Container(
                padding: EdgeInsets.zero,
                height: 200,
                child: Column(
                  children: [
                    TextField(
                      controller: namecon,
                      decoration: InputDecoration(
                        labelText: 'Enter your name'
                      ),
                      keyboardType: TextInputType.name,

                    ),
                    TextField(
                      controller: contactscon,
                      decoration: const InputDecoration(
                        labelText: 'Enter your number',
             
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: (){     
                        setState(() {
                          name.add({
                            'name': namecon.text,
                            'contact': contactscon.text,
                          });
                        });
                        Navigator.of(context).pop();
                         }, child: Text("Add"),
                         ),
                  ],
                ),
              ),
            );
          }
          );
      },
      child: Icon(Icons.add),),
    );
  }
}
class UserDetailedWidget extends StatelessWidget {
  const UserDetailedWidget({ Key? key, required this.name, required this.contact }) : super(key: key);

final String name ;
final String contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(contact),
      leading: CircleAvatar(),
      trailing: Icon(Icons.call),
    );
  }
}