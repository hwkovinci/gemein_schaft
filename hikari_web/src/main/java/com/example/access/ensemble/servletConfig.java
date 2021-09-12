package com.example.access.ensemble;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
/**
 * MVC Servlet Context Configuration.
 *
 * @author Kevin Leong
 */
@EnableWebMvc
@Configuration
@ComponentScan(basePackages = {"com.example.access.controller"}) // Scans the following packages for classes with @Controller annotations
public class servletConfig implements WebMvcConfigurer {
@Override
public void addResourceHandlers(ResourceHandlerRegistry registry){
    registry.addResourceHandler("css/**")
            .addResourceLocations("classpath:static/css/");
}

public void configureViewResolvers(ViewResolverRegistry registry) { registry.jsp("/WEB-INF/views/", ".jsp");
}
    /**
     * Provide a view resolver to map views to the correct template files.
     *
     * @return
     */


}
