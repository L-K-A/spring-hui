<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台登录</title>
    <link href="statics/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="statics/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
    <link href="statics/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
    <link href="statics/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/verify.css">

    <script type="text/javascript" src="js/jquery.validation/1.14.0/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/jquery/jquery.js"></script>
    <script type="text/javascript" src="statics/h-ui/js/H-ui.min.js"></script>
    <script type="text/javascript" src="css/verify.js" ></script>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
    <div id="loginform" class="loginBox">
        <form class="form form-horizontal" action="gologin.action" method="post">
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                <div class="formControls col-xs-8">
                    <input id="" name="personname" type="text" placeholder="账户名"
                           class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                <div class="formControls col-xs-8">
                    <input id="" name="personpwd" type="password" placeholder="密码"
                           class="input-text size-L">
                </div>
            </div>

            <div class="row cl" >
                <div class="formControls col-xs-8 col-xs-offset-3" id="mpanel3" ></div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <label for="online">
                        <input type="checkbox" name="online" id="online" value="">
                        使我保持登录状态</label>
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <input name="" id="check-btn2" type="submit"
                           class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                </div>
            </div>
        </form>
    </div>
</div>


<script>

    $('#mpanel3').codeVerify({
        type : 2,
        figure : 50,	//位数，仅在type=2时生效
        arith : 0,	//算法，支持加减乘，不填为随机，仅在type=2时生效
        width : '200px',
        height : '45px',
        fontSize : '27px',
        btnId : 'check-btn2',
        ready : function() {
        },
        success : function() {
            alert('验证成功！');
        },
        error : function() {
            alert('验证码不成功！');
        }
    });


    /*$("#check-btn2").on("click",function () {
        $.ajax({
            type:'POST',
            dataType:'json',
            url:'/gologin',
            data:{
                personname:$("#personname").val(),
                personpwd:$("#personpwd").val()
            },
            success: function  (rsg) {
                result = rsg.result;
                console.log(result);
            }
        });
    })*/
</script>
</body>
</html>