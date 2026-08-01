package com.lifestyle.products.controller;

import com.lifestyle.products.dto.CartItemRequestDto;
import com.lifestyle.products.dto.CartResponseDto;
import com.lifestyle.products.dto.MessageResponse;
import com.lifestyle.products.dto.UpdateQuantityRequestDto;
import com.lifestyle.products.service.CartService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping
    public ResponseEntity<CartResponseDto> getCart(Principal principal) {
        return ResponseEntity.ok(cartService.getOrCreateCart(principal.getName()));
    }

    @PostMapping("/items")
    public ResponseEntity<CartResponseDto> addItemToCart(
            Principal principal,
            @Valid @RequestBody CartItemRequestDto dto
    ) {
        return ResponseEntity.ok(cartService.addItemToCart(principal.getName(), dto));
    }

    @PutMapping("/items/{itemId}")
    public ResponseEntity<CartResponseDto> updateItemQuantity(
            @PathVariable(name = "itemId") Long itemId,
            Principal principal,
            @Valid @RequestBody UpdateQuantityRequestDto dto
    ) {
        return ResponseEntity.ok(cartService.updateItemQuantity(principal.getName(), itemId, dto.getQuantity()));
    }

    @DeleteMapping("/items/{itemId}")
    public ResponseEntity<CartResponseDto> removeItemFromCart(
            @PathVariable(name = "itemId") Long itemId,
            Principal principal
    ) {
        return ResponseEntity.ok(cartService.removeItemFromCart(principal.getName(), itemId));
    }

    @DeleteMapping
    public ResponseEntity<CartResponseDto> clearCart(Principal principal) {
        return ResponseEntity.ok(cartService.clearCart(principal.getName()));
    }
}
