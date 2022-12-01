package com.sdhcompany.home;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class Myprofilehome0120221124Application extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(Myprofilehome0120221124Application.class, args);
	}

	@Override
	   protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
	      // TODO Auto-generated method stub
	      return builder.sources(Myprofilehome0120221124Application.class);
	   }

}
