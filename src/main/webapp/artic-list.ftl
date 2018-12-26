<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>资讯列表</title>

    <link rel="stylesheet" href="css/laypage.css">
    <link rel="stylesheet" href="js/layer/skin/default/layer.css">
    <link rel="stylesheet" href="statics/h-ui/css/H-ui.min.css">
    <link rel="stylesheet" href="statics/h-ui.admin/css/H-ui.admin.css">
    <link rel="stylesheet" href="statics/Hui-iconfont/1.0.8/iconfont.css">
    <link rel="stylesheet" href="statics/h-ui.admin/skin/default/skin.css" id="skin">
    <link rel="stylesheet" href="statics/h-ui.admin/css/style.css">




</head>
<body>

<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span>资讯管理
    <span class="c-gray en">&gt;</span> 资讯列表
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="Hui-iconfont">&#xe68f;</i></a>
</nav>

<div class="page-container" id="app">
    <div class="text-c">
        <button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
        <span class="select-box inline">
		<select name="" class="select">
			<option value="0">全部分类</option>
			<option value="1">分类一</option>
			<option value="2">分类二</option>
		</select>
		</span> 日期范围：
        <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin"
               class="input-text Wdate" style="width:120px;">
        -
        <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax"
               class="input-text Wdate" style="width:120px;">
        <input type="text" name="" id="personname" placeholder=" 资讯名称" style="width:250px" class="input-text">
        <button name="" id="finduserlist" class="btn btn-success" type="submit">
            <i class="Hui-iconfont">&#xe665;</i> 搜资讯
        </button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                <i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
            <a class="btn btn-primary radius" data-title="添加资讯" data-href=""
                    onclick="Hui_admin_tab(this)" href="">
                <i class="Hui-iconfont">&#xe600;</i> 添加资讯</a></span>
        <span class="r">共有数据：<strong>{{totalpage}}</strong> 条</span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="80">ID</th>
                <th>姓名</th>
                <th width="80">年龄</th>
                <th width="80">电话</th>
                <th width="120">更新时间</th>
                <th width="75">角色</th>
                <th width="60">发布状态</th>
                <th width="120">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr class="text-c" v-for="(item,index) in result">
                <td><input type="checkbox" value="" name=""></td>
                <td>{{item.pid}}</td>
                <td class="text-l">
                <u style="cursor:pointer" class="text-primary" onClick="" title="查看">{{item.personname}}</u></td>
                <td>{{item.personage}}</td>
                <td>{{item.persontel}}</td>
                <td>2014-6-11 11:11:42</td>
                <td>{{item.flate}}</td>
                <td class="td-status">
                    <span class="label label-success radius">已发布</span>
                </td>
                <td class="f-14 td-manage">
                    <a style="text-decoration:none" onClick="article_stop(this,'10001')" href="javascript:;" title="下架">
                        <i class="Hui-iconfont">&#xe6de;</i></a>
                    <a style="text-decoration:none" class="ml-5"
                       onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑">
                        <i class="Hui-iconfont">&#xe6df;</i></a>
                    <a style="text-decoration:none" class="ml-5" @click="deleteitem(item.pid)" href="#" title="删除">
                        <i class="Hui-iconfont">&#xe6e2;</i></a>
                </td>
            </tr>
            </tbody>
        </table>
        <div id="pagenave" style="margin:10px 400px"></div>
    </div>

</div>
<script type="text/javascript" src="js/vue/vue.min.js"></script>
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/laypage/laypage.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>




<SCRIPT type="text/javascript" src="statics/h-ui/js/H-ui.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="statics/h-ui.admin/js/H-ui.admin.js"></SCRIPT>
<script type="text/javascript">
    var totalpage;

    var app = new Vue({
        el: '#app',
        data: {
            result: []
        }
    });
    /*加载用户列表*/
    var getUserLista = function (curr) {
        $.ajax({
            type: 'POST',
            dataType: 'json',
            url: '/userlist.action',
            data: {
                pageNum: curr || 1,
                pageSize: 2
            },
            success: function (msg) {
                app.result = msg.pagelist;
                app.totalpage = msg.totalPage;
                laypage({
                    cont: 'pagenave',
                    pages: msg.totalPage,
                    skip: true,
                    skin: '#189',
                    curr: curr || 1,
                    jump: function (obj, first) {
                        if (!first) {
                            getUserLista(obj.curr);
                        }
                    }
                });
            }
        });
    }

    getUserLista();

    //查询
    $("#finduserlist").click(function () {
        getUserLista();
    });

    var deleteitem = function (pid) {
        layer.confirm('是否删除?', {btn: ['确定删除', '考虑一下']},
            function () {
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    url: '/userdelete.action',
                    data: {pid: pid},
                    success: function (msg) {
                        if (msg.resu > 0) {
                            getUserLista();
                            layer.msg("用户" + pid + "成功删除", {icon: 6});
                        }
                    }
                });
            });
    }
</script>
</body>
</html>