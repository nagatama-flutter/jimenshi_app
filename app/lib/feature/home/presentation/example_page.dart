import 'package:app/data/serverpod_client.dart';
import 'package:app/feature/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:client/sample_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ExamplePage extends ConsumerStatefulWidget {
  const ExamplePage({super.key});

  @override
  MyExamplePageState createState() => MyExamplePageState();
}

class MyExamplePageState extends ConsumerState<ExamplePage> {
  // These fields hold the last result or error message that we've received from
  // the server or null if no result exists yet.
  String? _resultMessage;
  String? _errorMessage;

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Serverpod Example'),
            ),
            ListTile(
              title: const Text('サインアウト'),
              titleTextStyle: const TextStyle(color: Colors.red),
              onTap: () {
                ref.read(signOutControllerProvider(context)).signOut();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: _callHello,
                child: const Text('Send to Server'),
              ),
            ),
            _ResultDisplay(
              resultMessage: _resultMessage,
              errorMessage: _errorMessage,
            ),
          ],
        ),
      ),
    );
  }

  // Calls the `hello` method of the `example` endpoint. Will set either the
  // `_resultMessage` or `_errorMessage` field, depending on if the call
  // is successful.
  void _callHello() async {
    try {
      final result = await ref
          .read(serverpodClientProvider)
          .example
          .hello(_textEditingController.text);

      setState(() {
        _errorMessage = null;
        _resultMessage = result;
      });
    } on InvalidArgument catch (_) {
      setState(() {
        _errorMessage = 'Invalid argument: please enter a name';
      });
    } catch (e) {
      setState(() {
        _errorMessage = '${e.runtimeType}: $e';
      });
    }
  }
}

// _ResultDisplays shows the result of the call. Either the returned result from
// the `example.hello` endpoint method or an error message.
class _ResultDisplay extends StatelessWidget {
  final String? resultMessage;
  final String? errorMessage;

  const _ResultDisplay({
    this.resultMessage,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    String text;
    Color backgroundColor;
    if (errorMessage != null) {
      backgroundColor = Colors.red[300]!;
      text = errorMessage!;
    } else if (resultMessage != null) {
      backgroundColor = Colors.green[300]!;
      text = resultMessage!;
    } else {
      backgroundColor = Colors.grey[300]!;
      text = 'No server response yet.';
    }

    return Container(
      height: 50,
      color: backgroundColor,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
