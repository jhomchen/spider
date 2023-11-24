package com.jh.ssm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.jh.ssm.pojo.Songs;

public interface SongsMapper {
	
	public Songs selectSongsByPrimaryKey(@Param("id")int id);
	
	public List<Songs> selectSongsByPage(Map<String,Object> map);
	
	public Integer selectCountSongs(Songs songs);

}
