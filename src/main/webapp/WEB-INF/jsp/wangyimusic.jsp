<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
    <title></title>
    <link href="../js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.treetable.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css">
    <link href="../css/table.css" rel="stylesheet" type="text/css">

</head>
<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="notice_main">
    <h6>网易云音乐</h6>
    <div style="border-bottom: 1px #ccc solid;padding-bottom: 8px">
        <p style="line-height: 24px;font-size: 14px;padding: 4px 0 0 36px ;color:#bb8940;background-image: url(../img/ts_03.png);background-repeat: no-repeat;background-position: 10px 8px;font-weight: bold">温馨提示</p>
        <ul class="ts">
            <li><span>*</span>解析出来能播放的就能下载。</li>
        </ul>
    </div>
    <div class="goods_main" >
        <div><label>网易音乐ID：</label><input id="music_id" type="text" placeholder="请输入音乐ID" class="goods_input"></div>
        <div><div class="l_left">
              <iframe id="wy_player" style="display:none;" frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=5257138&auto=1&height=66"></iframe>
        </div>
        <div class="good_btn"><button onclick="jiexi()">解析</button></div>
        <div class="good_btn"><button onclick="download()">下载</button></div>
    </div>
</div>

<script src="../js/jquery/jQuery-2.2.0.min.js"></script>
<script src="../js/date/js/laydate.js"></script>
<script>
    // http://music.163.com/song/media/outer/url?id=5257138.mp3
    function jiexi(){
    	var mid=$("#music_id").val();
    	if(mid && /[^\s]/.test(mid)) {
    		$("#wy_player").attr("src","//music.163.com/outchain/player?type=2&id="+mid+"&auto=1&height=66");
    		$("#wy_player").css("display","block");
    	}else{
    		window.alert("ID不能为空");
    	}
    }
    
    function download(){
    	  var mid=$("#music_id").val();
    	  if(!(mid && /[^\s]/.test(mid))) {
    		  window.alert("ID不能为空");
    		  return false;
    	  }
		  if(!confirm("确定要下载吗？")){
		        return false;
		   }
    	 
    	 var url="http://music.163.com/song/media/outer/url?id="+mid+".mp3";
    	//var url="https://cdn2.ear0.com:3321/preview?soundid=20650&type=mp3";
    	 window.location.href="/songs/downloadWY?wyUrl="+url+"&wyID="+mid;
    		 
    }
</script>
</body>
</html>
