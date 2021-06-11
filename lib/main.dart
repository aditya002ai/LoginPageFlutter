import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationControler;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    _iconAnimationControler =
        AnimationController(vsync: this, duration: Duration(microseconds: 300));

    _iconAnimation =
        CurvedAnimation(parent: _iconAnimationControler, curve: Curves.easeOut);

    _iconAnimation.addListener(() {
      this.setState(() {});
    });
    _iconAnimationControler.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage("assets/ai.png"),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/logo.png"),
                  width: _iconAnimation.value * 100,
                  height: _iconAnimation.value * 100,
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
                Form(
                    child: Theme(
                  data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 20.0))),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: "Enter Email"),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Enter Password"),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(padding: const EdgeInsets.all(20.0)),
                        new MaterialButton(
                            onPressed: () => {},
                            color: Colors.teal,
                            textColor: Colors.white,
                            splashColor: Colors.orangeAccent,
                            child: Text("Login"))
                      ],
                    ),
                  ),
                ))
              ],
            )
          ],
        ));
  }
}
