package com.itwillbs.luna_code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.MemoVo;

@Mapper
public interface MemoMapper {
	
	void insertMemo(MemoVo memo);
    void deleteMemo(int memo_idx);
    List<MemoVo> selectMemosByClassAndUser(@Param("class_idx") int class_idx, @Param("user_idx") int user_idx);

	
}
