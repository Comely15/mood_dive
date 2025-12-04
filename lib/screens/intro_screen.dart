import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import '../services/firebase_service.dart';
import '../services/api_service.dart';
import '../models/image_item.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  final ChatService _chatService = ChatService();
  final ScrollController _scrollController = ScrollController();

  List<ImageItem> _images = [];
  bool _isLoading = true;
  String? _errorMessage;

  // Selection State
  ImageItem? _selectedItem;
  final TextEditingController _chatController = TextEditingController();

  // Chat State
  final List<types.Message> _messages = [];
  final _user = const types.User(id: 'user');
  final _bot = const types.User(id: 'bot', firstName: 'Alter Ego');

  @override
  void initState() {
    super.initState();
    _loadMoodBoard();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _chatController.dispose();
    super.dispose();
  }

  Future<void> _loadMoodBoard() async {
    try {
      print("Loading mood board images...");
      final images = await _firebaseService.getMoodBoardImages();
      print("Loaded ${images.length} images.");
      setState(() {
        _images = images;
        _isLoading = false;
      });
    } catch (e) {
      print("Error loading mood board: $e");
      setState(() {
        _isLoading = false;
        _errorMessage = "무드보드를 불러오는데 실패했습니다.\n$e";
      });
    }
  }

  void _onImageTap(ImageItem item) {
    setState(() {
      _selectedItem = item;
      _messages.clear();
      _addMessage(
        types.TextMessage(
          author: _bot,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text:
              "선택하신 '${item.style}' 스타일, 마음에 드시나요? 더 구체적으로 어떤 느낌을 원하시는지 말씀해주세요.",
        ),
      );
    });

    // Scroll to show details (delayed to allow layout to update)
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _onStyleChipTap(String styleSentence) {
    _chatController.text = styleSentence;
  }

  void _onChatSubmit() {
    if (_selectedItem == null || _chatController.text.trim().isEmpty) return;

    final text = _chatController.text;
    _chatController.clear();

    _handleSendPressed(text);
  }

  void _handleSendPressed(String text) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: text,
    );

    _addMessage(textMessage);

    try {
      final response = await _chatService.sendMessage(
        text,
        _selectedItem!.style,
      );

      final botMessage = types.TextMessage(
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: response,
      );
      _addMessage(botMessage);
    } catch (e) {
      print("Chat Error: $e");
      final errorMessage = types.TextMessage(
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: "죄송합니다. 챗봇 연결에 문제가 발생했습니다. ($e)",
      );
      _addMessage(errorMessage);
    }
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.add(message);
    });

    // Scroll to bottom on new message
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Main Content (Scrollable)
            Expanded(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  : _errorMessage != null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _errorMessage!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _loadMoodBoard,
                            child: const Text("다시 시도"),
                          ),
                        ],
                      ),
                    )
                  : CustomScrollView(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        // Header
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "MOOD BOARD",
                                  style: GoogleFonts.cinzel(
                                    fontSize: 28,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "당신의 무드를 선택하세요",
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withValues(alpha: 0.7),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Grid Section
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          sliver: SliverMasonryGrid.count(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childCount: _images.length,
                            itemBuilder: (context, index) {
                              final item = _images[index];
                              final isSelected = _selectedItem?.id == item.id;
                              return GestureDetector(
                                onTap: () => _onImageTap(item),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                    border: isSelected
                                        ? Border.all(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                            width: 3,
                                          )
                                        : null,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(9),
                                    child: CachedNetworkImage(
                                      imageUrl: item.url,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Container(color: Colors.grey[200]),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                            color: Colors.grey[300],
                                            child: const Icon(Icons.error),
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        // Selected Image & Options Section
                        if (_selectedItem != null)
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(height: 32),
                                  // Selected Image Preview
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        imageUrl: _selectedItem!.url,
                                        height: 300,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  // Style Sentences (Chips)
                                  Text(
                                    "어떤 스타일을 원하시나요?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 12),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      _buildStyleChip("더 모던하고 깔끔하게"),
                                      _buildStyleChip("빈티지한 감성을 더해서"),
                                      _buildStyleChip("화려하고 힙하게"),
                                      _buildStyleChip("편안한 데일리룩으로"),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  const Divider(),
                                ],
                              ),
                            ),
                          ),

                        // Chat Messages List
                        if (_selectedItem != null)
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate((
                                context,
                                index,
                              ) {
                                final message =
                                    _messages[index] as types.TextMessage;
                                final isUser = message.author.id == _user.id;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    mainAxisAlignment: isUser
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (!isUser) ...[
                                        CircleAvatar(
                                          backgroundColor: Theme.of(
                                            context,
                                          ).colorScheme.primaryContainer,
                                          child: Text(
                                            "AI",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onPrimaryContainer,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                      Flexible(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isUser
                                                ? Theme.of(
                                                    context,
                                                  ).colorScheme.primary
                                                : Theme.of(context)
                                                      .colorScheme
                                                      .surfaceContainerHighest,
                                            borderRadius:
                                                BorderRadius.circular(
                                                  20,
                                                ).copyWith(
                                                  topLeft: isUser
                                                      ? const Radius.circular(
                                                          20,
                                                        )
                                                      : const Radius.circular(
                                                          4,
                                                        ),
                                                  topRight: isUser
                                                      ? const Radius.circular(4)
                                                      : const Radius.circular(
                                                          20,
                                                        ),
                                                ),
                                          ),
                                          child: Text(
                                            message.text,
                                            style: TextStyle(
                                              color: isUser
                                                  ? Theme.of(
                                                      context,
                                                    ).colorScheme.onPrimary
                                                  : Theme.of(
                                                      context,
                                                    ).colorScheme.onSurface,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }, childCount: _messages.length),
                            ),
                          ),

                        // Bottom Padding for Input
                        const SliverToBoxAdapter(child: SizedBox(height: 20)),
                      ],
                    ),
            ),

            // Chat Input (Fixed at bottom)
            if (_selectedItem != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.outline.withValues(alpha: 0.3),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _chatController,
                          decoration: const InputDecoration(
                            hintText: "원하는 스타일을 설명해주세요...",
                            border: InputBorder.none,
                          ),
                          onSubmitted: (_) => _onChatSubmit(),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_upward_rounded),
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: _onChatSubmit,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStyleChip(String label) {
    return ActionChip(
      label: Text(label),
      onPressed: () => _onStyleChipTap(label),
      backgroundColor: Theme.of(context).colorScheme.surface,
      side: BorderSide(
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
