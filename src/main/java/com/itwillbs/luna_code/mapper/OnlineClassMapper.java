package com.itwillbs.luna_code.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.ClassVo;
import com.itwillbs.luna_code.vo.OnlineClassVo;

@Mapper
public interface OnlineClassMapper {

	String selectUrlByClassId(int classId);

    int insertClass(ClassVo classVo);

}

