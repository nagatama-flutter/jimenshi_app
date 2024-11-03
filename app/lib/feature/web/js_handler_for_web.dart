import 'dart:js' as js;

void runJavaScript(String functionName, String args) {
  js.context.callMethod('playSound', [
    'https://3amme6o6czeibh533ognbtng440hlxny.lambda-url.us-west-2.on.aws/01ea4887-4c96-47ba-b367-6325f1c3bb3e.mp3?key=01ea4887-4c96-47ba-b367-6325f1c3bb3e.mp3'
  ]);
}
