import '../models/shopping_tip.dart';
import './brands.dart';

// 상황별 쇼핑 팁 데이터
final List<ShoppingTip> shoppingTipsData = [
  ShoppingTip(
    situation: '백화점에서 팬츠를 고를 때',
    checklist: [
      '앉아서 움직여보기 (허리와 허벅지 여유 확인)',
      '신발 신고 길이 확인하기',
      '거울로 옆모습과 뒷모습 체크',
      '세탁 방법 확인 (드라이클리닝 여부)',
    ],
    brands: brandsByCategory['pants']!,
    warnings: [
      '너무 타이트한 허리는 하루 종일 불편해요',
      '트렌드만 쫓지 말고 본인 체형에 맞는 핏 선택',
    ],
  ),
  ShoppingTip(
    situation: '온라인에서 상의를 살 때',
    checklist: [
      '어깨 너비 측정 필수 (가장 중요!)',
      '소재 확인 (면/폴리 비율)',
      '리뷰 사진 확인하기',
      '교환/반품 정책 체크',
    ],
    brands: brandsByCategory['top']!,
    warnings: [
      '사이즈표는 참고일 뿐, 리뷰가 더 정확해요',
      '세일 상품은 교환/반품 불가인 경우 많음',
    ],
  ),
  ShoppingTip(
    situation: '신발 매장에서 구매할 때',
    checklist: [
      '오후에 방문하기 (발이 부은 상태로 테스트)',
      '양말 신고 신어보기',
      '매장 안에서 5분 이상 걸어보기',
      '발등과 뒤꿈치 편안한지 확인',
    ],
    brands: brandsByCategory['shoes']!,
    warnings: [
      '예쁘다고 작은 사이즈는 절대 금물',
      '가죽은 늘어나지만 발볼은 안 늘어나요',
    ],
  ),
  ShoppingTip(
    situation: '악세서리 쇼핑 시',
    checklist: [
      '본인 색상(웜/쿨톤)에 맞는 금속 선택',
      '사이즈보다 비율이 중요 (얼굴 크기 대비)',
      '평소 착용할 옷과 매치해보기',
      '무게감 확인 (귀걸이는 특히 중요)',
    ],
    brands: brandsByCategory['accessory']!,
    warnings: [
      '트렌디한 디자인보다 오래 쓸 수 있는 베이직',
      '알레르기 체질은 소재 꼭 확인',
    ],
  ),
];
