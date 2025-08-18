import 'package:get/get.dart';

class Campaign {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;
  final bool isPopular;

  Campaign({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
    this.isPopular = false,
  });
}

class HomeController extends GetxController {
  final RxString username = '홍길동님'.obs;
  final RxInt campaignCount = 0.obs;
  final RxInt reviewCount = 0.obs;
  final RxInt pointCount = 0.obs;
  
  final RxList<Campaign> campaigns = <Campaign>[].obs;
  final RxBool isLoading = false.obs;
  final RxInt selectedTabIndex = 0.obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchCampaigns();
  }
  
  void changeTab(int index) {
    selectedTabIndex.value = index;
    fetchCampaigns();
  }
  
  Future<void> fetchCampaigns() async {
    isLoading.value = true;
    
    try {
      // Simulate API call with delay
      await Future.delayed(Duration(milliseconds: 800));
      
      // Mock data based on selected tab
      if (selectedTabIndex.value == 0) { // 전체
        campaigns.value = [
          Campaign(
            id: '1',
            title: '제주도 1박2일 여행',
            description: '제주도의 아름다운 자연과 함께하는 1박 2일 여행 캠페인입니다.',
            imageUrl: 'https://picsum.photos/id/1015/500/300',
            tags: ['여행', '제주도', '1박2일'],
            isPopular: true,
          ),
          Campaign(
            id: '2',
            title: '맛있는 브런치 먹방',
            description: '도심 속 브런치 카페에서 맛있는 음식을 즐기는 캠페인입니다.',
            imageUrl: 'https://picsum.photos/id/292/500/300',
            tags: ['맛집', '브런치', '카페'],
          ),
          Campaign(
            id: '3',
            title: '도심 속 문화생활',
            description: '서울 시내 다양한 문화 공간을 탐방하는 캠페인입니다.',
            imageUrl: 'https://picsum.photos/id/1076/500/300',
            tags: ['문화', '서울', '전시'],
            isPopular: true,
          ),
          Campaign(
            id: '4',
            title: '스포츠 액티비티',
            description: '다양한 스포츠 활동을 체험하는 캠페인입니다.',
            imageUrl: 'https://picsum.photos/id/1058/500/300',
            tags: ['스포츠', '액티비티', '체험'],
          ),
          Campaign(
            id: '5',
            title: '힐링 캠핑',
            description: '자연 속에서 힐링을 느낄 수 있는 캠핑 캠페인입니다.',
            imageUrl: 'https://picsum.photos/id/1061/500/300',
            tags: ['캠핑', '힐링', '자연'],
            isPopular: true,
          ),
        ];
      } else if (selectedTabIndex.value == 1) { // 인기순
        campaigns.value = [
          Campaign(
            id: '1',
            title: '제주도 1박2일 여행',
            description: '제주도의 아름다운 자연과 함께하는 1박 2일 여행 캠페인입니다.',
            imageUrl: 'https://picsum.photos/id/1015/500/300',
            tags: ['여행', '제주도', '1박2일'],
            isPopular: true,
          ),
          Campaign(
            id: '3',
            title: '도심 속 문화생활',
            description: '서울 시내 다양한 문화 공간을 탐방하는 캠페인입니다.',
            imageUrl: 'https://picsum.photos/id/1076/500/300',
            tags: ['문화', '서울', '전시'],
            isPopular: true,
          ),
          Campaign(
            id: '5',
            title: '힐링 캠핑',
            description: '자연 속에서 힐링을 느낄 수 있는 캠핑 캠페인입니다.',
            imageUrl: 'https://picsum.photos/id/1061/500/300',
            tags: ['캠핑', '힐링', '자연'],
            isPopular: true,
          ),
        ];
      } else { // 최신순
        campaigns.value = [
          Campaign(
            id: '5',
            title: '힐링 캠핑',
            description: '자연 속에서 힐링을 느낄 수 있는 캠핑 캠페인입니다.',
            imageUrl: 'https://picsum.photos/id/1061/500/300',
            tags: ['캠핑', '힐링', '자연'],
            isPopular: true,
          ),
          Campaign(
            id: '4',
            title: '스포츠 액티비티',
            description: '다양한 스포츠 활동을 체험하는 캠페인입니다.',
            imageUrl: 'https://picsum.photos/id/1058/500/300',
            tags: ['스포츠', '액티비티', '체험'],
          ),
          Campaign(
            id: '3',
            title: '도심 속 문화생활',
            description: '서울 시내 다양한 문화 공간을 탐방하는 캠페인입니다.',
            imageUrl: 'https://picsum.photos/id/1076/500/300',
            tags: ['문화', '서울', '전시'],
            isPopular: true,
          ),
        ];
      }
      
      // Update counts
      campaignCount.value = 5;
      reviewCount.value = 0;
      pointCount.value = 0;
    } catch (e) {
      print('Error fetching campaigns: $e');
    } finally {
      isLoading.value = false;
    }
  }
  
  void refreshData() {
    fetchCampaigns();
  }
}