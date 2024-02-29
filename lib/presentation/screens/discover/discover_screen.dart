import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
// No puede ser constante porque no puede ser determinado
// en el momento de construcción
    return Scaffold(
      body: (discoverProvider.initialLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : VideoScrollableView(
              videos: discoverProvider.videos,
            ),
    );
  }
}
