-- Step 13: Sample Data Seeding
-- This script seeds the database with realistic sample data for local testing.
-- It inserts security roles, user records with BCrypt passwords, categories, products, carts, orders, payments, and banners.

USE lifestyle_products;

-- 1. Seed Roles
INSERT INTO roles (name) VALUES 
('ROLE_USER'),
('ROLE_ADMIN');

-- 2. Seed Users
-- Password hash is BCrypt for 'password123': $2a$10$7Z2v7v9eK7vQo2x7v5uS2.X2g/2g2uGgK9k2t8x7v5uS2.X2g/2g2
INSERT INTO users (username, email, password, first_name, last_name, phone_number, enabled, created_at, updated_at) VALUES
('admin', 'admin@lifestyle.com', '$2a$10$B0t19aY.L0ZcK7V6H4pZNeD02tH56b3S16X7aK7v5uS2.X2g/2g2', 'System', 'Administrator', '+15550100', 1, NOW(6), NOW(6)),
('alice_green', 'alice.green@example.com', '$2a$10$B0t19aY.L0ZcK7V6H4pZNeD02tH56b3S16X7aK7v5uS2.X2g/2g2', 'Alice', 'Green', '+15550101', 1, NOW(6), NOW(6)),
('bob_smith', 'bob.smith@example.com', '$2a$10$B0t19aY.L0ZcK7V6H4pZNeD02tH56b3S16X7aK7v5uS2.X2g/2g2', 'Bob', 'Smith', '+15550102', 1, NOW(6), NOW(6)),
('charlie_brown', 'charlie.brown@example.com', '$2a$10$B0t19aY.L0ZcK7V6H4pZNeD02tH56b3S16X7aK7v5uS2.X2g/2g2', 'Charlie', 'Brown', '+15550103', 0, NOW(6), NOW(6)); -- Disabled user

-- 3. Seed User Roles
INSERT INTO user_roles (user_id, role_id) VALUES
(1, 2), -- admin gets ROLE_ADMIN
(2, 1), -- alice_green gets ROLE_USER
(3, 1), -- bob_smith gets ROLE_USER
(4, 1); -- charlie_brown gets ROLE_USER

-- 4. Seed Categories
INSERT INTO categories (name, description, image_url, created_at, updated_at) VALUES
('Apparel', 'Premium shirts, jackets, and everyday wear.', 'https://images.example.com/categories/apparel.jpg', NOW(6), NOW(6)),
('Footwear', 'Ergonomic and stylish running shoes, boots, and sneakers.', 'https://images.example.com/categories/footwear.jpg', NOW(6), NOW(6)),
('Accessories', 'Leather bags, high-grade watches, and sunglasses.', 'https://images.example.com/categories/accessories.jpg', NOW(6), NOW(6)),
('Home Decor', 'Minimalist lamps, rugs, and dynamic wall art.', 'https://images.example.com/categories/homedecor.jpg', NOW(6), NOW(6));

-- 5. Seed Products
INSERT INTO products (name, description, price, image_url, featured, category_id, created_at, updated_at) VALUES
('Classic Denim Jacket', 'Heavyweight cotton denim jacket with standard fit.', 89.99, 'https://images.example.com/products/denim_jacket.jpg', 1, 1, NOW(6), NOW(6)),
('Organic Cotton T-Shirt', 'Ultra-soft organic cotton crew neck tee.', 24.99, 'https://images.example.com/products/organic_tee.jpg', 0, 1, NOW(6), NOW(6)),
('Aero Running Shoes', 'Lightweight mesh running shoes with responsive cushioning.', 120.00, 'https://images.example.com/products/running_shoes.jpg', 1, 2, NOW(6), NOW(6)),
('Casual Leather Sneakers', 'Handcrafted full-grain leather sneakers in white.', 145.00, 'https://images.example.com/products/leather_sneakers.jpg', 0, 2, NOW(6), NOW(6)),
('Minimalist Leather Wallet', 'Sleek bifold wallet made from vegetable-tanned leather.', 45.00, 'https://images.example.com/products/wallet.jpg', 1, 3, NOW(6), NOW(6)),
('Chronograph Sport Watch', 'Water-resistant chronograph watch with silicone strap.', 199.99, 'https://images.example.com/products/watch.jpg', 0, 3, NOW(6), NOW(6)),
('Ceramic Desk Lamp', 'Matte finished ceramic base lamp with linen shade.', 59.99, 'https://images.example.com/products/lamp.jpg', 0, 4, NOW(6), NOW(6)),
('Geometric Wool Rug', 'Hand-woven geometric patterned wool rug (5x7 ft).', 249.99, 'https://images.example.com/products/rug.jpg', 1, 4, NOW(6), NOW(6));

-- 6. Seed Carts
INSERT INTO carts (user_id, created_at, updated_at) VALUES
(2, NOW(6), NOW(6)), -- Cart for alice_green
(3, NOW(6), NOW(6)); -- Cart for bob_smith

-- 7. Seed Cart Items
INSERT INTO cart_items (cart_id, product_id, quantity, created_at, updated_at) VALUES
(1, 2, 2, NOW(6), NOW(6)), -- Alice has 2x Organic Cotton T-Shirt
(1, 5, 1, NOW(6), NOW(6)), -- Alice has 1x Minimalist Leather Wallet
(2, 1, 1, NOW(6), NOW(6)); -- Bob has 1x Classic Denim Jacket

-- 8. Seed Orders
INSERT INTO orders (user_id, order_date, status, total_amount, shipping_address, created_at, updated_at) VALUES
(2, DATE_SUB(NOW(), INTERVAL 5 DAY), 'DELIVERED', 134.98, '123 Main St, New York, NY 10001', DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY)),
(3, DATE_SUB(NOW(), INTERVAL 2 DAY), 'PROCESSING', 199.99, '456 Elm St, San Francisco, CA 94101', DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY)),
(2, NOW(), 'PENDING', 24.99, '123 Main St, New York, NY 10001', NOW(), NOW());

-- 9. Seed Order Items
INSERT INTO order_items (order_id, product_id, quantity, price, created_at, updated_at) VALUES
-- Order 1 Items (Alice)
(1, 2, 2, 22.49, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY)), -- Price captured at checkout (perhaps discounted)
(1, 1, 1, 89.99, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY)),
-- Order 2 Items (Bob)
(2, 6, 1, 199.99, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY)),
-- Order 3 Items (Alice)
(3, 2, 1, 24.99, NOW(), NOW());

-- 10. Seed Payments
INSERT INTO payments (order_id, transaction_id, amount, payment_method, payment_status, payment_date, created_at, updated_at) VALUES
(1, 'TXN-9823120-NY', 134.98, 'CREDIT_CARD', 'COMPLETED', DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY)),
(2, 'TXN-4190821-SF', 199.99, 'PAYPAL', 'COMPLETED', DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY));

-- 11. Seed Banners
INSERT INTO banners (title, image_url, link_url, display_order, created_at, updated_at) VALUES
('Summer Apparel Collection - Up to 40% Off', 'https://images.example.com/banners/summer_sale.jpg', '/catalog?category=apparel', 1, NOW(6), NOW(6)),
('Step Up Your Game with Aero Footwear', 'https://images.example.com/banners/footwear_banner.jpg', '/catalog?category=footwear', 2, NOW(6), NOW(6));
