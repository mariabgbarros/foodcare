import 'package:flutter/material.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:foodcare/models/usuario_login.dart';
import 'package:foodcare/screens/home.dart';
import 'package:foodcare/screens/dieta.dart';
import 'package:foodcare/screens/perfil.dart';
import 'package:foodcare/screens/telagrafico2.dart';
import 'package:http/http.dart' as http;

//import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavigationView extends StatefulWidget {
  late String user;
  NavigationView(this.user, {Key? key}) : super(key: key);

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int paginaAtual = 0;
  late PageController pageController;
  late UsuarioLogin usuarioLogin;
  var isLogado = true;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: paginaAtual);
  }

  void onTapped(int index) {
    setState(() {
      paginaAtual = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    UsuarioLogin? map = ModalRoute.of(context)!.settings.arguments as UsuarioLogin?;

    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: onTapped,
          controller: pageController,
          children: [ // telas
            //const Home,
            //(map != null) ? Home(usuario_login: map) : Home(usuarioLogin: null),
            const PieChartPage2(), //home
            const Dieta(),
            //(map != null) ? PerfilApp(usuario_cadastro: map) : PerfilApp(usuario_cadastro: null),
            ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 240, 66, 61),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined,), label: 'Escanear'),
            BottomNavigationBarItem(icon: Icon(Icons.apple), label: 'Dieta'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil')
          ],
          currentIndex: paginaAtual,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: onTapped,
        ));
  }
}
