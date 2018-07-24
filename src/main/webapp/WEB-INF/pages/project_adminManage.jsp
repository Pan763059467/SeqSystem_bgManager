<%--
  Created by IntelliJ IDEA.
  User: zww
  Date: 2018/7/13
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>管理员管理</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <link rel="shortcut icon" href="<%=basePath %>/example/favicon.ico">
    <link href="<%=basePath%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <!-- bootstrap-table -->
    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<%=basePath%>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

</head>

<body class="gray-bg">
<div id="page-wrapper" class="white-bg dashbard-1">
    <div class=" row wrapper white-bg" id="content-main">
        <ol class="breadcrumb" style="margin-left: 40px">
            <li style="font-size: 15px">
                <strong>
                    <a href="user-jmpHomepage">后台管理系统首页</a> >><a href="adminManage-jmpAdminManage">管理员管理</a>
                </strong>
            </li>
        </ol>
    </div>
    <div style="padding: 20px" class="col-md-6">
        <div id="addAdmin"><div class="ibox float-e-margins">
            <div class="ibox-title">
                <div style="float: left;margin-left: 5px"><span><strong>新增管理员</strong></span></div>
            </div>
            <div style="padding-left: 80px" class="ibox-content">
                <form class="form" id="addForm" style="width:400px;border-left: none;border-right: none">
                    <tbody>
                    <tr >
                        <th style="width: 150px;text-align: center">新增管理员名:</th>
                        <th>
                            <input name="name" id="name" type="text" class="form-control loginLine valiadate" style="font-size:13px" placeholder="请输入新增管理员的账户" maxlength="15" required="">
                        </th>
                    </tr>
                    <br/>
                    <tr >
                        <th style="width: 150px;text-align: center">密码:</th>
                        <th>
                            <input name="password" id="password"  type="text" class="form-control loginLine valiadate" style="font-size:13px" placeholder="请输入密码" maxlength="22" required="">
                        </th>
                    </tr>
                    </tbody>
                </form>
                <div id="test1" style="margin-left: 200px;margin-top: 15px" >
                    <button id="addManager_button" style="height: 30px;width: 80px" type="button" class="btn btn-info text-center btn-xs" data-toggle="modal" data-target="#myModal">确认新增</button>
                </div>
            </div>
        </div></div>
        <div id="rePassword">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <div style="float: left;margin-left: 5px"><span><strong>重置管理员密码</strong></span></div>
                </div>
                <div style="padding-left: 80px" class="ibox-content">
                    <form class="form" id="replaceForm" style="width:400px;border-left: none;border-right: none">
                        <tbody>
                        <tr >
                            <th style="width: 150px;text-align: center">管理员名:</th>
                            <th>
                                <input name="name" id="name1" type="text" class="form-control loginLine valiadate" style="font-size:13px" placeholder="请输入待重置管理员的账户" maxlength="15" required="">
                            </th>
                        </tr>
                        <br/>
                        <tr >
                            <th style="width: 150px;text-align: center">密码:</th>
                            <th>
                                <input name="password" id="password1"  type="text" class="form-control loginLine valiadate" style="font-size:13px" placeholder="请输入新密码" maxlength="22" required="">
                            </th>
                        </tr>
                        </tbody>
                    </form>
                    <div id="test2" style="margin-left: 200px;margin-top: 15px" ><button id="replaceManager_button" style="height: 30px;width: 80px" type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">确认重置</button></div>
                </div>
            </div>
            <div class="ibox float-e-margins"></div>
        </div></div>
    </div>
    <div style="float: right;padding: 20px" class="col-md-6 ">
        <div class="ibox float-e-margins">
        <div class="ibox-title">
            <div style="float: left;margin-left: 5px"><div style="float: left;margin-left: 5px"><span><strong>当前管理员</strong></span></div></div>
        </div>
        <div class="bootstrap-table ibox-content">
            <table id="ManagerInfo" data-toggle="table"
                   data-classes="table table-no-bordered"
                   data-sort-order="desc"
                   data-click-to-select="true"
                   data-search="true"
                   data-show-refresh="true"
                   data-show-toggle="true"
                   data-show-columns="true"
                   data-toolbar="#toolbar"
                   data-query-params="quefryParams"
                   data-pagination="true"
                   data-halign="center"
                   data-striped="true"
                   data-page-size="5"
                   data-height="510"
                   data-page-list="All"
            >
            </table>
        </div>
        </div>
        <br>
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
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
</body>

<script>
    $.validator.setDefaults({
        submitHandler: function() {
        }
    });
    $.validator.addMethod("strongPsw", function(value, element) {
        if(passwordLevel(value) === 1){return false;}
        return true
    }, "格式不符合");
    $().ready(function() {
        var password = $("input#password").val();
        var pwdLevel = passwordLevel(password);
// 在键盘按下并释放及提交后验证提交表单
        $("#addForm").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 2
                },
                password: {
                    required: true,
                    minlength: 6,
                    strongPsw: pwdLevel
                }
            },messages: {
                name: {
                    required: "请输入管理员名",
                    minlength: "用户名长度不能小于 2 位"
                },
                password: {
                    required: "请输入新密码",
                    minlength: "密码长度不能小于 6 位",
                    strongPsw: "密码须包含两种字符以上"
                }
            }
        });
        var password1 = $("input#password1").val();
        var pwdLevel1 = passwordLevel(password1);
        $("#replaceForm").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 2
                },
                password: {
                    required: true,
                    minlength: 6,
                    strongPsw: pwdLevel1
                }
            }, messages: {
                name: {
                    required: "请输入管理员名",
                    minlength: "用户名长度不能小于 2 位"
                },
                password: {
                    required: "请输入新密码",
                    minlength: "密码长度不能小于 6 位",
                    strongPsw: "密码须包含两种字符以上"
                }
            }
        });
    });


    $("button#addManager_button").click(function () {
        var md5PWD = $("input#password").val();
        var name = $("input#name").val();
        if (name === "") {
            swal("错误", "新增管理员姓名不能为空", "error");
        }
        else{
        if (md5PWD === "") {
            swal("错误", "新增管理员密码不能为空", "error");
        }
        else{
        swal(
            {
                title: "您确认新增管理员吗？",
                text: "确认请点击新增",
                type: "",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "新增",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                var md5PWD = $("input#password").val();
                var password = hex_md5(md5PWD);
                $.ajax({
                    url: "adminManage-addManager",
                    data: {
                        name: $("input#name").val(),
                        password: password,
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        alert(password);
                        if (result.flag === true) {
                            if (result.res === true) {
                                swal({
                                    title: "增加成功",
                                    type: "success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                }, function () {
                                    location.href = "adminManage-jmpAdminManager";
                                })
                            }
                            else swal("增加失败！", "操作失败", "error");
                        }
                        else swal("增加失败！", "输入不能为空", "error");
                    },
                    error: function () {
                        swal("增加失败！", "请检查你的网络", "error");
                    }
                })
            })
        }
        }
    })
</script>
<script>
    $("button#replaceManager_button").click(function (){
        var md5PWD = $("input#password1").val();
        var name = $("input#name1").val();
        if (name === "") {
            swal("错误", "重置管理员姓名不能为空", "error");
        }
        else{
            if (md5PWD === "") {
                swal("错误", "重置管理员密码不能为空", "error");
            }
            else {
                swal(
                    {
                        title: "您确认重置管理员吗？",
                        text: "确认请点击重置",
                        type: "",
                        showCancelButton: true,
                        confirmButtonColor: "#18a689",
                        confirmButtonText: "重置",
                        cancelButtonText: "取消",
                        closeOnConfirm: false
                    }, function () {
                        var md5PWD = $("input#password1").val();
                        var newPassword = hex_md5(md5PWD);
                        $.ajax({
                            url: "adminManage-replacePassword",
                            data: {
                                name: $("input#name1").val(),
                                newPassword: newPassword,
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res == true) {
                                    swal({
                                        title: "重置成功",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "adminManage-jmpAdminManager";
                                    })
                                }
                                else swal("重置失败！", "操作失败", "error");
                            },
                            error: function () {
                                swal("重置失败！", "请检查你的网络", "error");
                            }
                        })
                    })
            }
        }
    })
</script>
<script>
    $('#ManagerInfo').bootstrapTable({
            columns: [
                {
                    title: '管理员编号',
                    field: 'id_admin',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'name',
                    title: '管理员名称',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: "actionEvents",
                    formatter: "operateFormatter"
                }
            ]
        }
    );
    /**
     *
     */

    $.ajax(
        {
            type:"GET",
            url:"adminManage-showList",
            dataType:"json",
            success:function(json){
                var ManagerList = JSON.parse(json.res);
                //finishingTask为table的id
                $('#ManagerInfo').bootstrapTable('load',ManagerList);
            },
            error:function(){
                alert("错误");
            }
        }
    )

    function operateFormatter(value,row,index) {
        return[
            '<a class="delete" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >删除</button></a>',
        ].join('');
    }
    window.actionEvents = {
        'click .delete': function (e, value, row, index) {
            var id_admin = parseInt(row.id_admin);
            var admin_name = row.name;
            //删除操作
            swal({
                title: "您确定要删除这个管理员吗",
                text: "点击确定将删除这个管理员！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                $.ajax({
                    type: "GET",
                    url: "adminManage-deleteManager",
                    data: {id_admin: id_admin},
                    dataType: "json",
                    success: function () {
                        swal({
                            title: "删除成功",
                            text: "点击返回管理页面！",
                            type:"success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        },function(){
                            location.href = "adminManage-jmpAdminManager";
                        })
                    },
                    error: function (result) {
                        swal("操作失败！", "出现未知错误，请重试。", "error");
                    }
                })
            })
        }
    }
</script>
</html>