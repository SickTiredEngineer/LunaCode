package com.itwillbs.luna_code.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.ClassEpisodeMapper;
import com.itwillbs.luna_code.vo.EpisodeVo;

@Service
public class EpisodeService {

	@Autowired
	private ClassEpisodeMapper classEpisodeMapper;

    public List<EpisodeVo> selectEpisodeList() {
        return classEpisodeMapper.selectEpisodeList();
    }
}