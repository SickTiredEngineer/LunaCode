package com.itwillbs.luna_code.mapper.usermain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.usermain.MyClassDetailVO;
import com.itwillbs.luna_code.vo.usermain.PlayListVO;

@Mapper
public interface PlayListMapper {
	
	public List<PlayListVO> selectPlayListsByUserIdx(@Param("userIdx") int userIdx);
	
	public int insertPlayList(PlayListVO playlist);
	
	public int deletePlayList(@Param("playlistIdx") int playlistIdx, @Param("userIdx") int userIdx);
	
	public int updatePlayList(
			@Param("playlistIdx") int playlistIdx,
			@Param("playlistName") String playlistName,
			@Param("userIdx")int userIdx
	);

	public PlayListVO selectPlaylistById(@Param("playlistIdx") int playlistIdx,
			@Param("userIdx") int userIdx);
	
	public List<MyClassDetailVO.ClassEpisode> selectPlaylistItemsByIdx(int playlistIdx);
	
	public int insertPlaylistItem(@Param("playlistIdx") int playlistIdx,
			@Param("episodeIdx") int episodeIdx);
	
	public int deletePlaylistItem(@Param("itemIdx") int itemIdx, @Param("userIdx") int userIdx);
}
