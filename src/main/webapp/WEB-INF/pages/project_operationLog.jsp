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
    <title>管理员操作日志</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="<%=basePath %>/example/favicon.ico">
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
<div id="page-wrapper" class="white-bg dashbard-1">
    <div class=" row wrapper white-bg" id="content-main">
        <ol class="breadcrumb" style="margin-left: 40px">
            <li style="font-size: 15px">
                <strong>
                    <a href="user-jmpHomepage">后台管理系统首页</a> >> 操作日志
                </strong>
            </li>
        </ol>
    </div>


    <div class="form-group col-md-1">
    </div>
    <div style="margin:16px 0px 0px -60px" class="col-md-10">
        <div class="ibox-title">
            <h5>操作历史 </h5>
            <div style="float: left;" class="col-md-6">
                <button id="export-button" type="button" class="btn btn-primary btn-xs" onclick="export_log()">导出日志</button>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="bootstrap-table">
                    <table id="LogList"
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
<script src="<%=basePath%>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=basePath%>/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath%>/js/plugins/toastr/toastr.min.js"></script>
<script src="<%=basePath%>/js/mjy.js"></script>
</body>
<script>
    $('#LogList').bootstrapTable({
            columns: [
                {
                    title: '操作人',
                    field: 'admin_name',
                    align: 'center',
                    sortable: true,
                    align: 'middle'
                },
                {
                    title: '真实姓名',
                    field: 'realname',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    title: '操作内容',
                    field: 'content',
                    sortable: true,
                    align: 'center'
                }, {
                    title: '操作时间',
                    field: 'date',
                    sortable: true,
                    align: 'center'
                }
            ]
        }
    )
    $.ajax(
        {
            type:"GET",
            url:"adminLog-logList",
            dataType:"json",
            success:function(json){
                var adminlog = JSON.parse(json.res);
                //finishingTask为table的id
                $('#LogList').bootstrapTable('load',adminlog);
            },
            error:function(){
                alert("错误");
            }
        }
    );
    function export_log(){
        $.ajax(
            {
                type:"GET",
                url:"adminLog-export",
                dataType:"json",
                success:function(json){
                    showtoast("success", "导出成功", "请在D盘查看")
                },
                error:function(){
                    alert("错误");
                }
            }
        )
    }
</script>
</html>
