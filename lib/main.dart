// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_flutter/CreateUserRequest.dart';
import 'package:http/http.dart' as http;

import 'CreateNewUserDto.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(body: LoginDemo()),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

// ignore: camel_case_types
class registerDemo extends StatefulWidget {
  const registerDemo({super.key});

  @override
  _RegisterDemoState createState() => _RegisterDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  CreateUserRequest createUserRequest = CreateUserRequest("", "");
  String url = "http://localhost:8080/auth/login";

  Future save() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': createUserRequest.username,
          'password': createUserRequest.password
        }));
    if (res.statusCode == 201) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashBoardDemo(),
          ));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyApp(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Real Betis Balompie"),
        titleTextStyle: const TextStyle(
          fontSize: 32,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 180,
                    height: 250,
                    child: Image.network(
                        'http://assets.stickpng.com/thumbs/584ad396b519ea740933a8d9.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller:
                    TextEditingController(text: createUserRequest.username),
                onChanged: (val) {
                  createUserRequest.username = val;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter valid user name'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller:
                    TextEditingController(text: createUserRequest.password),
                onChanged: (val) {
                  createUserRequest.password = val;
                },
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const registerDemo()));
              },
              child: Text(
                'Register now',
                style: const TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  save();
                },
                child: Text(
                  'Login',
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegisterDemoState extends State<registerDemo> {
  CreateNewUserDto createNewUserDto = CreateNewUserDto("", "", "");
  String url = "http://localhost:8080/auth/register";

  Future save() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': createNewUserDto.username,
          'password': createNewUserDto.password,
          'fullName': createNewUserDto.fullName
        }));
    if (res.statusCode == 201) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashBoardDemo(),
          ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyApp(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Real Betis Balompie"),
        titleTextStyle: const TextStyle(
          fontSize: 32,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 180,
                    height: 250,
                    child: Image.network(
                        'http://assets.stickpng.com/thumbs/584ad396b519ea740933a8d9.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller:
                    TextEditingController(text: createNewUserDto.username),
                onChanged: (val) {
                  createNewUserDto.username = val;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter valid user name'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller:
                    TextEditingController(text: createNewUserDto.password),
                onChanged: (val) {
                  createNewUserDto.password = val;
                },
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller:
                    TextEditingController(text: createNewUserDto.fullName),
                onChanged: (val) {
                  createNewUserDto.fullName = val;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User FullName',
                    hintText: 'Enter valid user fullName'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginDemo()));
              },
              child: Text(
                'Login',
                style: const TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  save();
                },
                child: Text(
                  'Register',
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashBoardDemo extends StatefulWidget {
  const DashBoardDemo({super.key});

  @override
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DashBoardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ));
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://avatars.githubusercontent.com/u/1252111?v=4',
            ),
          ),
        ),
      ),
    );
  }
}
