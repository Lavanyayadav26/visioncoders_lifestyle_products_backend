package com.lifestyle.products.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

@RestController
@RequestMapping("/api/db-test")
public class DbTestController {

    @Autowired
    private DataSource dataSource;

    @GetMapping
    public ResponseEntity<?> testDatabaseConnection() {
        Map<String, Object> response = new HashMap<>();
        try (Connection connection = dataSource.getConnection()) {
            if (connection != null && !connection.isClosed()) {
                response.put("status", "success");
                response.put("message", "Successfully connected to the database!");
                
                List<String> tables = new ArrayList<>();
                java.sql.ResultSet rs = connection.getMetaData().getTables(null, null, "%", new String[]{"TABLE"});
                while (rs.next()) {
                    tables.add(rs.getString("TABLE_NAME"));
                }
                response.put("tables_found", tables);
                
                return ResponseEntity.ok(response);
            } else {
                response.put("status", "error");
                response.put("message", "Connection was null or closed.");
                return ResponseEntity.status(500).body(response);
            }
        } catch (SQLException e) {
            response.put("status", "error");
            response.put("message", "Failed to connect to the database.");
            response.put("error_message", e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }
}
