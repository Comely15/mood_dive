import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../services/firebase_service.dart';
import '../models/image_item.dart';

class MoodDivingScreen extends StatefulWidget {
  final String mode;
  const MoodDivingScreen({super.key, required this.mode});

  @override
  State<MoodDivingScreen> createState() => _MoodDivingScreenState();
}

class _MoodDivingScreenState extends State<MoodDivingScreen>
    with TickerProviderStateMixin {
  final FirebaseService _firebaseService = FirebaseService();
  List<ImageItem> _images = [];
  bool _isLoading = true;

  // Animation related
  late AnimationController _zoomController;
  late Animation<double> _zoomAnimation;
  ImageItem? _selectedItem;

  @override
  void initState() {
    super.initState();
    _zoomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _zoomAnimation = Tween<double>(begin: 1.0, end: 15.0).animate(
      CurvedAnimation(parent: _zoomController, curve: Curves.easeInOutExpo),
    );

    _loadInitialImages();
  }

  @override
  void dispose() {
    _zoomController.dispose();
    super.dispose();
  }

  String? _errorMessage;

  Future<void> _loadInitialImages() async {
    try {
      // Ignoring mode for now as we moved to Firebase and didn't implement mode query yet.
      // Just getting some images to start diving.
      final images = await _firebaseService.getMoodBoardImages();
      setState(() {
        _images = images;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      print("Error loading initial images: $e");
      setState(() {
        _isLoading = false;
        _errorMessage =
            "Failed to load images. Please check your connection.\nError: $e";
      });
    }
  }

  Future<void> _handleImageTap(ImageItem item) async {
    setState(() {
      _selectedItem = item;
    });

    // Start zoom animation
    await _zoomController.forward();

    // Fetch new images while zooming (or after)
    try {
      final newImages = await _firebaseService.dive(item.id);

      // Reset animation and update images
      _zoomController.reset();
      setState(() {
        _images = newImages;
        _selectedItem = null;
        _errorMessage = null; // Clear error message on successful dive
      });
    } catch (e) {
      print("Error diving: $e");
      _zoomController.reverse();
      setState(() {
        _selectedItem = null;
        _errorMessage =
            "Failed to dive deeper. Please try again.\nError: $e"; // Set error message on dive failure
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _isLoading
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
                    onPressed: () {
                      setState(() => _isLoading = true);
                      _loadInitialImages();
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                // Main Grid
                AnimatedBuilder(
                  animation: _zoomController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _zoomAnimation.value,
                      alignment: _selectedItem != null
                          ? Alignment.center
                          : Alignment.center,
                      // Ideally alignment should be based on the tapped item position,
                      // but for MVP center zoom is a simple "diving" effect.
                      child: Opacity(
                        opacity:
                            1.0 -
                            (_zoomController.value * 0.5), // Fade out slightly
                        child: child,
                      ),
                    );
                  },
                  child: MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: _images.length,
                    itemBuilder: (context, index) {
                      final item = _images[index];
                      return GestureDetector(
                        onTap: () => _handleImageTap(item),
                        onLongPress: () {
                          context.push('/chat', extra: {'item': item});
                        },
                        child: Hero(
                          tag: item.id,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: item.url,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surfaceContainerHighest,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              if (item.isTwist)
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      "TWIST",
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onError,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Overlay for "Diving..." effect if needed
                if (_zoomController.isAnimating)
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor.withValues(
                      alpha: _zoomController.value * 0.8,
                    ),
                    child: Center(
                      child: Text(
                        "Diving Deeper...",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
