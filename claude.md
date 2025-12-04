# Mood Dive Project Summary

## Overview
**Mood Dive** is a fashion exploration app that helps users discover their style through a visual "Mood Board" and an AI Chatbot.

## Architecture
- **Frontend**: Flutter (Mobile/Web)
- **Backend (Data)**: Firebase (Firestore) for image data and user preferences.
- **Backend (AI)**: Python (FastAPI) for the Chatbot logic (`/chat` endpoint).

## Recent Changes
1. **Refactoring**: Switched from Python-only backend to **Firebase** for data.
2. **IntroScreen Redesign**: Implemented a Perplexity-inspired "Mood Board" with split layout (Grid + Selected Image + Style Chips + Chat Input).
3. **Chatbot Integration**: Connected the Flutter app to the Python `/chat` endpoint.
4. **Localization**: UI translated to Korean.

## Codebase

### Task Progress
```markdown
# Alter Ego Project Tasks

- [x] Project Initialization
    - [x] Create Python backend structure (FastAPI)
    - [ ] Create Flutter frontend structure
- [/] Backend Implementation (Phase 1 & 2)
    - [x] Setup FastAPI app and basic endpoints
    - [x] Implement Mock Vector DB and Image Service
    - [x] Implement Recommendation Logic with "Diversity Parameter" (80% similar, 20% random/twist)
- [x] Frontend Implementation (Phase 1 & 2)
    - [x] Implement Intro Screen (3 Doors)
    - [x] Implement Main Mood Diving Screen (4-split grid)
    - [x] Implement Zoom-in transition effect
- [x] Frontend Implementation (Phase 1 & 2)
    - [x] Implement Intro Screen (3 Doors)
    - [x] Implement Main Mood Diving Screen (4-split grid)
    - [x] Implement Zoom-in transition effect
    - [x] Implement Result/Chat UI skeleton
        - [x] Add flutter_chat_ui dependencies
        - [x] Create ChatScreen
        - [x] Connect MoodDivingScreen to ChatScreen
- [x] Theming and Design Overhaul
    - [x] Create AppColors (BTS Purple)
    - [x] Create LightTheme and DarkTheme files
    - [x] Update main.dart with themes
- [x] Theming and Design Overhaul
    - [x] Create AppColors (BTS Purple)
    - [x] Create LightTheme and DarkTheme files
    - [x] Update main.dart with themes
    - [x] Refactor screens to use Theme.of(context)
- [x] GoRouter Integration and Bug Fix
    - [x] Add go_router dependency
    - [x] Create AppRouter configuration
    - [x] Update main.dart to use MaterialApp.router
    - [x] Refactor navigation in IntroScreen and MoodDivingScreen
    - [x] Fix MoodDivingScreen black screen (add error UI)
- [x] Fashion Mood Board Implementation
    - [x] Backend: Add /mood-board endpoint (9 images)
    - [x] Frontend: Update ApiService
    - [x] Frontend: Replace IntroScreen with 3x3 Mood Board
    - [x] Frontend: Navigate to ChatScreen on tap
- [x] Refactoring to Firebase + Python Chatbot
    - [x] Add firebase_core, cloud_firestore dependencies
    - [x] Create FirebaseService (Firestore logic)
    - [x] Refactor IntroScreen to use FirebaseService
    - [x] Refactor MoodDivingScreen to use FirebaseService
    - [x] Refactor Python: Remove image endpoints, add /chat
    - [x] Connect ChatScreen to Python backend
- [x] IntroScreen Redesign (Perplexity Style)
    - [x] Remove navigation, add selection state
    - [x] Implement Split Layout (Grid + Selected Image + Options + Chat)
    - [x] Translate UI to Korean
    - [x] Add Style Selection Chips
    - [x] Add Chat Input Field
```

### lib/main.dart
```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'router.dart';

import 'theme/light_theme.dart';
import 'theme/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // NOTE: You must run 'flutterfire configure' to generate firebase_options.dart
  // For now, we wrap in try-catch to allow running without config (using mock fallback)
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase not initialized: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Alter Ego',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:
          ThemeMode.system, // Automatically switch based on system setting
      routerConfig: appRouter,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
```

### lib/router.dart
```dart
import 'package:go_router/go_router.dart';
import 'screens/intro_screen.dart';
import 'screens/mood_diving_screen.dart';
import 'screens/chat_screen.dart';
import 'models/image_item.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const IntroScreen()),
    GoRoute(
      path: '/dive/:mode',
      builder: (context, state) {
        final mode = state.pathParameters['mode'] ?? 'safe';
        return MoodDivingScreen(mode: mode);
      },
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final item = extra['item'] as ImageItem;
        final message = extra['message'] as String?;
        return ChatScreen(selectedItem: item, initialMessage: message);
      },
    ),
  ],
);
```

### lib/services/firebase_service.dart
```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/image_item.dart';

class FirebaseService {
  // Singleton pattern
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  // Remove final _firestore = FirebaseFirestore.instance;
  // Access it lazily to avoid crash if Firebase isn't initialized.

  /// Fetches 9 random images for the Mood Board.
  /// In a real app with many images, we might use a random ID approach or a specific 'featured' collection.
  Future<List<ImageItem>> getMoodBoardImages() async {
    try {
      // Check if Firebase is initialized
      if (Firebase.apps.isEmpty) {
        print("Firebase not initialized, using mock data.");
        return _getMockImages();
      }

      final firestore = FirebaseFirestore.instance;
      // For MVP, just get first 9 or random.
      // Firestore doesn't support random natively well.
      // We'll fetch a batch and shuffle client side for now (assuming small dataset).
      final snapshot = await firestore.collection('images').limit(20).get();

      if (snapshot.docs.isEmpty) {
        // Fallback if DB is empty or not connected properly yet
        return _getMockImages();
      }

      List<ImageItem> allImages = snapshot.docs.map((doc) {
        return ImageItem(
          id: doc.id,
          url: doc['url'],
          style: doc['style'],
          description: doc['description'],
        );
      }).toList();

      allImages.shuffle();
      return allImages.take(9).toList();
    } catch (e) {
      print("Firebase Error: $e");
      // Return mock data if Firebase fails (e.g. not configured)
      return _getMockImages();
    }
  }

  /// Fetches recommendations based on the selected image ID.
  /// Implements "Diversity Parameter" client-side for now.
  Future<List<ImageItem>> dive(String selectedId) async {
    try {
      if (Firebase.apps.isEmpty) return _getMockImages().take(4).toList();
      final firestore = FirebaseFirestore.instance;

      // 1. Get the selected image to know its style
      final selectedDoc = await firestore
          .collection('images')
          .doc(selectedId)
          .get();
      if (!selectedDoc.exists) return _getMockImages().take(4).toList();

      final String currentStyle = selectedDoc['style'];

      // 2. Fetch similar images (same style)
      final similarSnapshot = await firestore
          .collection('images')
          .where('style', isEqualTo: currentStyle)
          .where(FieldPath.documentId, isNotEqualTo: selectedId)
          .limit(10)
          .get();

      // 3. Fetch twist images (different style)
      final twistSnapshot = await firestore
          .collection('images')
          .where('style', isNotEqualTo: currentStyle)
          .limit(5)
          .get();

      List<ImageItem> similar = similarSnapshot.docs
          .map(
            (doc) => ImageItem(
              id: doc.id,
              url: doc['url'],
              style: doc['style'],
              description: doc['description'],
            ),
          )
          .toList();

      List<ImageItem> twist = twistSnapshot.docs
          .map(
            (doc) => ImageItem(
              id: doc.id,
              url: doc['url'],
              style: doc['style'],
              description: doc['description'],
              isTwist: true,
            ),
          )
          .toList();

      similar.shuffle();
      twist.shuffle();

      // Take 3 similar and 1 twist
      List<ImageItem> recommendations = [];
      recommendations.addAll(similar.take(3));
      if (twist.isNotEmpty) {
        recommendations.add(twist.first);
      } else if (similar.length > 3) {
        recommendations.add(similar[3]);
      }

      recommendations.shuffle();
      return recommendations;
    } catch (e) {
      print("Firebase Dive Error: $e");
      return _getMockImages().take(4).toList();
    }
  }

  // Mock Data Fallback (Same as Python mock)
  List<ImageItem> _getMockImages() {
    return [
      ImageItem(
        id: "min_1",
        url:
            "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500",
        style: "minimalist",
        description: "Clean white shirt",
      ),
      ImageItem(
        id: "min_2",
        url:
            "https://images.unsplash.com/photo-1434389677669-e08b4cac3105?w=500",
        style: "minimalist",
        description: "Simple beige trousers",
      ),
      ImageItem(
        id: "avg_1",
        url:
            "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500",
        style: "avant_garde",
        description: "Asymmetric dress",
      ),
      ImageItem(
        id: "ret_1",
        url: "https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=500",
        style: "retro",
        description: "Vintage denim jacket",
      ),
      ImageItem(
        id: "str_1",
        url:
            "https://images.unsplash.com/photo-1515347619252-60a6bf4fffce?w=500",
        style: "street",
        description: "Oversized graphic tee",
      ),
      ImageItem(
        id: "avg_2",
        url:
            "https://images.unsplash.com/photo-1509631179647-0177331693ae?w=500",
        style: "avant_garde",
        description: "Metallic jacket",
      ),
      ImageItem(
        id: "ret_2",
        url:
            "https://images.unsplash.com/photo-1485230946086-1d99d529c7c4?w=500",
        style: "retro",
        description: "Polka dot dress",
      ),
      ImageItem(
        id: "min_3",
        url:
            "https://images.unsplash.com/photo-1574634534894-89d7576c8259?w=500",
        style: "minimalist",
        description: "Grey wool coat",
      ),
      ImageItem(
        id: "str_2",
        url: "https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=500",
        style: "street",
        description: "Cargo pants",
      ),
    ];
  }
}
```

### lib/screens/intro_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/firebase_service.dart';
import '../models/image_item.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  List<ImageItem> _images = [];
  bool _isLoading = true;
  String? _errorMessage;

  // Selection State
  ImageItem? _selectedItem;
  final TextEditingController _chatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadMoodBoard();
  }

  Future<void> _loadMoodBoard() async {
    try {
      final images = await _firebaseService.getMoodBoardImages();
      setState(() {
        _images = images;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = "무드보드를 불러오는데 실패했습니다.\n$e";
      });
    }
  }

  void _onImageTap(ImageItem item) {
    setState(() {
      _selectedItem = item;
    });
  }

  void _onStyleChipTap(String styleSentence) {
    // Add sentence to chat input or directly dive?
    // User said "select sentences to choose detailed style".
    // Let's populate the chat input for now, or append to it.
    _chatController.text = styleSentence;
  }

  void _onChatSubmit() {
    if (_selectedItem == null) return;

    context.push(
      '/chat',
      extra: {
        'item': _selectedItem,
        'message': _chatController.text.isNotEmpty
            ? _chatController.text
            : null,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MOOD BOARD",
                    style: GoogleFonts.cinzel(
                      fontSize: 28,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "당신의 무드를 선택하세요",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  : _errorMessage != null
                  ? Center(child: Text(_errorMessage!))
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left/Top: Grid (Always visible, maybe smaller if selected?)
                        // User said "9장 사진 아래에 선택한 1장의 사진이 나오고" -> Vertical layout.
                        // So Grid is Top, Selected is Bottom.
                        Expanded(
                          child: Column(
                            children: [
                              // 1. Grid Section
                              Expanded(
                                flex: _selectedItem == null
                                    ? 3
                                    : 2, // Shrink grid when selected
                                child: MasonryGridView.count(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  itemCount: _images.length,
                                  itemBuilder: (context, index) {
                                    final item = _images[index];
                                    final isSelected =
                                        _selectedItem?.id == item.id;
                                    return GestureDetector(
                                      onTap: () => _onImageTap(item),
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        decoration: BoxDecoration(
                                          border: isSelected
                                              ? Border.all(
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                                  width: 3,
                                                )
                                              : null,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            9,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: item.url,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Container(
                                                  color: Colors.grey[200],
                                                ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // 2. Selected Image & Options Section
                              if (_selectedItem != null) ...[
                                const Divider(height: 1),
                                Expanded(
                                  flex: 3,
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Selected Image Preview (Small or Medium)
                                        Center(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: _selectedItem!.url,
                                              height: 200,
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
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
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

                                        // Chat Input (Perplexity Style)
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surfaceContainerHighest
                                                .withValues(alpha: 0.3),
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .outline
                                                  .withValues(alpha: 0.3),
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
                                                  decoration:
                                                      const InputDecoration(
                                                        hintText:
                                                            "원하는 스타일을 설명해주세요...",
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                  onSubmitted: (_) =>
                                                      _onChatSubmit(),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.arrow_upward_rounded,
                                                ),
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                                onPressed: _onChatSubmit,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
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
```

### lib/screens/chat_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import '../models/image_item.dart';
import '../services/api_service.dart'; // Contains ChatService now

class ChatScreen extends StatefulWidget {
  final ImageItem selectedItem;
  final String? initialMessage;

  const ChatScreen({
    super.key,
    required this.selectedItem,
    this.initialMessage,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatService _chatService = ChatService();
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final _bot = const types.User(id: 'bot', firstName: 'Alter Ego');

  @override
  void initState() {
    super.initState();
    if (widget.initialMessage != null) {
      _handleSendPressed(types.PartialText(text: widget.initialMessage!));
    } else {
      // Default bot greeting if no initial message
      _addMessage(
        types.TextMessage(
          author: _bot,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text:
              "You selected a ${widget.selectedItem.style} look. How can I help you refine it?",
        ),
      );
    }
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    // Call Python Chatbot
    try {
      // We need a service to call the Python API.
      // Since we removed ApiService usage from other screens, we can repurpose it or create a new one.
      // Let's assume we have a ChatService.
      final response = await _chatService.sendMessage(
        message.text,
        widget.selectedItem.style,
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
        text: "Sorry, I'm having trouble connecting to my brain. ($e)",
      );
      _addMessage(errorMessage);
    }
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stylist Chat"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
        theme: DefaultChatTheme(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          inputBackgroundColor: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest,
          primaryColor: Theme.of(context).colorScheme.primary,
          secondaryColor: Theme.of(context).colorScheme.secondary,
          inputTextColor:
              Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black,
          receivedMessageBodyTextStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          sentMessageBodyTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
```

### backend/main.py
```python
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional
import random

app = FastAPI(title="Alter Ego Chatbot API")

# CORS configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins for development
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ChatRequest(BaseModel):
    message: str
    style_context: Optional[str] = None

class ChatResponse(BaseModel):
    response: str

@app.get("/")
async def root():
    return {"message": "Alter Ego Chatbot API is running"}

@app.post("/chat", response_model=ChatResponse)
async def chat(request: ChatRequest):
    """
    Simple mock chatbot that responds based on style context.
    In a real app, this would call OpenAI/Gemini.
    """
    msg = request.message.lower()
    style = request.style_context or "general"
    
    # Mock Logic
    if "hello" in msg or "hi" in msg:
        if style == "minimalist":
            return {"response": "Hello. Less is more. How can I help you simplify your look?"}
        elif style == "avant_garde":
            return {"response": "Greetings. Ready to break some boundaries today?"}
        else:
            return {"response": "Hi there! Ready to dive into your new style?"}
            
    if "recommend" in msg or "style" in msg:
         if style == "minimalist":
            return {"response": "I suggest sticking to neutral tones and clean lines. Maybe a structured white shirt?"}
         elif style == "street":
            return {"response": "How about some oversized cargo pants and a graphic tee?"}
         else:
            return {"response": "I can definitely help with that. What kind of vibe are you feeling?"}

    return {"response": f"That's interesting! Tell me more about what you like in {style} fashion."}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
```
