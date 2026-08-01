package com.lifestyle.products.repository;

import com.lifestyle.products.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import java.math.BigDecimal;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUserUsernameOrderByOrderDateDesc(String username);

    @Query("SELECT COALESCE(SUM(o.totalAmount), 0) FROM Order o WHERE o.status NOT IN (com.lifestyle.products.entity.OrderStatus.PENDING, com.lifestyle.products.entity.OrderStatus.CANCELLED)")
    BigDecimal sumTotalRevenue();
}
