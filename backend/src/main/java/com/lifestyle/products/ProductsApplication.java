package com.lifestyle.products;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import java.net.URI;

@SpringBootApplication
public class ProductsApplication {

	public static void main(String[] args) {
		String dbUrl = System.getenv("MYSQL_URL");
		if (dbUrl == null) dbUrl = System.getenv("DATABASE_URL");
		if (dbUrl == null) dbUrl = System.getenv("DB_URL");
		
		if (dbUrl != null && dbUrl.startsWith("mysql://")) {
			try {
				URI uri = new URI(dbUrl);
				String host = uri.getHost();
				int port = uri.getPort() > 0 ? uri.getPort() : 3306;
				String path = uri.getPath();
				String query = uri.getQuery();
				String userInfo = uri.getUserInfo();
				
				if (userInfo != null && userInfo.contains(":")) {
					String[] auth = userInfo.split(":", 2);
					System.setProperty("spring.datasource.username", java.net.URLDecoder.decode(auth[0], "UTF-8"));
					System.setProperty("spring.datasource.password", java.net.URLDecoder.decode(auth[1], "UTF-8"));
				}
				
				String jdbcUrl = "jdbc:mysql://" + host + ":" + port + path;
				if (query != null) {
					jdbcUrl += "?" + query.replace("ssl-mode=", "sslMode=");
				} else {
					jdbcUrl += "?sslMode=REQUIRED&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
				}
				System.setProperty("spring.datasource.url", jdbcUrl);
                System.out.println("Configured JDBC URL from environment: " + jdbcUrl);
			} catch (Exception e) {
				System.err.println("Failed to parse database URL: " + dbUrl);
			}
		}

		SpringApplication.run(ProductsApplication.class, args);
	}
}
