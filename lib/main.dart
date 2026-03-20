import 'package:flutter/material.dart';
import 'models/avataaar.dart';
import 'widgets/avatar_form.dart';
import 'widgets/avatar_widget.dart';

void main() {
  runApp(const AvataaarsApp());
}

class AvataaarsApp extends StatelessWidget {
  const AvataaarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avataaars Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF65C9FF),
        useMaterial3: true,
      ),
      home: const AvataaarsPage(),
    );
  }
}

class AvataaarsPage extends StatefulWidget {
  const AvataaarsPage({super.key});

  @override
  State<AvataaarsPage> createState() => _AvataaarsPageState();
}

class _AvataaarsPageState extends State<AvataaarsPage> {
  Avataaar _avatar = Avataaar();

  void _randomize() {
    setState(() {
      _avatar = Avataaar.random();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width > 700;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Avataaars Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle),
            tooltip: 'Random',
            onPressed: _randomize,
          ),
        ],
      ),
      body: isWide ? _buildWideLayout() : _buildNarrowLayout(),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: AvatarWidget(avatar: _avatar, size: 300),
          ),
        ),
        SizedBox(
          width: 380,
          child: AvatarForm(
            avatar: _avatar,
            onChanged: (a) => setState(() => _avatar = a),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: AvatarWidget(avatar: _avatar, size: 200),
          ),
        ),
        Expanded(
          child: AvatarForm(
            avatar: _avatar,
            onChanged: (a) => setState(() => _avatar = a),
          ),
        ),
      ],
    );
  }
}
