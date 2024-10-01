import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos de senha
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: const Color.fromARGB(0, 32, 64, 245)),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 6, 10, 255),
              Color.fromARGB(255, 255, 19, 19),
            ],
          ),
        ),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    "Digite os dados de acesso nos campos abaixo",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "O e-mail não pode ser vazio";
                      }
                      if (value.length < 5) {
                        return "O e-mail é muito curto";
                      }
                      if (!value.contains("@")) {
                        return "O e-mail não é válido";
                      }
                      return null;
                    },
                    cursorColor: const Color.fromARGB(255, 177, 59, 98),
                    decoration: InputDecoration(
                      hintText: "Digite o seu e-mail",
                      hintStyle: const TextStyle(
                          color: Colors.white70, fontSize: 14),
                      filled: true,
                      fillColor: Colors.black12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _senhaController,  // Controlador da senha
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "O campo não pode ser vazio";
                      }
                      if (value.length < 6) {
                        return "A senha deve ter mais de 6 caracteres";
                      }
                      return null;
                    },
                    cursorColor: const Color.fromARGB(255, 177, 59, 98),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: (queroEntrar)
                          ? "Digite sua senha"
                          : "Criar Senha",
                      hintStyle: const TextStyle(
                          color: Colors.white70, fontSize: 14),
                      filled: true,
                      fillColor: Colors.black12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    visible: !queroEntrar,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _confirmarSenhaController,  // Controlador de confirmação de senha
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "O campo não pode ser vazio";
                            }
                            if (value != _senhaController.text) {
                              return "As senhas não coincidem";
                            }
                            return null;
                          },
                          cursorColor: const Color.fromARGB(255, 177, 59, 98),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Confirmar senha",
                            hintStyle: const TextStyle(
                                color: Colors.white70, fontSize: 14),
                            filled: true,
                            fillColor: Colors.black12,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "O campo não pode ser vazio";
                            }
                            return null;
                          },
                          cursorColor: const Color.fromARGB(255, 177, 59, 98),
                          decoration: InputDecoration(
                            hintText: "Nome",
                            hintStyle: const TextStyle(
                                color: Colors.white70, fontSize: 14),
                            filled: true,
                            fillColor: Colors.black12,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(17),
                      color: Colors.greenAccent,
                      child: Text(
                        (queroEntrar) ? "Acessar" : "Cadastrar",
                        style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        botaoClicado();
                      },
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white70, width: 0.8),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: CupertinoButton(
                      child: Text(
                        (queroEntrar)
                            ? "Crie sua conta"
                            : "Já possui uma conta? Entre",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        setState(() {
                          queroEntrar = !queroEntrar;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void botaoClicado() {
    if (_formKey.currentState!.validate()) {
      print("Formulário válido");
    } else {
      print("Formulário inválido");
    }
  }
}
