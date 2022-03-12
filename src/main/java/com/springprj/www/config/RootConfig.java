package com.springprj.www.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@EnableScheduling
@Configuration
@ComponentScan(basePackages = { "com.springprj.www.service", "com.springprj.www.handler" })
@MapperScan(basePackages = { "com.springprj.www.repository" })
@EnableAspectJAutoProxy
@EnableTransactionManagement
public class RootConfig {

	@Autowired
	ApplicationContext applicationContext;

	@Bean
	public DataSource dataSource() {
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
//		hikariConfig.setJdbcUrl("jdbc:log4jdbc:mysql://localhost:3306/springprj?serverTimezone=Asia/Seoul");
		hikariConfig.setJdbcUrl("jdbc:log4jdbc:mysql://localhost/pachipico");
//		hikariConfig.setUsername("root");
//		hikariConfig.setPassword("jimmywin12");
		hikariConfig.setUsername("pachipico");
		hikariConfig.setPassword("jimmywin12@");
		hikariConfig.setMinimumIdle(5);

		hikariConfig.setConnectionTestQuery("SELECT now()");
		hikariConfig.setPoolName("springHikariCP");

		hikariConfig.addDataSourceProperty("dataSource.cachePrepStmts", "true");
		hikariConfig.addDataSourceProperty("dataSource.prepStmtCacheSize", "200");
		hikariConfig.addDataSourceProperty("dataSource.prepStmtCacheSqlLimit", "true");
		hikariConfig.addDataSourceProperty("dataSource.useServerPrepStmts", "true");

		HikariDataSource hikariDataSource = new HikariDataSource(hikariConfig);
		return hikariDataSource;
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlFactoryBean = new SqlSessionFactoryBean();
		sqlFactoryBean.setDataSource(dataSource());
		sqlFactoryBean.setConfigLocation(applicationContext.getResource("classpath:/MybatisConfig.xml"));
		sqlFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mappers/*.xml"));
		return (SqlSessionFactory) sqlFactoryBean.getObject();
	}

	@Bean
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}

}
