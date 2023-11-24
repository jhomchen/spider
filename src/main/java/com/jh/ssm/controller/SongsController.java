package com.jh.ssm.controller;

import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jh.ssm.pojo.Pager;
import com.jh.ssm.pojo.Songs;
import com.jh.ssm.service.ISongsService;

@Controller
@RequestMapping("/songs")
public class SongsController {
	
	@Autowired
	private ISongsService songsService;
	
	@RequestMapping("toSongsList")
	public String toSongsList(HttpServletRequest request, Model model) {
		return "songs";
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("toSongsPage")
	@ResponseBody
	public Map<String,Object> toSongsPage(HttpServletRequest request,Integer rows,Integer page,Songs songs){
        //初始化分页类对象
        Pager pager=new Pager();
        pager.setCurPage(page);
        pager.setPerPageRows(rows);
        int totalCount=songsService.getCountSongs(songs);
        List<Songs> listSongs=songsService.getSongsByPage(pager, songs);
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("rows",listSongs);
        result.put("total",totalCount);
		return result;
	}
	
	/**
	 * 文件下载,从http://www.htqyy.com站点下载
	 * @param request
	 * @throws Exception 
	 */
	@RequestMapping("songsDownload")
	public void songsDownload(HttpServletRequest request,HttpServletResponse response,Songs songs) {
		    try {
	            URL url = new URL(songs.getLink());
	            URLConnection connection = url.openConnection();
	            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36");
	            connection.setRequestProperty("Referer", "http://www.htqyy.com");
	            connection.setRequestProperty("Connection", "keep-alive");
	            connection.setRequestProperty("Upgrade-Insecure-Requests", "1");
	            InputStream in = connection.getInputStream();
	            String filename = URLEncoder.encode(songs.getName()+".mp3","UTF-8");
	            response.addHeader("Content-Disposition", "attachment;filename=" + filename);
	            response.setContentType("multipart/form-data");
	            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
	            int len = 0;
	            while((len = in.read()) != -1){
	                out.write(len);
	                out.flush();
	            }
	            out.close();
	            in.close();
		    }catch(Exception e) {
		    	e.printStackTrace();
		    }
	}
	
	/**
	 * 跳转到网易云音
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("toWangyi")
	public String toWangyiMusic(HttpServletRequest request,Model model) {
		return "wangyimusic";
	}
	
	/**网易音乐下载
	 * @param request
	 * @param response
	 */
	@RequestMapping("downloadWY")
	public void downloadWY(HttpServletRequest request,HttpServletResponse response,String wyUrl,String wyID) {
	    try {
            URL url = new URL(wyUrl);
            URLConnection connection = url.openConnection();
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36");
            //connection.setRequestProperty("Referer", "http://www.htqyy.com");
            connection.setRequestProperty("Connection", "keep-alive");
            connection.setRequestProperty("Upgrade-Insecure-Requests", "1");
            InputStream in = connection.getInputStream();
            String filename = URLEncoder.encode(wyID+".mp3","UTF-8");
            response.addHeader("Content-Disposition", "attachment;filename=" + filename);
            response.setContentType("multipart/form-data");
            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
            int len = 0;
            while((len = in.read()) != -1){
                out.write(len);
                out.flush();
            }
            out.close();
            in.close();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}

}
