package com.lifestyle.products.config;

import com.lifestyle.products.entity.*;
import com.lifestyle.products.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Arrays;

@Component
public class DatabaseSeeder implements CommandLineRunner {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private BannerRepository bannerRepository;

    @Override
    public void run(String... args) throws Exception {
        // 1. Seed Roles
        if (roleRepository.findByName(ERole.ROLE_USER).isEmpty()) {
            roleRepository.save(Role.builder().name(ERole.ROLE_USER).build());
        }
        if (roleRepository.findByName(ERole.ROLE_ADMIN).isEmpty()) {
            roleRepository.save(Role.builder().name(ERole.ROLE_ADMIN).build());
        }

        // 2. Seed Categories (if empty)
        if (categoryRepository.count() == 0) {
            Category apparel = Category.builder()
                    .name("Apparel")
                    .description("Sustainable and trendy clothing lines")
                    .imageUrl("/images/categories/apparel.jpg")
                    .build();
            Category homeDecor = Category.builder()
                    .name("Home Decor")
                    .description("Minimalist and cozy decorations for your living space")
                    .imageUrl("/images/categories/home_decor.jpg")
                    .build();
            Category wellness = Category.builder()
                    .name("Wellness")
                    .description("Organic wellness and self-care essentials")
                    .imageUrl("/images/categories/wellness.jpg")
                    .build();

            categoryRepository.saveAll(Arrays.asList(apparel, homeDecor, wellness));

            // 3. Seed Banners (if empty)
            if (bannerRepository.count() == 0) {
                Banner banner1 = Banner.builder()
                        .title("Summer Collection Sale - Up to 40% Off!")
                        .imageUrl("/images/banners/summer_sale.jpg")
                        .linkUrl("/shop/apparel")
                        .displayOrder(1)
                        .build();
                Banner banner2 = Banner.builder()
                        .title("Revamp Your Workspace: Eco-Friendly Home Decor")
                        .imageUrl("/images/banners/home_decor_sale.jpg")
                        .linkUrl("/shop/home-decor")
                        .displayOrder(2)
                        .build();

                bannerRepository.saveAll(Arrays.asList(banner1, banner2));
            }

            // 4. Seed Products (if empty)
            if (productRepository.count() == 0) {
                // Apparel Products
                Product tShirt = Product.builder()
                        .name("Organic Cotton T-Shirt")
                        .description("Breathable, 100% organic cotton classic tee")
                        .price(new BigDecimal("29.99"))
                        .imageUrl("/images/products/tshirt.jpg")
                        .featured(true)
                        .category(apparel)
                        .build();
                Product hoodie = Product.builder()
                        .name("Recycled Poly Hoodie")
                        .description("Cozy oversized hoodie made from recycled materials")
                        .price(new BigDecimal("59.99"))
                        .imageUrl("/images/products/hoodie.jpg")
                        .featured(false)
                        .category(apparel)
                        .build();

                // Home Decor Products
                Product vase = Product.builder()
                        .name("Ceramic Flower Vase")
                        .description("Handcrafted minimalist ceramic vase")
                        .price(new BigDecimal("34.50"))
                        .imageUrl("/images/products/vase.jpg")
                        .featured(true)
                        .category(homeDecor)
                        .build();
                Product lamp = Product.builder()
                        .name("Bamboo Desk Lamp")
                        .description("Natural bamboo desk lamp with warm LED bulb")
                        .price(new BigDecimal("45.00"))
                        .imageUrl("/images/products/lamp.jpg")
                        .featured(true)
                        .category(homeDecor)
                        .build();

                // Wellness Products
                Product oil = Product.builder()
                        .name("Lavender Essential Oil")
                        .description("Pure lavender essential oil for relaxation and aromatherapy")
                        .price(new BigDecimal("15.99"))
                        .imageUrl("/images/products/lavender_oil.jpg")
                        .featured(false)
                        .category(wellness)
                        .build();
                Product candle = Product.builder()
                        .name("Soy Wax Scented Candle")
                        .description("Hand-poured aromatic soy wax candle in glass jar")
                        .price(new BigDecimal("22.50"))
                        .imageUrl("/images/products/candle.jpg")
                        .featured(true)
                        .category(wellness)
                        .build();

                productRepository.saveAll(Arrays.asList(tShirt, hoodie, vase, lamp, oil, candle));
            }
        }
    }
}
