package com.itwillbs.luna_code.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.MemoMapper;
import com.itwillbs.luna_code.vo.MemoVo;

@Service
public class MemoService {

	@Autowired
    private MemoMapper memoMapper;

    public void addMemo(MemoVo memo) {
        memoMapper.insertMemo(memo);
    }

    public void removeMemo(int memo_idx) {
        memoMapper.deleteMemo(memo_idx);
    }

    public List<MemoVo> getMemos(int class_idx, int user_idx) {
        return memoMapper.selectMemosByClassAndUser(class_idx, user_idx);
    }
    
}
