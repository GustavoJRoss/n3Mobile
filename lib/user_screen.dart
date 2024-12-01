import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserScreen extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: user == null
            ? const Text('Usuário não autenticado')
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL ?? ''),
              radius: 40,
            ),
            const SizedBox(height: 10),
            Text(user!.displayName ?? 'Nome não disponível'),
            const SizedBox(height: 5),
            Text(user!.email ?? 'Email não disponível'),
          ],
        ),
      ),
    );
  }
}
