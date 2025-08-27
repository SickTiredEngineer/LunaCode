package com.itwillbs.luna_code.service.usermain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.vo.usermain.PlayListVO;
import com.itwillbs.luna_code.mapper.usermain.PlayListMapper;

@Service
public class PlayListService {
	
	@Autowired
	private PlayListMapper playListMapper;
	
	public List<PlayListVO> getPlayList(int userIdx){
		return playListMapper.selectPlayListsByUserIdx(userIdx);
	}
	
	public int addPlaylist(PlayListVO playlist) {
	    return playListMapper.insertPlayList(playlist);
	}
	
	public int deletePlayList(int playlistIdx, int userIdx) {
	    return playListMapper.deletePlayList(playlistIdx, userIdx);
	}
	
	public int updatePlayList(int playlistIdx, String playlistName, int userIdx) {
	    return playListMapper.updatePlayList(playlistIdx, playlistName, userIdx);
	}
	
	public PlayListVO getPlaylistById(int playlistIdx, int userIdx) {
	    return playListMapper.selectPlaylistById(playlistIdx, userIdx);
	}
}
