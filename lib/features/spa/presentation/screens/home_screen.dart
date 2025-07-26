import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spa_booking_app/core/app_image.dart';
import 'package:spa_booking_app/core/theme/app_colors.dart';
import 'package:spa_booking_app/core/theme/app_text_styles.dart';
import 'package:spa_booking_app/features/spa/presentation/screens/spa_detail_screen.dart';
import 'package:spa_booking_app/features/spa/presentation/screens/widgets/loaction_selector.dart';

class HomeScreen
    extends
        StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildSearchField(),
          Expanded(
            child: _buildSpaList(),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Row(
          children: [
            LocationSelector(),
            // const Icon(
            //   Icons.location_on_outlined,
            //   color: AppColors.chipSelected,
            // ),
            // const SizedBox(
            //   width: 4,
            // ),
            // Text(
            //   'Madhapur',
            //   style: AppTextStyles.body.copyWith(
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            // const Icon(
            //   Icons.keyboard_arrow_down_rounded,
            //   color: AppColors.secondary,
            // ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(
                10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                color: AppColors.cardBackground,
              ),
              child: const Icon(
                Icons.notifications_none_rounded,
                color: AppColors.chipSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Spa, Services...',
          hintStyle: AppTextStyles.body,
          prefixIcon: const Icon(
            Icons.search,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSpaList() {
    final spas = _getSpaList();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      itemCount: spas.length,
      itemBuilder:
          (
            context,
            index,
          ) {
            final spa = spas[index];
            return _buildSpaCard(
              context,
              spa,
            );
          },
    );
  }

  List<
    Map<
      String,
      dynamic
    >
  >
  _getSpaList() {
    return [
      {
        'name': 'Renew Day Spa',
        'type': 'Unisex',
        'image': 'https://media.istockphoto.com/id/1479350890/photo/relax-spa-and-zen-woman-with-candles-for-beauty-physical-therapy-or-skincare-female-client-on.jpg?s=612x612&w=0&k=20&c=ODbmBr1IW1F21YC8pMvzytNnhZopOTRfFgulk7ISOqg=',
        'offer': true,
      },
      {
        'name': 'Mystical Mantra Spa',
        'type': 'Male',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNeY9CUt-Oubpz6cVMhnsQxd6ICcXrsL1VLA&s',
        'offer': false,
      },
      {
        'name': 'Bodhi Retreat Spa',
        'type': 'Female',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9igXZcpR0qVsuaQ-VvY6pIV8ExWPrrEekKA&s',
        'offer': true,
      },
      {
        'name': 'Eternal Bliss Ayurvedic Spa',
        'type': 'Female',
        'image': 'https://img.freepik.com/free-photo/young-woman-having-face-massage-relaxing-spa-salon_176420-7546.jpg',
        'offer': false,
      },
      {
        'name': 'Renew Day Spa',
        'type': 'Unisex',
        'image': 'https://media.istockphoto.com/id/1479350890/photo/relax-spa-and-zen-woman-with-candles-for-beauty-physical-therapy-or-skincare-female-client-on.jpg?s=612x612&w=0&k=20&c=ODbmBr1IW1F21YC8pMvzytNnhZopOTRfFgulk7ISOqg=',
        'offer': true,
      },
    ];
  }

  Widget _buildSpaCard(
    BuildContext context,
    Map<
      String,
      dynamic
    >
    spa,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (
                  _,
                ) => const SpaDetailScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        padding: const EdgeInsets.all(
          12,
        ),
        child: Column(
          children: [
            _buildSpaCardHeader(
              spa,
            ),
            if (spa['offer'] ==
                true)
              _buildOfferSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpaCardHeader(
    Map<
      String,
      dynamic
    >
    spa,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildSpaImage(
          spa,
        ),
        SizedBox(
          width: 10.w,
        ),
        _buildSpaDetails(
          spa,
        ),
      ],
    );
  }

  Widget _buildSpaImage(
    Map<
      String,
      dynamic
    >
    spa,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        12.r,
      ),
      child: Image.network(
        spa['image']!.toString(),
        width: 88.w,
        height: 110.h,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSpaDetails(
    Map<
      String,
      dynamic
    >
    spa,
  ) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildSpaTitleAndFavorite(
            spa,
          ),
          const SizedBox(
            height: 4,
          ),
          _buildSpaAddress(),
          const SizedBox(
            height: 4,
          ),
          Text(
            spa['type']!.toString(),
            style: AppTextStyles.cardSubText,
          ),
          _buildRatingAndDistance(),
        ],
      ),
    );
  }

  Widget _buildSpaTitleAndFavorite(
    Map<
      String,
      dynamic
    >
    spa,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            spa['name']!.toString(),
            style: AppTextStyles.cardTitle,
            maxLines: 1,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 5,
          ),
          child: Icon(
            Icons.favorite,
            color: AppColors.chipSelected,
          ),
        ),
      ],
    );
  }

  Widget _buildSpaAddress() {
    return Row(
      children: [
        Image.asset(
          AppImage.shop,
          width: 14,
          height: 14,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            '1208, Spline Arcade, Flat No 102...',
            style: AppTextStyles.cardSubText,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingAndDistance() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 16,
          color: AppColors.ratingStar,
        ),
        const SizedBox(
          width: 4,
        ),
        const Text(
          '4.5',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Image.asset(
          AppImage.roundLocationIcon,
          width: 14,
          height: 14,
        ),
        const SizedBox(
          width: 4,
        ),
        const Text(
          '3.5 km',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildOfferSection() {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Image.asset(
                AppImage.offer,
                width: 14,
                height: 14,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Flat 10% Off above value of 200',
                style: AppTextStyles.offerText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
