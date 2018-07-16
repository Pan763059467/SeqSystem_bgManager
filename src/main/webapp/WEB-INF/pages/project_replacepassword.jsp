<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:18:23 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改密码</title>
    <link rel="shortcut icon" href="<%=basePath%>/example/favicon.ico">
    <link href="<%=basePath%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<body class="gray-bg loginBackground" >
<div class="middle-box text-center loginscreen  animated fadeInDown ">
    <div class="loginForm" >
        <div class="text-center loginLogo" >
        </div>
        <form class="cmxform" id="signupForm">
            <div class="form-group col-sm-8 col-md-offset-2 loginLine">
                <input name="name" id="name" type="text" aria-required="true" aria-invalid="true" class="form-control loginLine valiadate" style="font-size:12px" placeholder="输入管理员账号" required="">
            </div>
            <div class="form-group col-sm-8 col-md-offset-2 loginLine">
                <input name="password0" id="password0" type="password" class="form-control loginLine valiadate" style="font-size:12px" maxlength="22" placeholder="请输入原密码" required="">
            </div>
            <div class="form-group col-sm-8 col-md-offset-2 loginLine">
                <input name="password1" id="password1" type="password" class="form-control loginLine valiadate" style="font-size:12px" maxlength="22" placeholder="请输入新密码（长度为6-22个字符）" required="">
            </div>
            <div class="form-group col-sm-8 col-md-offset-2 loginLine">
                <input name="password2" id="password2" type="password" class="form-control loginLine valiadate" style="font-size:12px" maxlength="22" placeholder="请再次输入密码确认" required="">
            </div>
            <h6>&nbsp;</h6>
            <div class="form-group">
                <button id="replacepassword_button" class="btn btn-w-m btn-Bblack btn-sm">修改密码</button>
            </div>
            <div class="form-group" >
                <p class="text-muted text-center" > <a href="login-jmpLogin"><small>点我登录</small></a> | <a href="login-jmpSPReplacepassword"><small>超级管理员</small></a></p>
            </div>
        </form>
    </div>
</div>
<script src="<%=basePath%>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=basePath%>/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath%>/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath%>/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/contabs.min.js"></script>
<script src="<%=basePath%>/js/plugins/pace/pace.min.js"></script>
<script src="<%=basePath%>/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script src="<%=basePath%>/js/plugins/toastr/toastr.min.js"></script>
<script src="<%=basePath%>/js/mjy.js"></script>
<script src="<%=basePath%>/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<script src="<%=basePath%>/js/md5.js"></script>
<script src="<%=basePath%>/js/passwordLevel.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
</body>
<script>
    //表单验证
    $.validator.setDefaults({
        submitHandler: function() {
        }
    });
    $.validator.addMethod("strongPsw", function(value, element) {
        if(passwordLevel(value) === 1){return false;}
        return true
    }, "格式不符合");
    $().ready(function() {
        var password1 = $("input#password1").val();
        var pwdLevel = passwordLevel(password1);
// 在键盘按下并释放及提交后验证提交表单
        $("#signupForm").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 2
                },
                password0: {
                    required: true,
                    minlength: 6
                },
                password1: {
                    required: true,
                    minlength: 6,
                    strongPsw: pwdLevel
                },
                password2: {
                    required: true,
                    minlength: 6,
                    equalTo: "#password1"
                }
            },messages: {
                name: {
                    required: "请输入管理员名",
                    minlength: "用户名长度不能小于 2 位"
                },
                password0: {
                    required: "请输入原密码",
                    minlength: "密码长度不能小于 6 位"
                },
                password1: {
                    required: "请输入新密码",
                    minlength: "密码长度不能小于 6 位",
                    strongPsw: "密码须包含两种字符以上"
                },
                password2: {
                    required: "请输入正确的新密码",
                    minlength: "密码长度不能小于 6 位",
                    equalTo: "两次密码输入不一致"
                }
            }
        });
    });
    //以上为表单验证
    var state="true";
    $("button#replacepassword_button").click(function () {
        $(".valiadate").each(function(){
            if(($(this).attr("aria-invalid")==="undefined")||($(this).attr("aria-invalid")==="true")){
                state="false";
                return;
            }
        });
        if(state==="false") {
            var state="true";
            swal("输入有误", "请根据提示修改您的输入的信息", "error");

        }
        else{
            var md5PWD0 = $("input#password0").val();
            var formerPassword = hex_md5(md5PWD0);
            var md5PWD1 = $("input#password1").val();
            var tempPassword= hex_md5(md5PWD1);
            var md5PWD2 = $("input#password2").val();
            var newPassword = hex_md5(md5PWD2);
            $.ajax({
                url: "login-changePassword",
                data: {
                    name: $("input#name").val(),
                    formerPassword:formerPassword,
                    tempPassword: tempPassword,
                    newPassword: newPassword
                },
                dataType: "json",
                type: "Post",
                async: "false",
                success: function (result) {
                    if (result.res === true) {
                        swal({
                            title: "修改成功!",
                            text: "点击下方按钮回登陆页面",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        }, function () {
                            location.href = "login-jmpLogin"
                        })
                    }
                    else if (result.res === false)
                        swal("修改密码失败！", "请确认账户，密码。", "error");
                },
                error: function () {
                    swal("修改密码失败！", "服务器异常。", "error");
                }
            })
        }
    })
    var clock = '';
    var nums = 60;
    var btn;
    function sendCode(thisBtn)
    {
        btn = thisBtn;
        btn.disabled = true; //将按钮置为不可点击
        btn.value = nums+'秒后可重新获取';
        clock = setInterval(doLoop, 1000); //一秒执行一次
    }
    function doLoop()
    {
        nums--;
        if(nums > 0){
            btn.value = nums+'秒后可重新获取';
        }else{
            clearInterval(clock); //清除js定时器
            btn.disabled = false;
            btn.value = '点击发送验证码';
            nums = 60; //重置时间
        }
    }

</script>


<!-- Mirrored from www.zi-han.net/theme/hplus/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:18:23 GMT -->
</html>