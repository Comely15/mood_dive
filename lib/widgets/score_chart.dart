import 'package:flutter/material.dart';

class ScoreChart extends StatelessWidget {
  final String label;
  final String leftLabel;
  final String rightLabel;
  final int score; // 0-10
  final Color color;

  const ScoreChart({
    super.key,
    required this.label,
    required this.leftLabel,
    required this.rightLabel,
    required this.score,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final normalizedScore = (score / 10).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 라벨
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),

        // 바 차트
        Stack(
          children: [
            // 배경 바
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            // 점수 바
            FractionallySizedBox(
              widthFactor: normalizedScore,
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.7),
                      color,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            // 점수 텍스트
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    '$score/10',
                    style: TextStyle(
                      color: normalizedScore > 0.5
                          ? Colors.white
                          : Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),

        // 왼쪽/오른쪽 라벨
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leftLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            Text(
              rightLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
