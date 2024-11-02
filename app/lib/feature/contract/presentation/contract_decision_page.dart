import 'package:app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ContractDecisionPage extends StatelessWidget {
  const ContractDecisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text("ContractDecisionPage"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  child: const Text("承認"),
                  onPressed: () {
                    context.router.push(const ContractResultSuccessRoute());
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    context.router.push(const ContractResultFailureRoute());
                  },
                  child: const Text("否認"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
