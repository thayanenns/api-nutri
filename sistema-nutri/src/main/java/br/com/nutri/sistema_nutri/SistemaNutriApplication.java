package br.com.nutri.sistema_nutri;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController

public class SistemaNutriApplication {

	public static void main(String[] args) {
		SpringApplication.run(SistemaNutriApplication.class, args);
	}

	@GetMapping("/test")
		public String testEndpoint() {
			return "Spring Boot está funcionando!";
		}
}
