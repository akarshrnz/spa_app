import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:spa_booking_app/core/app_image.dart';
import 'package:spa_booking_app/core/navigation/app_navigator.dart';
import 'package:spa_booking_app/core/navigation/app_routes.dart';
import 'package:spa_booking_app/core/theme/app_colors.dart';
import 'package:spa_booking_app/core/theme/app_text_styles.dart';
import 'package:spa_booking_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:spa_booking_app/core/common_widgets/gradients/GradientBoxBorder.dart';
import 'package:spa_booking_app/core/common_widgets/gradients/gradeint_circle.dart';
import 'package:spa_booking_app/core/common_widgets/dotted_line.dart';
import 'package:spa_booking_app/core/common_widgets/gradient_button.dart';

class SpaDetailScreen extends StatefulWidget {
  const SpaDetailScreen({super.key});

  @override
  State<SpaDetailScreen> createState() => _SpaDetailScreenState();
}

class _SpaDetailScreenState extends State<SpaDetailScreen> {
  final List<String> filters = ['All', 'Home-visit', 'Walk-in', 'Male', 'Female'];
  String selectedFilter = 'All';
  final Set<String> selectedServices = {'Swedish Massage'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      body: Stack(
        children: [
          _buildTopBanner(context),
          _buildMainContent(context),
          _buildBackButton(),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildTopBanner(BuildContext context) {
    return Positioned.fill(
      top: 0,
      bottom: MediaQuery.of(context).size.height * 0.65,
      child: Image.asset(
        AppImage.spaImage,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Positioned.fill(
      top: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 80.h),
              children: [
                _buildSpaInfoCard(),
                SizedBox(height: 12.h),
                _buildChips(),
                SizedBox(height: 20.h),
                _buildServiceSection('Massage Therapy', [
                  _buildServiceTile(
                    title: 'Swedish Massage',
                    price: '₹4,000',
                    duration: '60 Mins',
                    type: 'Walkin',
                    image: AppImage.humanLogo,
                  ),
                  _buildServiceTile(
                    title: 'Deep Tissue Massage',
                    price: '₹6,200',
                    duration: '60 Mins',
                    type: 'Walkin',
                    image: AppImage.femaleLogo,
                  ),
                  _buildServiceTile(
                    title: 'Hot Stone Massage',
                    price: '₹8,500',
                    duration: '60 Mins',
                    type: 'Homevisit',
                    image: AppImage.maleLogo,
                  ),
                ]),
                SizedBox(height: 12.h),
                _buildServiceSection('Hair Cut Wash & Style', []),
                _buildServiceSection('Nail Bar', []),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 40.h,
      left: 16.w,
      child: GestureDetector(
        onTap: () => AppNavigator.pop(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                color: const Color(0xCCD6CDBE),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 22,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Positioned(
      bottom: 10.h,
      left: 10.w,
      right: 10.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedServices.length} Services added',
              style: AppTextStyles.cardSubText.copyWith(fontWeight: FontWeight.w600),
            ),
            GradientButton(
              height: 48.h,
              width: 150.w,
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                colors: [AppColors.secondaryGradient, AppColors.primaryGradient],
              ),
              radius: 16.r,
              onTap: () {
                 AppNavigator.push(
                      AppRoutes.cart,
                    );
             
              },
              title: "Check out",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpaInfoCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSpaHeader(),
          SizedBox(height: 10.h),
          _buildDivider(),
          SizedBox(height: 10.h),
          _buildOfferCard(),
        ],
      ),
    );
  }

  Widget _buildSpaHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: Colors.red,
          child: Text('H', style: TextStyle(color: Colors.white, fontSize: 14.sp)),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Oasis Spa Haven', style: AppTextStyles.cardTitle),
            SizedBox(height: 4.h),
            Row(
              children: [
                Image.asset(AppImage.shopColor, width: 20.w, height: 20.h),
                Text(' Madhapur', style: AppTextStyles.cardSubText),
                SizedBox(width: 12.w),
                Image.asset(AppImage.roundLocationIconColor, width: 20.w, height: 20.h),
                Text(' 3.5 km', style: AppTextStyles.cardSubText),
                SizedBox(width: 12.w),
                Image.asset(AppImage.star, width: 20.w, height: 20.h),
                Text(' 4.5', style: AppTextStyles.cardSubText),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return DottedLine(
      space: 5.w,
      color: AppColors.primaryGradient.withOpacity(.5),
    );
  }

  Widget _buildOfferCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.cardBackground,
        border: Border.all(width: 2.w, color: const Color(0xFFF0F0F0)),
      ),
      child: Row(
        children: [
          Image.asset(AppImage.offer, width: 32.w, height: 30.h),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Use code DSaloon', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)),
              Text('Get ₹500 off on orders above 100/-', style: AppTextStyles.cardSubText),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChips() {
    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final chip = filters[index];
          final isSelected = chip == selectedFilter;
          return GestureDetector(
            onTap: () => setState(() => selectedFilter = chip),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              alignment: Alignment.center,
              height: 50.h,
              decoration: BoxDecoration(
                border: isSelected
                    ? null
                    : const GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [AppColors.secondaryGradient, AppColors.primaryGradient],
                        ),
                        width: 1,
                      ),
                gradient: isSelected
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [AppColors.secondaryGradient, AppColors.primaryGradient],
                      )
                    : null,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: isSelected
                  ? Text(chip, style: TextStyle(color: Colors.white, fontSize: 14.sp))
                  : GradientText(
                      chip,
                      gradientType: GradientType.radial,
                      radius: 2.5,
                      colors: const [AppColors.secondaryGradient, AppColors.primaryGradient],
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildServiceSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.serviceCard,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Text(title, style: AppTextStyles.sectionTitle),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_up_rounded, color: AppColors.primaryGradient),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        ...children,
      ],
    );
  }

  Widget _buildServiceTile({
    required String title,
    required String price,
    required String duration,
    required String type,
    required String image,
  }) {
    final isSelected = selectedServices.contains(title);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.serviceCard,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildServiceHeader(title, image),
                SizedBox(height: 10.h),
                _buildServiceFooter(price, duration, type, isSelected, title),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceHeader(String title, String image) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.serviceTitle),
            SizedBox(height: 4.h),
            Text(
              'Experience relaxation and stress relief...',
              style: AppTextStyles.serviceDescription,
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
            ],
          ),
          child: Image.asset(image, fit: BoxFit.cover, height: 28.h, width: 22.w),
        ),
      ],
    );
  }

  Widget _buildServiceFooter(String price, String duration, String type, bool isSelected, String title) {
    return Row(
      children: [
        Text(price, style: AppTextStyles.priceText),
        _buildGradientCircle(),
        Text(duration, style: AppTextStyles.cardSubText),
        _buildGradientCircle(),
        Text(type, style: AppTextStyles.cardSubText),
        const Spacer(),
        isSelected ? _buildRemoveButton(title) : _buildAddButton(title),
      ],
    );
  }

  Widget _buildGradientCircle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: GradientCircle(
        size: 5.w,
        radius: 2.5.w,
        colors: const [AppColors.secondaryGradient, AppColors.primaryGradient],
      ),
    );
  }

  Widget _buildRemoveButton(String title) {
    return InkWell(
      onTap: () {
        selectedServices.remove(title);
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        alignment: Alignment.center,
        height: 32.h,
        width: 92.w,
        decoration: BoxDecoration(
          border: const GradientBoxBorder(
            gradient: LinearGradient(
              colors: [AppColors.secondaryGradient, AppColors.primaryGradient],
            ),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: GradientText(
          "Remove",
          gradientType: GradientType.radial,
          radius: 2.5,
          colors: const [AppColors.secondaryGradient, AppColors.primaryGradient],
        ),
      ),
    );
  }

  Widget _buildAddButton(String title) {
    return GradientButton(
      height: 32.h,
      width: 92.w,
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        colors: [AppColors.secondaryGradient, AppColors.primaryGradient],
      ),
      radius: 16.r,
      onTap: () {
        selectedServices.add(title);
        setState(() {});
      },
      title: "Add",
    );
  }
}
