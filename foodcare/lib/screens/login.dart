import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/screens/home.dart';
import 'package:foodcare/screens/perfil.dart';
import 'package:foodcare/screens/tela_piechart.dart';
import 'package:foodcare/screens/telagrafico2.dart';
import 'package:foodcare/models/usuario_login.dart';
import 'package:foodcare/network/network.dart';

class Login extends StatefulWidget{
  const Login({
    Key? key,
  }) : super(key:key);
  
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _network = Network();

  late TextEditingController _emailController;
  late TextEditingController _senhaController;

  String buttonText = 'Save';
  int? id;

  @override
  void initState() {
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 240, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 66, 61),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            //key: _formKey,
            child: Column(
              children: <Widget> [
                Container(
                  padding: EdgeInsets.only(top:80),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                   padding: EdgeInsets.only(top:50),
                  child: TextFormField(
                    controller: _senhaController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Senha",
                        hintStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child:
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 98, 39),
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          //MaterialPageRoute(builder: (context) => Home()),
                                                    MaterialPageRoute(builder: (context) => PerfilApp()),
                        );*/
                      },
                    ),
                ),
              ],
            ),
          )
        )
      )

    );

  }
  /*void seeAll(BuildContext context) async {
    await showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.amber,
      context: context,
      builder: (c) {
        return FutureBuilder<List<UsuarioLogin>?>(
          future: _network.read,
          builder: (c, s) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.8,
              color: Colors.amber,
              child: allPersons(s),
            );
          },
        );
      },
    );
  }
  Widget allPersons(AsyncSnapshot<List<UsuarioLogin>?> s) {
    if (!s.hasData) {
      return const Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: s.data!.length,
        itemBuilder: (c, i) {
          return PersonCard(
            person: s.data![i],
            delete: () {
              setState(() {});
            },
            update: () {
              setState(
                () {
                  buttonText = 'Update';
                  UsuarioLogin u = s.data![i];
                  id = u.id;
                  _emailController.text = u.email;
                  _senhaController.text = u.senha;
                },
              );
            },
          );
        },
      );
    }
  }*/
   Future<void> saveButtonAction() async {
    switch (buttonText) {
      case 'Update':
        await updateAction();
        break;
      default:
        await saveAction();
    }
    _emailController.clear();
    _senhaController.clear();
    setState(() {
      buttonText = 'Save';
    });
  }
  bool get condition {
    bool c1 = _emailController.text.isNotEmpty;
    bool c2 = _senhaController.text.isNotEmpty;
    bool condition = c1 && c2;
    return condition;
  }
  Future<void> updateAction() async {
    if (condition) {
      var u = UsuarioLogin(
        email: _emailController.text,
        senha: _senhaController.text,
        id: id,
      );
      await _network.update(u);
      await dialog('${u.email} ${u.senha} updated.');
    } else {
      await dialog('Fields cannot be empty.');
    }
  }
  Future<void> saveAction() async {
    if (condition) {
      var u = UsuarioLogin(
        email: _emailController.text,
        senha: _senhaController.text,
        id: null,
      );
      bool c = await _network.check(u);
      if (c) {
        await _network.write(u);
        await dialog(
          '${u.email} ${u.senha} logged',
        );
      } else {
        await dialog(
          '${u.email} ${u.senha} already exist',
        );
      }
    } else {
      await dialog('Fields cannot be empty.');
    }
  }
  Future<void> dialog(
    String message,
  ) async {
    return await showDialog(
      context: context,
      builder: (c) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(message),
          ),
        );
      },
    );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  }
}