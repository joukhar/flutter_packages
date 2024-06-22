import 'package:flutter/material.dart';
import 'package:rounded_avatar/rounded_avatar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Demo(),
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            runSpacing: 20.0,
            spacing: 20.0,
            children: [
              // basic usage
              const RoundedAvatar(
                'images/avatar.jpeg',
                width: 100,
                height: 100,
                borderColor: Colors.pink,
                borderWidth: 2,
              ),

              // with svg
              RoundedAvatar(
                'images/avatar.svg',
                width: 100,
                height: 100,
                isSvg: true,
                borderRadius: BorderRadius.circular(15),
                placeholder: const Center(child: Icon(Icons.error, color: Colors.red, size: 50)),
              ),

              // with raw svg
              const RoundedAvatar(
                '<svg viewBox="0 0 36 36" fill="none" role="img" xmlns="http://www.w3.org/2000/svg" width="80" height="80"><mask id=":r7:" maskUnits="userSpaceOnUse" x="0" y="0" width="36" height="36"><rect width="36" height="36" rx="72" fill="#FFFFFF"></rect></mask><g mask="url(#:r7:)"><rect width="36" height="36" fill="#ff005b"></rect><rect x="0" y="0" width="36" height="36" transform="translate(0 0) rotate(324 18 18) scale(1)" fill="#ffb238" rx="36"></rect><g transform="translate(-4 -4) rotate(-4 18 18)"><path d="M15 19c2 1 4 1 6 0" stroke="#000000" fill="none" stroke-linecap="round"></path><rect x="10" y="14" width="1.5" height="2" rx="1" stroke="none" fill="#000000"></rect><rect x="24" y="14" width="1.5" height="2" rx="1" stroke="none" fill="#000000"></rect></g></g></svg>',
                width: 100,
                height: 100,
                isSvg: true,
                placeholder: CircularProgressIndicator(),
              ),

              // with Custom Placeholder
              RoundedAvatar(
                'https://avatars.githubusercontent.com/u/94228259?v=4',
                width: 100,
                height: 100,
                borderRadius: BorderRadius.circular(50),
                placeholder: const Center(child: Icon(Icons.error, color: Colors.red, size: 50)),
              ),

              // Online SVG with HTTP Headers
              RoundedAvatar(
                'https://api.iconify.design/skill-icons:flutter-dark.svg',
                width: 100,
                height: 100,
                borderRadius: BorderRadius.circular(50),
                isSvg: true,
                httpHeaders: const {'Authorization': 'Bearer your_token_here'},
                placeholder: const Center(child: Icon(Icons.error, color: Colors.red, size: 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
