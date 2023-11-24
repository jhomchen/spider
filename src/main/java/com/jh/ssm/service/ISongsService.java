package com.jh.ssm.service;

import java.util.List;

import com.jh.ssm.pojo.Pager;
import com.jh.ssm.pojo.Songs;

public interface ISongsService {
	
	
	public Integer getCountSongs(Songs songs);
	
	
	public List<Songs> getSongsByPage(Pager pager,Songs songs);

}
