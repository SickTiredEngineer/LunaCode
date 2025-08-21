package com.itwillbs.luna_code.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.ClassVo;

@Mapper
public interface ClassMapper {

	int insertClass(ClassVo classVo);


	
}
