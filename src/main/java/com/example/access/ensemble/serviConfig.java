package com.example.access.ensemble;

import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;

import com.example.access.repo.cenTrale;

import java.util.List;

@Configuration
@ComponentScan(basePackages = {"com.example.access.service"}) 
public class serviConfig {
@Autowired
private JdbcTemplate modEle;
private cenTrale cT;

    @Bean
    public cenTrale donNe() {
        cT = new cenTrale();
        cT.setTemplate(modEle);
        return cT;
    }

}
