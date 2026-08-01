package com.lifestyle.products.service;

import com.lifestyle.products.dto.CartItemRequestDto;
import com.lifestyle.products.dto.CartItemResponseDto;
import com.lifestyle.products.dto.CartResponseDto;
import com.lifestyle.products.entity.Cart;
import com.lifestyle.products.entity.CartItem;
import com.lifestyle.products.entity.Product;
import com.lifestyle.products.entity.User;
import com.lifestyle.products.exception.ApiException;
import com.lifestyle.products.repository.CartItemRepository;
import com.lifestyle.products.repository.CartRepository;
import com.lifestyle.products.repository.ProductRepository;
import com.lifestyle.products.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    @Transactional
    public CartResponseDto getOrCreateCart(String username) {
        Cart cart = getCartEntityByUsername(username);
        return mapToDto(cart);
    }

    @Transactional
    public CartResponseDto addItemToCart(String username, CartItemRequestDto dto) {
        Cart cart = getCartEntityByUsername(username);
        Product product = productRepository.findById(dto.getProductId())
                .orElseThrow(() -> new ApiException("Product not found with ID: " + dto.getProductId(), HttpStatus.NOT_FOUND));

        Optional<CartItem> existingItem = cart.getCartItems().stream()
                .filter(item -> item.getProduct().getId().equals(product.getId()))
                .findFirst();

        if (existingItem.isPresent()) {
            CartItem item = existingItem.get();
            item.setQuantity(item.getQuantity() + dto.getQuantity());
        } else {
            CartItem newItem = CartItem.builder()
                    .cart(cart)
                    .product(product)
                    .quantity(dto.getQuantity())
                    .build();
            cart.getCartItems().add(newItem);
        }

        Cart savedCart = cartRepository.save(cart);
        return mapToDto(savedCart);
    }

    @Transactional
    public CartResponseDto updateItemQuantity(String username, Long itemId, int quantity) {
        Cart cart = getCartEntityByUsername(username);

        CartItem cartItem = cart.getCartItems().stream()
                .filter(item -> item.getId().equals(itemId))
                .findFirst()
                .orElseThrow(() -> new ApiException("Cart item not found with ID: " + itemId + " in user's cart", HttpStatus.NOT_FOUND));

        cartItem.setQuantity(quantity);
        Cart savedCart = cartRepository.save(cart);
        return mapToDto(savedCart);
    }

    @Transactional
    public CartResponseDto removeItemFromCart(String username, Long itemId) {
        Cart cart = getCartEntityByUsername(username);

        CartItem cartItem = cart.getCartItems().stream()
                .filter(item -> item.getId().equals(itemId))
                .findFirst()
                .orElseThrow(() -> new ApiException("Cart item not found with ID: " + itemId + " in user's cart", HttpStatus.NOT_FOUND));

        cart.getCartItems().remove(cartItem);
        Cart savedCart = cartRepository.save(cart);
        return mapToDto(savedCart);
    }

    @Transactional
    public CartResponseDto clearCart(String username) {
        Cart cart = getCartEntityByUsername(username);
        cart.getCartItems().clear();
        Cart savedCart = cartRepository.save(cart);
        return mapToDto(savedCart);
    }

    private Cart getCartEntityByUsername(String username) {
        return cartRepository.findByUserUsername(username)
                .orElseGet(() -> {
                    User user = userRepository.findByUsername(username)
                            .orElseThrow(() -> new ApiException("User not found: " + username, HttpStatus.NOT_FOUND));
                    Cart newCart = Cart.builder().user(user).build();
                    return cartRepository.save(newCart);
                });
    }

    private CartResponseDto mapToDto(Cart cart) {
        List<CartItemResponseDto> items = cart.getCartItems().stream()
                .map(item -> {
                    BigDecimal price = item.getProduct().getPrice();
                    BigDecimal total = price.multiply(BigDecimal.valueOf(item.getQuantity()));
                    return CartItemResponseDto.builder()
                            .id(item.getId())
                            .productId(item.getProduct().getId())
                            .productName(item.getProduct().getName())
                            .productPrice(price)
                            .imageUrl(item.getProduct().getImageUrl())
                            .quantity(item.getQuantity())
                            .totalPrice(total)
                            .build();
                })
                .collect(Collectors.toList());

        BigDecimal grandTotal = items.stream()
                .map(CartItemResponseDto::getTotalPrice)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        return CartResponseDto.builder()
                .id(cart.getId())
                .items(items)
                .grandTotal(grandTotal)
                .build();
    }
}
