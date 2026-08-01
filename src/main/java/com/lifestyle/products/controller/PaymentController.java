package com.lifestyle.products.controller;

import com.lifestyle.products.dto.PaymentRequestDto;
import com.lifestyle.products.dto.PaymentResponseDto;
import com.lifestyle.products.service.PaymentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/payments")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @PostMapping("/process")
    public ResponseEntity<PaymentResponseDto> processPayment(
            Principal principal,
            @Valid @RequestBody PaymentRequestDto dto
    ) {
        return ResponseEntity.ok(paymentService.processPayment(principal.getName(), dto));
    }

    @GetMapping("/order/{orderId}")
    public ResponseEntity<PaymentResponseDto> getPaymentDetails(
            @PathVariable(name = "orderId") Long orderId,
            Principal principal
    ) {
        return ResponseEntity.ok(paymentService.getPaymentDetailsByOrderId(principal.getName(), orderId));
    }
}
