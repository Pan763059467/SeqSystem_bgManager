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
    <link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/z_style.css" rel="stylesheet">
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
<script src="<%=basePath%>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=basePath%>/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath%>/js/plugins/toastr/toastr.min.js"></script>
<script src="<%=basePath%>/js/mjy.js"></script>
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
                    align: 'center'
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
</script>
</html>
