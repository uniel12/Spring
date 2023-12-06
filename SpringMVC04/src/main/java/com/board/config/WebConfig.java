package com.board.config;


import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {
	// web.xml 파일을 대체할 클래스
	
	// Post 방식 인코딩
	@Override
	protected Filter[] getServletFilters() {
		// 새롭게 인코딩해주는 객체 생성
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		// 인코딩 방식 지정
		encodingFilter.setEncoding("UTF-8");
		// 인코딩 방식 적용
		encodingFilter.setForceEncoding(true);
		
		return new Filter[]{encodingFilter};
	}
	
	
	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {RootConfig.class};
	}


	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {ServletConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] {"/"};
	}

}
