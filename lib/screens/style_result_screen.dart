import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/style_result.dart';
import '../widgets/score_chart.dart';

class StyleResultScreen extends StatelessWidget {
  const StyleResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX로 전달받은 결과 데이터
    final StyleResult result = Get.arguments as StyleResult;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 앱바
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  result.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.checkroom_rounded,
                      size: 80,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ),

            // 내용
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 설명
                    Text(
                      result.description,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            height: 1.5,
                          ),
                    ),
                    const SizedBox(height: 24),

                    // 상세 설명
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        result.detailDescription,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1.6,
                            ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // 스타일 점수
                    Text(
                      '스타일 분석',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 16),

                    ScoreChart(
                      label: '색상',
                      leftLabel: '웜톤',
                      rightLabel: '쿨톤',
                      score: result.colorScore,
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 20),

                    ScoreChart(
                      label: '실루엣',
                      leftLabel: '타이트',
                      rightLabel: '루즈',
                      score: result.silhouetteScore,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 20),

                    ScoreChart(
                      label: '분위기',
                      leftLabel: '캐주얼',
                      rightLabel: '포멀',
                      score: result.vibeScore,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 20),

                    ScoreChart(
                      label: '무드',
                      leftLabel: '트렌디',
                      rightLabel: '미니멀',
                      score: result.moodScore,
                      color: Colors.purple,
                    ),
                    const SizedBox(height: 32),

                    // 추천 색상
                    Text(
                      '추천 색상',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: result.colors
                          .map(
                            (color) => Chip(
                              label: Text(color),
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 24),

                    // 핵심 키워드
                    Text(
                      '핵심 아이템',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: result.keywords
                          .map(
                            (keyword) => Chip(
                              label: Text(keyword),
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 32),

                    // 다음 단계 버튼
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/outfit-gallery', arguments: result);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          '코디 갤러리 보기',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // 진단 다시 하기
                          Get.back();
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          '진단 다시 하기',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
}
