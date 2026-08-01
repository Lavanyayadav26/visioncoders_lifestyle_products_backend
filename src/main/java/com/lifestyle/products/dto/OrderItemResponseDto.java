package com.lifestyle.products.dto;

import java.math.BigDecimal;

public class OrderItemResponseDto {
    private Long id;
    private Long productId;
    private String productName;
    private Integer quantity;
    private BigDecimal price;
    private BigDecimal totalPrice;

    // No-args constructor
    public OrderItemResponseDto() {
    }

    // All-args constructor
    public OrderItemResponseDto(Long id, Long productId, String productName, Integer quantity, BigDecimal price, BigDecimal totalPrice) {
        this.id = id;
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
        this.totalPrice = totalPrice;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    // Builder method
    public static OrderItemResponseDtoBuilder builder() {
        return new OrderItemResponseDtoBuilder();
    }

    // Builder class
    public static class OrderItemResponseDtoBuilder {
        private Long id;
        private Long productId;
        private String productName;
        private Integer quantity;
        private BigDecimal price;
        private BigDecimal totalPrice;

        public OrderItemResponseDtoBuilder id(Long id) {
            this.id = id;
            return this;
        }

        public OrderItemResponseDtoBuilder productId(Long productId) {
            this.productId = productId;
            return this;
        }

        public OrderItemResponseDtoBuilder productName(String productName) {
            this.productName = productName;
            return this;
        }

        public OrderItemResponseDtoBuilder quantity(Integer quantity) {
            this.quantity = quantity;
            return this;
        }

        public OrderItemResponseDtoBuilder price(BigDecimal price) {
            this.price = price;
            return this;
        }

        public OrderItemResponseDtoBuilder totalPrice(BigDecimal totalPrice) {
            this.totalPrice = totalPrice;
            return this;
        }

        public OrderItemResponseDto build() {
            return new OrderItemResponseDto(id, productId, productName, quantity, price, totalPrice);
        }
    }
}
