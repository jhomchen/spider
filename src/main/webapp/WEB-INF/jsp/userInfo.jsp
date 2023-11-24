<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
    <title></title>
    <link href="../js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="../css/table.css" rel="stylesheet" type="text/css" />
    <style>
        .notice_nav a:nth-child(3){border-top-right-radius: 0;border-bottom-right-radius:0}
        .notice_nav a:nth-child(4){border-top-right-radius: 4px;border-bottom-right-radius: 4px}
    </style>
</head>
<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="notice_main">

    <div class="notice_check">
        <div class="btn-group l_left" style="margin-right: 4px">
            <button type="button" class="btn btn-default change" style="height: 30px;line-height: 30px;padding: 0 12px !important;font-size: 12px">选择条件</button>
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="height: 30px;line-height: 30px">
                <span class="caret"></span>
                <span class="sr-only"></span>
            </button>
            <ul class="dropdown-menu">
                <li>用户名</li>
                <li>部门名称</li>
                <li>职位名称</li>
            </ul>
        </div>
        <div class="l_left">
            <input type="text" class="find_input">

        </div>
        <button class="check_btn">查询</button>


        <div class="notice_nav r_right">
            <a class="btn btn-default" onclick="addUser()"><span class="glyphicon glyphicon-plus"></span>新增</a>
            <a class="btn btn-default"><span class="glyphicon glyphicon-remove"></span>删除</a>
            <a class="btn btn-default" onclick="addUser()"><span class="glyphicon glyphicon-pencil"></span>编辑</a>
            <a class="btn btn-default" onclick="reset_password()"><span class="glyphicon glyphicon-lock"></span>重置密码</a>
        </div>
        <div class="clear"></div>
    </div>


    <table id="table" class="table_style" style="margin: 0 auto" > </table>

</div>

<script src="../js/jquery/jQuery-2.2.0.min.js"></script>
<script src="../js/bstable/js/bootstrap.min.js"></script>
<script src="../js/bstable/js/bootstrap-table.js"></script>
<script src="../js/bstable/js/bootstrap-table-zh-CN.min.js"></script>
<script src="../js/layer_v2.1/layer/layer.js"></script>
<script>
    $(function () {
        change();
        $('#table').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "/user/getAllUser",
            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    checkbox: "true",
                    field: 'check',
                    align: 'center',
                    valign: 'middle'
                },
                {
                	visible: "false",
                    field: 'id',
                    align: 'center',
                    valign: 'middle'
                }
                ,
                {
                    title: "用户名",
                    field: 'name',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '手机号',
                    field: 'phone',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '邮箱',
                    field: 'email',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '性别',
                    field: 'gender',
                    align: 'center'
                },
                {
                    title: '年龄',
                    field: 'age',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '是否封禁',
                    field: 'ban',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '备注',
                    field: 'mark',
                    align: 'center'
                },
                {
                    title: '创建时间',
                    field: 'createTime',
                    align: 'center'
                },
                {
                    title: '更新时间',
                    field: 'updateTime',
                    align: 'center'
                }
            ]
        });
    });
    function change(){
        $(".dropdown-menu>li").click(function(){
            $(".change").html($(this).html())
        })
    }
    function addUser(){
        layer.open({
            type: 2,
            title: '添加新用户',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
            closeBtn:1,
            area: ['700px', '474px'],
            content: 'user_tail.html'
        });
    }
    function reset_password(){
        layer.open({
            type: 2,
            title: '重置密码',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
            closeBtn:1,
            area: ['500px', '280px'],
            content: 'user_password.html'
        });
    }

</script>
</body>
</html>
