package com.itwillbs.luna_code.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.ClassMapper;
import com.itwillbs.luna_code.mapper.OnlineClassMapper;

@Service
public class OnlineClassService {

    @Autowired
    private OnlineClassMapper onlineclassmapper;
    
    public String getUrlByClassId(int classId) {
        return onlineclassmapper.selectUrlByClassId(classId);
    }


}
