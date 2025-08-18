import 'package:get/get.dart';

class CampaignController extends GetxController {
  final RxString campaignId = ''.obs;
  final RxString title = ''.obs;
  final RxString description = ''.obs;
  final RxString imageUrl = ''.obs;
  final RxList<String> tags = <String>[].obs;
  final RxBool isPopular = false.obs;
  final RxBool isLoading = true.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Get campaign ID from arguments
    if (Get.arguments != null && Get.arguments['id'] != null) {
      campaignId.value = Get.arguments['id'];
      fetchCampaignDetails();
    }
  }
  
  Future<void> fetchCampaignDetails() async {
    isLoading.value = true;
    
    try {
      // Simulate API call with delay
      await Future.delayed(Duration(milliseconds: 800));
      
      // Mock data based on campaign ID
      switch (campaignId.value) {
        case '1':
          title.value = '제주도 1박2일 여행';
          description.value = '제주도의 아름다운 자연과 함께하는 1박 2일 여행 캠페인입니다. 제주도의 푸른 바다와 오름, 맛있는 음식을 경험해보세요. 이 캠페인은 제주도의 자연과 문화를 체험하고 공유하는 것을 목적으로 합니다.';
          imageUrl.value = 'https://picsum.photos/id/1015/500/300';
          tags.value = ['여행', '제주도', '1박2일'];
          isPopular.value = true;
          break;
        case '2':
          title.value = '맛있는 브런치 먹방';
          description.value = '도심 속 브런치 카페에서 맛있는 음식을 즐기는 캠페인입니다. 다양한 브런치 메뉴와 커피를 즐기며 여유로운 시간을 보내보세요. 이 캠페인은 도시의 다양한 브런치 문화를 경험하고 공유하는 것을 목적으로 합니다.';
          imageUrl.value = 'https://picsum.photos/id/292/500/300';
          tags.value = ['맛집', '브런치', '카페'];
          isPopular.value = false;
          break;
        case '3':
          title.value = '도심 속 문화생활';
          description.value = '서울 시내 다양한 문화 공간을 탐방하는 캠페인입니다. 미술관, 박물관, 공연장 등 다양한 문화 공간을 방문하고 경험을 공유해보세요. 이 캠페인은 도시의 다양한 문화 공간을 경험하고 공유하는 것을 목적으로 합니다.';
          imageUrl.value = 'https://picsum.photos/id/1076/500/300';
          tags.value = ['문화', '서울', '전시'];
          isPopular.value = true;
          break;
        case '4':
          title.value = '스포츠 액티비티';
          description.value = '다양한 스포츠 활동을 체험하는 캠페인입니다. 클라이밍, 서핑, 요가 등 다양한 스포츠 활동을 체험하고 경험을 공유해보세요. 이 캠페인은 다양한 스포츠 활동을 경험하고 공유하는 것을 목적으로 합니다.';
          imageUrl.value = 'https://picsum.photos/id/1058/500/300';
          tags.value = ['스포츠', '액티비티', '체험'];
          isPopular.value = false;
          break;
        case '5':
          title.value = '힐링 캠핑';
          description.value = '자연 속에서 힐링을 느낄 수 있는 캠핑 캠페인입니다. 숲속에서 캠핑을 즐기며 자연과 함께하는 시간을 가져보세요. 이 캠페인은 자연 속에서 힐링을 경험하고 공유하는 것을 목적으로 합니다.';
          imageUrl.value = 'https://picsum.photos/id/1061/500/300';
          tags.value = ['캠핑', '힐링', '자연'];
          isPopular.value = true;
          break;
        default:
          title.value = '캠페인 정보 없음';
          description.value = '해당 캠페인 정보를 찾을 수 없습니다.';
          imageUrl.value = '';
          tags.value = [];
          isPopular.value = false;
      }
    } catch (e) {
      print('Error fetching campaign details: $e');
    } finally {
      isLoading.value = false;
    }
  }
  
  void applyCampaign() {
    // Here you would implement the logic to apply for the campaign
    Get.snackbar(
      '캠페인 신청',
      '${title.value} 캠페인에 신청되었습니다.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}