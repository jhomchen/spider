<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
    <title></title>
    <link href="../js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="../css/table.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1150px;overflow: auto">
<div class="notice_main ">
    <div class="notice_check notice_check_last" style="padding: 16px 15px 8px 15px">
        <p>
            <label class="">名称：</label>
            <input type="text" class="find_input" id="tname">
            <label class="">专辑：</label>
            <input type="text" class="find_input" id="tablum">
            <label class="">分类：</label>
            <select class="find_input" id="tcategory">
               <option value="全部">全部</option>
               <option value="纯音乐">纯音乐</option>
               <option value="新世纪">新世纪</option>
               <option value="钢琴曲">钢琴曲</option>
               <option value="减压放松">减压放松</option>
               <option value="中国音乐">中国音乐</option>
               <option value="天籁之音">天籁之音</option>
               <option value="电影原声">电影原声</option>
               <option value="背景音乐">背景音乐</option>
               <option value="手机铃声">手机铃声</option>
               <option value="胎教音乐">胎教音乐</option>
               <option value="佛乐">佛乐</option>
            </select>
             <button class="check_btn" id="queryButton">查询</button>
        </p>
    </div>
    <div class="notice_check  notice_check_last">
        <p class="l_left">
        <div class="notice_nav r_left">
            <a class="btn btn-default" onclick="addRole()"><span class="glyphicon glyphicon-plus"></span>新增</a>
            <a class="btn btn-default"><span class="glyphicon glyphicon-remove"></span>删除</a>
            <a class="btn btn-default" onclick="addRole()"><span class="glyphicon glyphicon-pencil"></span>编辑</a>
            <a class="btn btn-default" onclick="downloadSong()"><span class="glyphicon glyphicon-download"></span>下载</a>
            
        </div>
        </p>
        <div class="clear"></div>
        </div>
    <table id="table" class="table_style" style="margin: 0 auto" > </table>
</div>

<script src="../js/jquery/jQuery-2.2.0.min.js"></script>
<script src="../js/bstable/js/bootstrap.min.js"></script>
<script src="../js/bstable/js/bootstrap-table.js"></script>
<script src="../js/bstable/js/bootstrap-table-zh-CN.min.js"></script>
<script src="../js/layer_v2.1/layer/layer.js"></script>
<script type="text/javascript">
	$(function (){
		initTable();
		$("#queryButton").bind("click", initTable);
	});
    
    function initTable(){
    	$('#table').bootstrapTable("destroy");
    	$('#table').bootstrapTable({
            method: "post",
            striped: true,
            singleSelect: true,
            url: "/songs/toSongsPage",
            dataType: "json",
            pagination: true, //分页
            pageSize: 8,
            pageNumber: 1,
            pageList: [8,16,32,64],   //可供选择的每页的行数
            smartDisplay:false, 
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParamsType:"undefined",    //设置参数格式
            queryParams:function queryParams(params) {  //设置查询参数page和rows
                //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                var param={
                    page:params.pageNumber, //首页页码
                    rows:params.pageSize,    //每页的记录行数
                    name:$("#tname").val(),
                    ablum:$("#tablum").val(),
                    category:$("#tcategory").val()
                };
                return param;
            },
            cache:false,        //禁用AJAX数据缓存
            sidePagination: 'server',   //服务端处理分页
            columns: [
                {
                    checkbox: "true",
                    field: 'check',
                    align: 'center',
                    valign: 'middle'
                }
                ,
                {
                    title: "ID",
                    field: 'id',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '名称',
                    field: 'name',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '专辑',
                    field: 'ablum',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '链接',
                    field: 'link',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '分类',
                    field: 'category',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '描述',
                    field: 'descr',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '创建时间',
                    field: 'date',
                    align: 'center',
                    valign: 'middle'
                }
            ]
        });
    }
    
    //音乐下载
    function downloadSong(){
    	var ss = $('#table').bootstrapTable('getSelections');
    	if(ss.length>0){
   		  if(!confirm("确定要下载吗？")){
   		        return false;
   		   }
   		  var url="/songs/songsDownload?name="+ss[0].name+"&link="+ss[0].link;
   		  window.location.href=url;
    	}else{
    		window.alert("请选择数据！");
    	}
    }

    function addRole(){
        layer.open({
            type: 2,
            title: '添加角色',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
            closeBtn:1,
            area: ['700px', '474px'],
            content: 'user_tail.html'
        });
    }
    function warrant(){
        layer.open({
            type: 2,
            title: '角色授权',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
            closeBtn:1,
            area: ['700px', '474px'],
            content: 'user_tail.html'
        });
    }
</script>
</body>
</html>
