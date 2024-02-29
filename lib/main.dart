import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infraestructure/datasources/local_videos_datasource_imp.dart';
import 'package:toktik/infraestructure/repositories/video_post_repository_imp.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';

import 'presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostRepositoryImp(
      videoPostDatasource: LocalVideosDatasourceImp(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DiscoverProvider(
            videoPostRespository: videoPostRepository,
          )..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'TokTik',
        home: const DiscoverScreen(),
      ),
    );
  }
}
