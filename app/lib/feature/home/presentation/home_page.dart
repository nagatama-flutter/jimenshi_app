import 'dart:io';
import 'package:app/feature/auth.dart';
import 'package:app/feature/generative_ai/controller/post_message_controller.dart';
import 'package:app/feature/generative_ai/presentation/widget/message_list.dart';
import 'package:app/feature/generative_ai/state/conversation_list_notifier.dart';
import 'package:app/feature/generative_ai/state/current_conversation_id_notifier.dart';
import 'package:app/feature/image/image_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversationsList = ref.watch(conversationListProvider);
    final conversationId = ref.watch(currentConversationIdProvider);

    final textController = useTextEditingController();
    final imageService = ImageService();
    final imageFile = useState<XFile?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: conversationsList.when(
                  data: (data) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('ConversationID ${data[index].id}'),
                          onTap: () {
                            final id = data[index].id;
                            if (id != null) {
                              ref
                                  .read(currentConversationIdProvider.notifier)
                                  .update(id);
                            }
                          },
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 5),
                      itemCount: data.length,
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(
                      'Error: $error',
                      style: const TextStyle(color: Colors.red),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'サインアウト',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  ref.read(signOutControllerProvider(context)).signOut();
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: conversationId != null
                ? MessageList(conversationId)
                : const Center(
                    child: Text('はじめてのメッセージを送信しよう'),
                  ),
          ),
          const Divider(height: 1),
          if (imageFile.value != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 150,
                child: Image.file(
                  File(imageFile.value!.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.image),
                    onPressed: () => _showImageSourceActionSheet(
                        context, imageFile, imageService),
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 160),
                      child: TextFormField(
                        maxLines: null,
                        controller: textController,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Send a message',
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () async {
                      if (textController.text.isEmpty &&
                          imageFile.value == null) {
                        return;
                      }

                      // テキストと画像ファイルを送信する処理
                      final imageFileToSend = imageFile.value != null
                          ? File(imageFile.value!.path)
                          : null;
                      await ref
                          .read(postMessageControllerProvider)
                          .postMessage(
                              textController.text, imageFileToSend);

                      if (!context.mounted) {
                        return;
                      }

                      textController.clear();
                      imageFile.value = null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 画像ソースを選択するためのメソッド
  void _showImageSourceActionSheet(BuildContext context,
      ValueNotifier<XFile?> imageFile, ImageService imageService) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('ギャラリー'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile =
                      await imageService.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    imageFile.value = pickedFile;
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('カメラから撮影'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile =
                      await imageService.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    imageFile.value = pickedFile;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
