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

@RestController
@RequestMapping("/api/db-test")
public class DbTestController {

    @Autowired
    private DataSource dataSource;

    @GetMapping
    public ResponseEntity<Map<String, String>> testDbConnection() {
        Map<String, String> response = new HashMap<>();
        
        try {
            response.put("url_configured", System.getProperty("spring.datasource.url", System.getenv("DB_URL")));
            response.put("status", "attempting_connection");
            
            try (Connection conn = dataSource.getConnection()) {
                response.put("status", "success");
                response.put("message", "Successfully connected to the database!");
            }
        } catch (SQLException e) {
            response.put("status", "failed");
            response.put("error_message", e.getMessage());
            response.put("sql_state", e.getSQLState());
            response.put("error_code", String.valueOf(e.getErrorCode()));
        } catch (Exception e) {
            response.put("status", "failed_unknown");
            response.put("error_message", e.toString());
        }
        
        return ResponseEntity.ok(response);
    }

    @GetMapping("/api/db-tables")
    public ResponseEntity<?> checkTables() {
        Map<String, Object> response = new HashMap<>();
        try {
            Connection connection = dataSource.getConnection();
            if (connection != null && !connection.isClosed()) {
                response.put("status", "success");
                response.put("message", "Successfully connected to the database!");
                
                List<String> tables = new ArrayList<>();
                ResultSet rs = connection.getMetaData().getTables(null, null, "%", new String[]{"TABLE"});
                while (rs.next()) {
                    tables.add(rs.getString("TABLE_NAME"));
                }
                response.put("tables_found", tables);
                
                connection.close();
                return ResponseEntity.ok(response);
            } else {
                response.put("status", "error");
                response.put("message", "Connection was null or closed.");
                return ResponseEntity.status(500).body(response);
            }
        } catch (SQLException e) {
            response.put("status", "error");
            response.put("message", "Failed to connect to the database.");
            response.put("sql_state", e.getSQLState());
            response.put("error_code", e.getErrorCode());
            response.put("error_message", e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }
}
