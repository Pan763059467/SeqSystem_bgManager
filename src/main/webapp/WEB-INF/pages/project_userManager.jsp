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
    <title>已有机构</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="<%=basePath%>/example/favicon.ico">
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
                    <a href="user-jmpHomepage">首页</a> >> 用户信息管理
                </strong>
            </li>
        </ol>
    </div>


    <div class="form-group col-md-1">
    </div>
    <div style="margin:16px 0px 0px -60px" class="col-md-10">
        <div class="ibox-title">
            <h5>用户列表</h5>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="bootstrap-table">
                    <table id="userList"
                           data-toggle="table"
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
                           data-page-size="6"
                           data-height="410"
                           data-page-list="All"
                    >
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=basePath%>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=basePath%>/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath%>/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath%>/js/plugins/layer/layer.min.js"></script>
<script src="<%=basePath%>/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="<%=basePath%>/js/contabs.min.js"></script>
<script src="<%=basePath%>/js/plugins/pace/pace.min.js"></script>
<script src="<%=basePath%>/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script src="<%=basePath%>/js/mjy.js"></script>
<script src="<%=basePath%>/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
</body>
<script>
    $('#userList').bootstrapTable({
            columns: [
                {
                    title: '用户编号',
                    field: 'id_user',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'name',
                    title: '用户名',
                    sortable: true,
                    align: 'center'
                }, {
                    field: 'mail',
                    title: '邮箱',
                    sortable: true,
                    align: 'center'
                },{
                    field: 'flag',
                    title: '状态',
                    sortable: true,
                    align: 'center',
                    events: "actionEvents",
                    formatter: "rename"
                }
            ]
        }
    )
    $.ajax(
        {
            type:"GET",
            url:"user-showAllUser",
            dataType:"json",
            success:function(json){
                var allUser = JSON.parse(json.res);
                //finishingTask为table的id
                $('#userList').bootstrapTable('load',allUser);
            },
            error:function(){
                alert("错误");
            }
        }
    )
    function rename(value, row, index) {
        var flag=parseInt(row.flag);
        if(flag==0)
            return ['正常使用',
                '<a class="lock" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >封禁</button></a>'].join('');
        else if(flag==1)
            return ['已封停',
                '<a class="unlock" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >解封</button></a>'].join('');
    }
    window.actionEvents = {
        'click .lock': function(e, value, row, index) {
            //锁定操作
            var id_user = parseInt(row.id_user);
            var user_name = row.name;
            swal(
                {
                    title: "您确定要封禁该用户吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "封禁",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function () {
                    $.ajax({
                        type: "GET",
                        url: "N_user-lock",
                        data: {id_user: id_user},
                        dataType: "json",
                        success: function (json) {
                            swal({
                                title: "封禁成功",
                                text: "点击返回管理页面！",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href = "user-jmpUserManager";
                            })
                        },
                        error: function (result) {
                            swal("操作失败！", "出现未知错误，请重试。", "error");
                        }
                    })
                })
        },
        'click .unlock': function(e, value, row, index) {
            //解锁操作
            var id_user = parseInt(row.id_user);
            var user_name = row.name;
            swal(
                {
                    title: "您确定要解封该用户吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "解封",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function () {
                    $.ajax({
                        type: "GET",
                        url: "N_user-unlock",
                        data: {id_user: id_user},
                        dataType: "json",
                        success: function (json) {
                            swal({
                                title: "解封成功",
                                text: "点击返回管理页面！",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href = "user-jmpUserManager";
                            })
                        },
                        error: function (result) {
                            swal("操作失败！", "出现未知错误，请重试。", "error");
                        }
                    })
                })
        }
    };
</script>
</html>
