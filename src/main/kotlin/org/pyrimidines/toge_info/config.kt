package org.pyrimidines.toge_info.config

import org.springframework.boot.web.servlet.FilterRegistrationBean
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.core.Ordered
import org.springframework.web.filter.CharacterEncodingFilter
import org.springframework.web.servlet.config.annotation.CorsRegistry
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer


@Configuration
class WebConfig : WebMvcConfigurer {
    @Bean
    fun characterEncodingFilterRegistrationBean(): FilterRegistrationBean<CharacterEncodingFilter> {
        val filter = CharacterEncodingFilter().apply {
            encoding = "UTF-8"
            setForceEncoding(true)
        }
        return FilterRegistrationBean<CharacterEncodingFilter>().apply {
            this.filter = filter
            order = Ordered.HIGHEST_PRECEDENCE
        }
    }

    override fun addCorsMappings(registry: CorsRegistry) {
        registry.addMapping("/**")
            .allowedOrigins("http://localhost:3000")
            .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
            .allowedHeaders("*")
            .allowCredentials(true)
    }
}

@Configuration
class WebMvcConfig : WebMvcConfigurer {
    override fun addResourceHandlers(registry: ResourceHandlerRegistry) {
        // /api/ 접두사가 붙은 요청을 정적 리소스 폴더와 매핑
        registry.addResourceHandler("/api/**")
            .addResourceLocations("classpath:/static/")
    }
}