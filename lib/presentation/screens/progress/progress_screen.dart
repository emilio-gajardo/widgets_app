import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prorgess Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('Circular progress indicators', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black12),

          SizedBox(height: 20),
          Text('Circular and Linear progress indicators controlado', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _ControlProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlProgressIndicator extends StatelessWidget {
  const _ControlProgressIndicator();

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1), (value) {
          return (value) / 10;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12,),
              const SizedBox(width: 20,),
              Expanded(child: LinearProgressIndicator(value: progressValue,))
            ],
          ),
        );
      }
    );
  }
}