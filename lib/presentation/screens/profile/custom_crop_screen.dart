import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/common/glass_card.dart';

class CustomCropScreen extends StatefulWidget {
  final File imageFile;

  const CustomCropScreen({super.key, required this.imageFile});

  @override
  State<CustomCropScreen> createState() => _CustomCropScreenState();
}

class _CustomCropScreenState extends State<CustomCropScreen> {
  final TransformationController _transformationController = TransformationController();
  final GlobalKey _cropKey = GlobalKey();
  bool _isProcessing = false;

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  Future<void> _processCrop() async {
    if (_isProcessing) return;
    
    setState(() => _isProcessing = true);
    
    // Slight delay to allow UI to update (show loading spinner)
    await Future.delayed(const Duration(milliseconds: 100));

    try {
      final context = _cropKey.currentContext;
      if (context == null) throw Exception('Crop context is null');

      final boundary = context.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) throw Exception('RenderRepaintBoundary is null');

      // Capture high-res image of the cropped area
      final ui.Image image = await boundary.toImage(pixelRatio: 3.0); 
      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      
      if (byteData == null) throw Exception('Failed to get byte data');
      
      final Uint8List pngBytes = byteData.buffer.asUint8List();

      // Save to temporary file
      final tempDir = Directory.systemTemp;
      final fileName = 'cropped_${DateTime.now().millisecondsSinceEpoch}.png';
      final File croppedFile = File('${tempDir.path}/$fileName');
      
      await croppedFile.writeAsBytes(pngBytes);
      
      debugPrint('Cropped image saved to: ${croppedFile.path}');

      if (mounted) {
        Navigator.pop(context, croppedFile);
      }
    } catch (e) {
      debugPrint('Crop error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text('Could not crop image: $e'),
             backgroundColor: AppColors.primaryRed,
           ),
        );
      }
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    const double cropSize = 350;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. The Image inside interactive viewer
          // We center it properly
          Center(
            child: Container(
              height: cropSize,
              width: cropSize,
              decoration: BoxDecoration(
                // Show a subtle border for the crop area
                border: Border.all(color: Colors.white24, width: 1),
              ),
              child: RepaintBoundary(
                key: _cropKey,
                child: ClipRect(
                  child: InteractiveViewer(
                    transformationController: _transformationController,
                    minScale: 0.5,
                    maxScale: 4.0,
                    boundaryMargin: const EdgeInsets.all(200),
                    child: Image.file(
                      widget.imageFile,
                      fit: BoxFit.contain, // Start contained
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 2. The Dark Overlay with a "Hole"
          // We use ColorFiltered to punch a hole
          IgnorePointer(
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.black45, // Dim color
                BlendMode.srcOut, // Punch out the destination (the circle below)
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                   // The "Source" - fills the screen with transparent color
                   // Wait, srcOut shows Source where Destination is NOT.
                   // So Source needs to be the dim color.
                   Container(
                     decoration: const BoxDecoration(
                       color: Colors.black,
                       backgroundBlendMode: BlendMode.dstOut, // This is tricky
                     ),
                   ),
                   // Actually easier: use a PathClipper or just a giant container with a hole
                   // but `ColorFiltered` with black background and `dstOut` works if set up right.
                   
                   // Let's go with the simpler approach:
                   // A full screen container with color, and a hole punched?
                   // No, ColorFiltered mode `srcOut` -> Shows Source where Destination alpha is 0.
                   
                   Align(
                     alignment: Alignment.center,
                     child: Container(
                       height: cropSize,
                       width: cropSize,
                       decoration: const BoxDecoration(
                         color: Colors.red, // Destination (to be punched out)
                         shape: BoxShape.circle,
                       ),
                     ),
                   ),
                ],
              ),
            ),
          ),
          
          // 3. Grid Lines Overlay (Optional, for "Framing" feel)
          IgnorePointer(
            child: Center(
              child: Container(
                height: cropSize,
                width: cropSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
              ),
            ),
          ),

          // 4. Top Bar (Back Button) overrides overlay
          Positioned(
            top: MediaQuery.paddingOf(context).top + 10,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
              ),
            ),
          ),

          // 5. Instruction Text
           Positioned(
            top: MediaQuery.sizeOf(context).height * 0.15,
            left: 0, 
            right: 0,
            child: const Center(
              child: Text(
                "Pinch to Zoom & Move",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                ),
              ),
            ),
          ),

          // 6. Bottom Controls
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 60,
            left: 20,
            right: 20,
            child: GlassCard(
              borderRadius: 30,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Cancel
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(LucideIcons.x, color: Colors.white, size: 32),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white10,
                      padding: const EdgeInsets.all(12),
                    ),
                  ),

                  // Divider
                  Container(width: 1, height: 40, color: Colors.white24),

                  // Save / Check
                  IconButton(
                    onPressed: _isProcessing ? null : _processCrop,
                    icon: _isProcessing
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                          )
                        : const Icon(LucideIcons.check, color: AppColors.neonGreen, size: 32),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white10,
                      padding: const EdgeInsets.all(12),
                    ),
                  ),
                ],
              ),
            ).animate().slideY(begin: 1, end: 0, duration: 500.ms, curve: Curves.easeOutBack),
          ),
        ],
      ),
    );
  }
}
