import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String? _errorMessage;

  String? _email;
  String? _password;

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/img/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    "ECOFILMS",
                    style: TextStyle(
                      fontFamily: 'Antonio',
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 16),
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
                            "Login",
                            style: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Email ou número de telefone",
                              hintStyle: TextStyle(
                                fontFamily: 'Antonio',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFAEA0A0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor, insira um email";
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return "Insira um email válido";
                              }
                              return null;
                            },
                            onSaved: (value) => _email = value,
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              hintText: "Senha",
                              hintStyle: TextStyle(
                                fontFamily: 'Antonio',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFAEA0A0),
                              ),
                              suffixIcon: GestureDetector(
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor, insira sua senha";
                              }
                              if (value.length < 6) {
                                return "A senha deve ter pelo menos 6 caracteres";
                              }
                              return null;
                            },
                            onSaved: (value) => _password = value,
                          ),
                          SizedBox(height: 12),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                buttonEnterClick();
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontFamily: 'Antonio',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(440, 50),
                                backgroundColor: Color(0xFF65DC65),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 0),
                          Divider(color: Colors.white),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_errorMessage != null)
                                Expanded(
                                  child: Text(
                                    _errorMessage!,
                                    style: TextStyle(color: Colors.red),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/home');
                                },
                                child: Text(
                                  'Esqueceu a senha?',
                                  style: TextStyle(
                                    fontFamily: 'Antonio',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 64),
                          Row(
                            children: [
                              Text(
                                'Novo por aqui? ',
                                style: TextStyle(
                                  fontFamily: 'Antonio',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Color(0xFFAEA0A0),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, ('/cadastro'));
                                },
                                child: Text(
                                  "Cadastrar-se",
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void buttonEnterClick() {
    setState(() {
      _errorMessage = null;
    });

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_isValidEmail(_email) && _isValidPassword(_password)) {
        Navigator.pushNamed(context, '/home');
      } else {
        setState(() {
          _errorMessage = "Email ou senha inválidos";
        });
      }
    }
  }

  bool _isValidEmail(String? email) {
    return email != null && RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  bool _isValidPassword(String? password) {
    return password != null && password.length >= 6;
  }
}
