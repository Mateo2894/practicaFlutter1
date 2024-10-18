import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return principal();
  }

  MaterialApp principal() {
    return MaterialApp(
    title: 'Material App',
    debugShowCheckedModeBanner: false,
    home: pricipal(),
  );
  }
}
List<Persona> _Personas = [
  Persona ('luis','mateo','20192894'),
  Persona ('angel','flores','20199428'),
  Persona ('angel','mateo','20199248'),
  Persona ('luis','flores','20198429'),
];
final nom = TextEditingController();
final ape = TextEditingController();
final cue = TextEditingController();

String tnom = '';
String tape = '';
String tcue = '';

class pricipal extends StatelessWidget {
  const pricipal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return principal1();
  }
}

class principal1 extends StatefulWidget {
  const principal1({
    super.key,
  });

  @override
  State<principal1> createState() => _principal1State();
}

class _principal1State extends State<principal1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de alumnos   ' ),
      ),
      
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.people_alt_outlined),
      backgroundColor: Colors.blueAccent,
      onPressed: (){
        Navigator.push(context, MaterialPageRoute
        (builder: (BuildContext context)=>principal2()));
      }),
      body:  ListView.builder(
        itemCount: _Personas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_Personas [index].name+ ' ' + _Personas[index].lastname),
            subtitle: Text(_Personas[index].cuenta),
            leading: CircleAvatar(
              child: Text(_Personas[index].name.substring(0,1))
            ),
           trailing: Icon(Icons.arrow_forward_ios),
          );
    
        },
      ),
    );
  }
}
class principal2 extends StatefulWidget {
 

  @override
  State<principal2> createState() => _principal2State();
}

class _principal2State extends State<principal2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('agregar alumno' ),
      ),
      
    
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            Container(
              child: TextField(
                controller: nom,
                decoration: InputDecoration(
                
              hintText: 'Nombre',
              filled: true,
              fillColor: Colors.white
              
              ),
              ),
              ),
             SizedBox(height:30.0),
             Container(
              child: TextField(
                controller: ape,
                decoration: InputDecoration(hintText: 'Apellidos',
              filled: true,
              fillColor: Colors.white
              
              ),
              ),              
              ),
           SizedBox(height:30.0),
           Container(
              child: TextField(
                controller: cue,
                decoration: InputDecoration(hintText: 'No. Cuneta',
              filled: true,
              fillColor: Colors.white
              
              ),
              ),
              ),
            SizedBox(height:30.0),
              Container(
                child: TextButton(
                  child: Text('Guardar',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  
                  ),
                 
                    
                  onPressed: (){
                    tnom = nom.text;
                    tape = ape.text;
                    tcue = cue.text;

                    _Personas.add(Persona(tnom,tape ,tcue));
                     Navigator.push(context, MaterialPageRoute
                     (builder: (BuildContext context)=>principal1()));
                  } 
                  ),
             
              )
             
          ],         
        ),
      ),
    );
  }
}

class Persona {
  String name;
  String lastname;
  String cuenta;

  Persona(this.name, this.lastname, this.cuenta);
}
