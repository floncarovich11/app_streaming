import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();

  bool _showPassword = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 50, 48, 48).withOpacity(0.5),
                BlendMode.darken,
              ),
              child: Image.asset(
                'assets/img/fundologin.jfif',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/img/logo.png',
                  height: 70,
                  width: 70,
                ),
                Text(
                  "ECOFILMS",
                  style: TextStyle(
                    fontFamily: 'Antonio',
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Cadastro",
                          style: TextStyle(
                            fontFamily: 'Antonio',
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildTextField("Nome", false, (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor, insira seu nome.";
                          }
                          return null;
                        }),
                        SizedBox(height: 16),
                        _buildTextField("CPF", false, (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor, insira seu CPF.";
                          } else if (value.length != 11 || !RegExp(r'^\d+$').hasMatch(value)) {
                            return "CPF inválido. Deve ter 11 dígitos numéricos.";
                          }
                          return null;
                        }),
                        SizedBox(height: 16),
                        _buildTextField("Email", false, (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor, insira um email válido.";
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return "Email inválido.";
                          }
                          return null;
                        }),
                        SizedBox(height: 16),
                        _buildTextField("Celular", false, (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor, insira seu celular.";
                          } else if (value.length < 10 || value.length > 11 || !RegExp(r'^\d+$').hasMatch(value)) {
                            return "Celular inválido.";
                          }
                          return null;
                        }),
                        SizedBox(height: 16),
                        _buildPasswordField("Senha", (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor, insira uma senha.";
                          } else if (value.length < 6) {
                            return "A senha deve ter no mínimo 6 caracteres.";
                          }
                          return null;
                        }, _senhaController),
                        SizedBox(height: 16),
                        _buildPasswordField("Confirmar senha", (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor, confirme sua senha.";
                          } else if (value != _senhaController.text) {
                            return "As senhas não coincidem.";
                          }
                          return null;
                        }, _confirmarSenhaController),
                        SizedBox(height: 16),
                        Center(
                          child: ElevatedButton(
                            onPressed: buttonEnterClick,
                            child: Text(
                              "Cadastrar-se",
                              style: TextStyle(
                                fontFamily: 'Antonio',
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(300, 45),
                              backgroundColor: Color(0xFF65DC65),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                        ),
                        Divider(color: Colors.white),
                        Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: _errorMessage != null
                                    ? Text(
                                        _errorMessage!,
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ),
                            SizedBox(width: 12),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/home');
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Ja tem um cadastro? ',
                                    style: TextStyle(
                                      fontFamily: 'Antonio',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Color(0xFFAEA0A0),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, ('/login'));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontFamily: 'Antonio',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, bool obscure, String? Function(String?) validator) {
    return Container(
      width: 300,
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'Antonio',
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Color(0xFFAEA0A0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildPasswordField(String hint, String? Function(String?) validator, TextEditingController controller) {
    return Container(
      width: 300,
      child: TextFormField(
        controller: controller,
        obscureText: !_showPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'Antonio',
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Color(0xFFAEA0A0),
          ),
          suffixIcon: GestureDetector(
            child: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
            onTap: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide.none,
          ),
        ),
        validator: validator,
      ),
    );
  }

  void buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/');
    } else {
      setState(() {
        _errorMessage = "Preencha todos os campos corretamente.";
      });
    }
  }
}
