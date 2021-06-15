import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'Home Page',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildBody() {
    return const Center(
      child: Text(
        'Login successfully ..!',
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }
}
