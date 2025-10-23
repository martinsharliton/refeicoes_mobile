import 'package:flutter/material.dart';

import '../categoria/categoria_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const CategoriaPage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Color(0xFFF1E3D6)),
          child: Center(
            child: FadeTransition(
              opacity: _animation,
              child: Image.asset('assets/images/mae.jpg', fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
