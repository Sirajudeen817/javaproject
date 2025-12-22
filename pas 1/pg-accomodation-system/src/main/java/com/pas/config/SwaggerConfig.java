package com.pas.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.info.Contact;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

    @Bean
    OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("PG Accommodation API")
                        .version("2.0")
                        .description("REST API for PG Accommodation Management System")
                        .contact(new Contact()
                                .name("Sham Sivakumar")
                                .email("shamsivakumar2003@gmail.com")
                                .url("http://github.com/Sham2003"))
                        .license(new License()
                        		.name("Apache 2.0")));
    }
}