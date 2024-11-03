import 'dart:js' as js;

void runJavaScript(String functionName, String args) {
  js.context.callMethod('playSound', [args]);
}
