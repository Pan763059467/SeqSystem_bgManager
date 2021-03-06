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
    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <link href="<%=basePath%>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<%=basePath%>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div id="page-wrapper" class="white-bg dashbard-1" >
    <div class=" row wrapper white-bg" id="content-main">
        <ol class="breadcrumb" style="margin-left: 40px">
            <li style="font-size: 15px">
                <strong>
                    <a href="user-jmpHomepage">后台管理系统首页</a> >> <a href="Organization-jmpSysManager2"> 已有机构 </a> >> <a href="Organization-jmpSysManager3Page">${sessionScope.org_name}</a>
                </strong>
            </li>
        </ol>
    </div>
    <div class="form-group col-md-1">
    </div>
    <div style="margin:16px 0px 0px -60px" class="col-md-10">
        <div class="panel">
            <div class="panel-heading">
            <div class="panel-options col-md-2">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="project_detail.html#tab-1" data-toggle="tab">${sessionScope.org_name}</a>
                    </li>
                </ul>
            </div>
            <div style="float: left;margin-top: 10px" class="col-md-6">
                <%--<button id="disbandment-button" type="button" class="btn btn-primary btn-xs">解散机构</button>--%>
            </div>
        </div>
            <div class="panel-body">
            <div class="ibox-content">
                <div class="bootstrap-table">
                    <table id="showAdminOrg"
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
                           data-page-size="10"
                           data-page-list="All"
                    >
                    </table>
                </div>
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
<script src="<%=basePath%>/js/plugins/toastr/toastr.min.js"></script>
<script src="<%=basePath%>/js/mjy.js"></script>
<script src="<%=basePath%>/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
</body>
<script type="text/javascript">
    $('#showAdminOrg').bootstrapTable({
            columns: [
                {
                    title: '成员姓名',
                    field: 'name',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    title: '真实姓名',
                    field: 'realname',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'mail',
                    title: '邮箱',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'statu',
                    title: '职务',
                    sortable: true,
                    align: 'center',
                    formatter: "rename"
                },{
                    field:'operate',
                    title:'操作',
                    align:'center',
                    sortable: true,
                    events: "actionEvents",
                    formatter: "operateFormatter"
                }
            ]
        }
    );
    $.ajax(
        {
            url:"Organization-showAdminOrg",
            dataType:"json",
            type: "Get",
            async: "false",
            success:function(result){
                // if(result.days < 0){
                //     showtoast("error", "机构管理员账号到期", "机构已停用");
                // }
                var showAdminOrg = JSON.parse(result.res);
                //finishingTask为table的id
                $('#showAdminOrg').bootstrapTable('load',showAdminOrg);
            },
            error:function(){
                alert(" 错误");
            }
        }
    );
    function operateFormatter(value,row,index) {
        return[
            '<a class="grant" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >任命管理</button></a>',
        ].join('');
    }
    function rename(value,row,index) {
        var statu=parseInt(row.statu);
        if(statu==0)
            return '成员';
        else if(statu==1)
            return '机构管理员';
        else if(statu==2)
            return '机构副管理员';
    }
    window.actionEvents = {
        'click .grant': function(e, value, row, index) {
            //转移机构管理权限
            var id_user = parseInt(row.id_user);
            var user_name = row.name;
            var currentOrg=$("#gender").val();
            if(row.statu === 1){
                swal("该用户已经是机构管理员！", "请选择其他用户", "error");
            }
            else {
                swal(
                    {
                        title: "您确定任命此用户为该机构管理员吗",
                        text: "请谨慎操作！",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "确定",
                        cancelButtonText: "取消",
                        closeOnConfirm: false
                    }, function () {
                        $.ajax({
                            type: "GET",
                            url: "orgInvite-grantOrg",
                            data: {ID_USER: id_user, USER_NAME: user_name, ORG_NAME: currentOrg},
                            dataType: "json",
                            success: function () {
                                swal({
                                    title: "操作完成",
                                    text: "点击返回首页！",
                                    type: "success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                }, function () {
                                    location.href = "Organization-jmpSysManager2";
                                })
                            },
                            error: function (result) {
                                swal("操作失败！", "服务器异常。", "error");
                            }
                        })
                    })
            }
        }
    };
</script>
<script>
    $("button#disbandment-button").click(function () {
        var currentOrg = $("#gender").val();
        if(currentOrg === "" || currentOrg === null){
            swal("请先选择机构！", "选择机构在右侧选项框", "error");
        }
        else {
            swal(
                {
                    title: "您确定要解散该机构吗",
                    text: "该操作不可取消",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "确定",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    $.ajax(
                        {
                            url: "Organization-disbandOrg",
                            data: {
                                NAME: currentOrg
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res === true) {
                                    swal({
                                        title: "您已解散该机构",
                                        type:"success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    },function(){
                                        location.href = "Organization-jmpSysManager2";
                                    })
                                }
                                else swal("解散失败！", "未在系统中找到该机构", "error");
                            },
                            error: function () {
                                swal("解散失败！", "服务器异常。", "error");
                            }
                        }
                    )
                })
        }
    })
</script>
</html>
