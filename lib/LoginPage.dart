import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
    appBar: AppBar(
      // title: const Text("Ponto Digital",
      //  style: TextStyle(
      //   color:Colors.white,
      //    fontSize: 25, 
      //   ),),
      // elevation: 0,
      backgroundColor: const Color.fromARGB(0, 32, 64, 245)
     ),
     body: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(27),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors:[
        Color.fromARGB(255, 6, 10, 255),
        Color.fromARGB(255, 255, 19, 19),
        ],
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const Text("Digite os dados de acesso nos campos abaixo",
           style: TextStyle(color:Colors.white),
           ),
          const  SizedBox(height: 30,),
           const CupertinoTextField(
            cursorColor: Color.fromARGB(255, 177, 59, 98),
            padding: EdgeInsets.all(15),
            placeholder: "Digite o seu e-mail",
            placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
            style: TextStyle(color: Colors.white, fontSize: 14),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(7),
              )
            )
           ),
         const SizedBox(height: 5,),
           const CupertinoTextField(
              cursorColor: Color.fromARGB(255, 177, 59, 98),
            padding: EdgeInsets.all(15),
            placeholder: "Digite sua senha",
            obscureText: true,
            placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
            style: TextStyle(color: Colors.white, fontSize: 14),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(7),
              )
            )
           ),
           const SizedBox(height: 30,),
           SizedBox(
            width: double.infinity,
           child: CupertinoButton(
            padding: const EdgeInsets.all(17),
            color: Colors.greenAccent,
            child: const Text(
              "Acessar",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w600),
            ),
           onPressed: () {}, ),
           ),
            const SizedBox(height: 7,),
           Container(
            width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white70, width: 0.8),
            borderRadius: BorderRadius.circular(7)),
           child: CupertinoButton(
            child: const Text(
              "Crie sua conta",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600),
            ),
           onPressed: () {}, ),
           )]
      )
     ),
    );
  }
}