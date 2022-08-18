import 'dart:html';

import 'package:flutter/material.dart';
import 'package:foodcare/screens/perfil.dart';
import 'package:foodcare/screens/home.dart';
import 'package:foodcare/screens/dieta.dart';

class CustomNavBar extends StatefulWidget {

  int paginaAberta;
  CustomNavBar({required this.paginaAberta});
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override 
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container (
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MaterialButton( //home
                minWidth: 40,
                onPressed:() {
                  setState(() {
                    widget.paginaAberta = 0;
                  });
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Home())
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      color: widget.paginaAberta == 0 ? Colors.redAccent: Colors.white
                    ),
                  ],
                ),
              ),
              MaterialButton( //IA
                minWidth: 40,
                onPressed:() {
                  setState(() {
                    widget.paginaAberta = 1;
                  });
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Home())
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.camera_alt_outlined,
                      color: widget.paginaAberta == 1 ? Colors.redAccent: Colors.white
                    ),
                  ],
                ),
              )
            ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton( // dieta
                  minWidth: 40,
                  onPressed:() {
                    setState(() {
                      widget.paginaAberta = 2;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Dieta())
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.apple,
                        color: widget.paginaAberta == 2 ? Colors.redAccent: Colors.white
                      ),
                    ],
                  ),
                ),
                MaterialButton( // perfil
                  minWidth: 40,
                  onPressed:() {
                    setState(() {
                      widget.paginaAberta = 3;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Perfil())
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: widget.paginaAberta == 3 ? Colors.redAccent: Colors.white
                      ),
                      
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}