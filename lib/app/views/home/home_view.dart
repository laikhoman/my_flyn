import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/campaign_card.dart';
import '../../routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY FLYN',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {
              // Navigate to notifications
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshData();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User greeting and stats
              _buildUserHeader(),
              
              // Menu items
              _buildMenuItems(),
              
              // Campaign tabs and list
              _buildCampaignSection(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildUserHeader() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting
          Obx(() => Text(
            '안녕하세요,\n${controller.username}',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(height: 24.0),
          
          // Stats
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('캠페인', controller.campaignCount),
                _buildDivider(),
                _buildStatItem('리뷰', controller.reviewCount),
                _buildDivider(),
                _buildStatItem('포인트', controller.pointCount),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildStatItem(String label, RxInt count) {
    return Column(
      children: [
        Obx(() => Text(
          '${count.value}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(Get.context!).primaryColor,
          ),
        )),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
  
  Widget _buildDivider() {
    return Container(
      height: 40.0,
      width: 1.0,
      color: Colors.grey[300],
    );
  }
  
  Widget _buildMenuItems() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.campaign_outlined,
            title: '인기 캠페인',
            onTap: () {
              controller.changeTab(1); // Switch to popular tab
            },
          ),
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: '설정하기',
            onTap: () {
              Get.toNamed(AppRoutes.SETTINGS);
            },
          ),
          _buildMenuItem(
            icon: Icons.person_outline,
            title: '내정보',
            onTap: () {
              Get.toNamed(AppRoutes.PROFILE);
            },
          ),
          _buildMenuItem(
            icon: Icons.help_outline,
            title: 'FAQ',
            onTap: () {
              // Navigate to FAQ
            },
          ),
          _buildMenuItem(
            icon: Icons.security_outlined,
            title: '개인정보 처리방침',
            onTap: () {
              // Navigate to privacy policy
            },
          ),
          _buildMenuItem(
            icon: Icons.support_agent_outlined,
            title: '문의하기',
            onTap: () {
              // Navigate to support
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
  
  Widget _buildCampaignSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '캠페인 매칭',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          
          // Tabs
          _buildTabs(),
          SizedBox(height: 16.0),
          
          // Campaign list
          _buildCampaignList(),
        ],
      ),
    );
  }
  
  Widget _buildTabs() {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          _buildTabItem('전체', 0),
          _buildTabItem('인기순', 1),
          _buildTabItem('최신순', 2),
        ],
      ),
    );
  }
  
  Widget _buildTabItem(String title, int index) {
    return Obx(() => Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: controller.selectedTabIndex.value == index
                ? Theme.of(Get.context!).primaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: controller.selectedTabIndex.value == index
                  ? Colors.white
                  : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ));
  }
  
  Widget _buildCampaignList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      
      if (controller.campaigns.isEmpty) {
        return Center(
          child: Text(
            '캠페인이 없습니다.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
        );
      }
      
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.campaigns.length,
        itemBuilder: (context, index) {
          final campaign = controller.campaigns[index];
          return CampaignCard(
            id: campaign.id,
            title: campaign.title,
            description: campaign.description,
            imageUrl: campaign.imageUrl,
            tags: campaign.tags,
            isPopular: campaign.isPopular,
          );
        },
      );
    });
  }
}