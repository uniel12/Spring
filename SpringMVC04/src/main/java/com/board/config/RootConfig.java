package com.board.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration // 설정파일을 만들기 위한 어노테이션
@MapperScan(basePackages = { "com.board.mapper" })
@PropertySource("classpath:persistence.properties")
public class RootConfig {

	// root-context.xml 파일을 대체할 클래스
	// properties 파일에서 driver,url,user,password를 가져와야함
	// 환경 오브젝트

	@Autowired
	private Environment env;


	public DataSource dataSource() {

		HikariConfig hikariConfig = new HikariConfig();

		try {
			Class.forName(env.getProperty("jdbc.driver"));

			hikariConfig.setDriverClassName(env.getProperty("jdbc.driver"));
			hikariConfig.setJdbcUrl(env.getProperty("jdbc.url"));
			hikariConfig.setUsername(env.getProperty("jdbc.user"));
			hikariConfig.setPassword(env.getProperty("jdbc.password"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		HikariDataSource dataSource = new HikariDataSource(hikariConfig);

		return dataSource;

	}

	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(dataSource());
		return factoryBean.getObject();
	}
	
	

}
