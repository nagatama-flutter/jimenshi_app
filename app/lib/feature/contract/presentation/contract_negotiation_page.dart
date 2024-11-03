import 'package:app/feature/contract/controller.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:app/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:app/feature/contract/presentation/widget/message_bubble.dart';
import 'package:app/feature/generative_ai/state.dart';
import 'package:app/feature/generative_ai/domain.dart';
import 'package:app/feature/generative_ai/controller.dart';

@RoutePage()
class ContractNegotiationPage extends HookConsumerWidget {
  final int conversationId;

  const ContractNegotiationPage({super.key, required this.conversationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messageListProvider(conversationId));
    final isDisplayingCutIn =
        ref.watch(isDisplayingCutInProvider(conversationId));

    final scrollController = useScrollController();
    final focusNode = useFocusNode();
    final textEditingController = useTextEditingController();
    // VideoPlayerControllerの初期化
    final videoController = useMemoized(() {
      final controller = VideoPlayerController.asset(
        Assets.videos.simazakiNormal,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      controller.initialize().then((_) {
        controller
          ..setLooping(false)
          ..setVolume(0.0)
          ..pause();
      });
      return controller;
    });

    // VideoPlayerControllerの破棄
    useEffect(() {
      return () {
        videoController.dispose();
      };
    }, [videoController]);

    useListenable(videoController);

    ref.listen(isDisplayingCutInProvider(conversationId), (_, __) {
      focusNode.unfocus();
    });

    ref.listen(audioFileProvider(conversationId), (_, audioFile) async {
      if (audioFile.isNotEmpty) {
        await ref.read(audioPlayControllerProvider).play(
          audioFile,
          onPlay: () {
            if (context.mounted) {
              videoController.play();
            }
          },
          onPlayEnd: () {
            if (context.mounted) {
              videoController.pause();
            }
          },
        );
      }
    });

    ref.listen(messageListProvider(conversationId), (_, __) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 750),
            curve: Curves.easeOutCirc,
          );
        }
      });
    });

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // 背景動画
                    Positioned.fill(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: videoController.value.size.width,
                          height: videoController.value.size.height,
                          child: VideoPlayer(videoController),
                        ),
                      ),
                    ),
                    messages.maybeWhen(
                      data: (messages) {
                        if (messages.isEmpty) {
                          return const SizedBox.shrink();
                        }

                        final displayMessages = messages.reversed.toList();

                        return Positioned.fill(
                          left: 16,
                          child: ListView.separated(
                            controller: scrollController,
                            padding: const EdgeInsets.only(bottom: 12),
                            reverse: true,
                            itemBuilder: (context, index) {
                              final message = displayMessages[index];

                              return MessageBubble(
                                isMine: switch (message) {
                                  InputMessage() => true,
                                  GeneratedMessage() => false,
                                },
                                message: message.content,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemCount: messages.length,
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              SafeArea(
                top: false,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: Row(
                    children: [
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 160),
                          child: TextFormField(
                            controller: textEditingController,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            focusNode: focusNode,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            onTapOutside: (event) => focusNode.unfocus(),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          focusNode.unfocus();
                          if (textEditingController.text.isEmpty) {
                            return;
                          }

                          await ref
                              .read(postMessageControllerProvider)
                              .postMessage(conversationId,
                                  textEditingController.text, null);

                          if (context.mounted) {
                            textEditingController.clear();
                          }
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (isDisplayingCutIn)
            Positioned.fill(
              child: Stack(
                children: [
                  const Positioned.fill(
                    child: _CutInContainer(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "もうええでしょ！！！！",
                        style: Theme.of(context)
                            .textTheme
                            .text32Semibold
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: FilledButton(
                          onPressed: () {
                            context.router.push(const ContractDecisionRoute());
                          },
                          child: const Text("つぎへ"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _CutInContainer extends HookWidget {
  const _CutInContainer();

  @override
  Widget build(BuildContext context) {
    // VideoPlayerControllerの初期化
    final videoController = useMemoized(() {
      final controller = VideoPlayerController.asset(
        Assets.videos.cutIn,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      controller.initialize().then((_) {
        controller
          ..setLooping(false)
          ..setVolume(1.0)
          ..play();
      });
      return controller;
    });

    // VideoPlayerControllerの破棄
    useEffect(() {
      return () {
        videoController.dispose();
      };
    }, [videoController]);

    return SizedBox(
      width: videoController.value.size.width,
      height: videoController.value.size.height,
      child: VideoPlayer(videoController),
    );
  }
}
