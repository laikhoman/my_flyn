import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/campaign_controller.dart';
import '../../widgets/custom_button.dart';

class CampaignDetailsView extends GetView<CampaignController> {
  const CampaignDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          controller.title.value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campaign Image
              _buildCampaignImage(),
              
              // Campaign Content
              _buildCampaignContent(),
            ],
          ),
        );
      }),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
  
  Widget _buildCampaignImage() {
    return Obx(() => controller.imageUrl.value.isNotEmpty
      ? Image.network(
          controller.imageUrl.value,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[200],
              child: Center(
                child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
              ),
            );
          },
        )
      : Container(
          height: 250,
          width: double.infinity,
          color: Colors.grey[200],
          child: Center(
            child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
          ),
        )
    );
  }
  
  Widget _buildCampaignContent() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Obx(() => Text(
            controller.title.value,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(height: 16.0),
          
          // Tags
          _buildTags(),
          SizedBox(height: 24.0),
          
          // Tab Bar
          _buildTabBar(),
          SizedBox(height: 16.0),
          
          // Description
          Obx(() => Text(
            controller.description.value,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
              height: 1.5,
            ),
          )),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
  
  Widget _buildTags() {
    return Obx(() => Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        for (final tag in controller.tags)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: Theme.of(Get.context!).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              tag,
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(Get.context!).primaryColor,
              ),
            ),
          ),
        
        if (controller.isPopular.value)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              '인기캠페인',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.red,
              ),
            ),
          ),
      ],
    ));
  }
  
  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          _buildTabItem('상세', isSelected: true),
          _buildTabItem('리뷰', isSelected: false),
          _buildTabItem('문의', isSelected: false),
        ],
      ),
    );
  }
  
  Widget _buildTabItem(String title, {required bool isSelected}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Theme.of(Get.context!).primaryColor : Colors.grey,
            ),
          ),
          SizedBox(height: 8.0),
          if (isSelected)
            Container(
              height: 3.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: Theme.of(Get.context!).primaryColor,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
        ],
      ),
    );
  }
  
  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: CustomButton(
        text: '신청하기',
        onPressed: () => controller.applyCampaign(),
        backgroundColor: Theme.of(Get.context!).primaryColor,
        width: double.infinity,
      ),
    );
  }
}