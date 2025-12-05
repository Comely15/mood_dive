import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants/questions.dart';
import '../models/question.dart';
import '../widgets/question_card.dart';
import '../services/style_calculator.dart';

class StyleDiagnosisScreen extends StatefulWidget {
  const StyleDiagnosisScreen({super.key});

  @override
  State<StyleDiagnosisScreen> createState() => _StyleDiagnosisScreenState();
}

class _StyleDiagnosisScreenState extends State<StyleDiagnosisScreen> {
  int currentQuestionIndex = 0;
  final Map<int, QuestionOption> selectedAnswers = {};
  final PageController _pageController = PageController();

  Question get currentQuestion => diagnosticQuestions[currentQuestionIndex];
  bool get isLastQuestion =>
      currentQuestionIndex == diagnosticQuestions.length - 1;
  bool get hasSelectedAnswer =>
      selectedAnswers.containsKey(currentQuestionIndex);

  void selectAnswer(QuestionOption option) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = option;
    });
  }

  void goToNextQuestion() {
    if (isLastQuestion) {
      // 진단 완료 - 결과 계산
      _calculateAndNavigateToResult();
    } else {
      setState(() {
        currentQuestionIndex++;
      });
      _pageController.animateToPage(
        currentQuestionIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
      _pageController.animateToPage(
        currentQuestionIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _calculateAndNavigateToResult() {
    final styleCalculator = StyleCalculator();
    final result = styleCalculator.calculateStyle(selectedAnswers);

    // 결과 화면으로 이동 (GetX 사용)
    Get.toNamed('/result', arguments: result);
  }

  @override
  Widget build(BuildContext context) {
    final progress = (currentQuestionIndex + 1) / diagnosticQuestions.length;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('스타일 진단'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 진행 바
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${currentQuestionIndex + 1}/${diagnosticQuestions.length}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 질문 텍스트
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                currentQuestion.text,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),

            // 페이지 인디케이터
            SmoothPageIndicator(
              controller: _pageController,
              count: diagnosticQuestions.length,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotColor: Colors.grey[300]!,
              ),
            ),

            const SizedBox(height: 24),

            // 선택지 (PageView)
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: diagnosticQuestions.length,
                onPageChanged: (index) {
                  setState(() {
                    currentQuestionIndex = index;
                  });
                },
                itemBuilder: (context, questionIndex) {
                  final question = diagnosticQuestions[questionIndex];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: question.options.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, optionIndex) {
                        final option = question.options[optionIndex];
                        final isSelected =
                            selectedAnswers[questionIndex]?.id == option.id;

                        return QuestionCard(
                          option: option,
                          isSelected: isSelected,
                          onTap: () => selectAnswer(option),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            // 다음 버튼
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  if (currentQuestionIndex > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: goToPreviousQuestion,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('이전'),
                      ),
                    ),
                  if (currentQuestionIndex > 0) const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: hasSelectedAnswer ? goToNextQuestion : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        isLastQuestion ? '결과 보기' : '다음',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
