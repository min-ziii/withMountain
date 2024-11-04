package com.test.hike.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration // 환경설정 클래스입니다. 라는 의미
@EnableSwagger2 // Swagger2 기반의 설정(Swagger2 동작 가능)을 하겠습니다. 라는 의미
public class SwaggerConfig {

	// API Document를 만드는 method
		@Bean // @Configuration이 붙은 클래스의 @Bean이 붙은 메서드는 자료형이 Bean이 된다.
		public Docket api() {
			return new Docket(DocumentationType.SWAGGER_2)
						.apiInfo(getApiInfo()) // 문서 정보
						.select() // 문서 빌드 시작
						.apis(RequestHandlerSelectors.basePackage("com.test.ajax")) // root 패키지
						.paths(PathSelectors.any()) // 어떤 경로의 기능을 포함시킬 것인지? (any: 전부)
						//.paths(PathSelectors.ant("/user/sec/XXX")) (ant: 특정)
						.build();
		}
		
		// 문서 제목, 버전, 설명 등 API의 기본 설명을 가지고 있는 method
		private ApiInfo getApiInfo() {
			return new ApiInfoBuilder()
						.title("User REST API")
						.version("0.0.1")
						.description("User 데이터에 대한 REST API 명세입니다.")
						.build();
		}
}
