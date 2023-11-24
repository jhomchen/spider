package com.jh.ssm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jh.ssm.dao.SongsMapper;
import com.jh.ssm.pojo.Pager;
import com.jh.ssm.pojo.Songs;
import com.jh.ssm.service.ISongsService;


@Service
public class SongsServiceImpl implements ISongsService {
	
	@Autowired
	private SongsMapper songsMapper;

	@Override
	public Integer getCountSongs(Songs songs) {
		// TODO Auto-generated method stub
		return songsMapper.selectCountSongs(songs);
	}

	@Override
	public List<Songs> getSongsByPage(Pager pager, Songs songs) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pager", pager);
		map.put("songs",songs);
		return songsMapper.selectSongsByPage(map);
	}

}
