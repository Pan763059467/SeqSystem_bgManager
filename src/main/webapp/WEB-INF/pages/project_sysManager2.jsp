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
                    <a href="user-jmpHomepage">后台管理系统首页</a> >>已有机构
                </strong>
            </li>
        </ol>
    </div>
    <div class="form-group col-md-1">
    </div>
    <div style="margin:16px 0px 0px -60px" class="col-md-10">
        <div class="panel">
            <div class="panel-heading">
            <div class="panel-options col-md-4">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="project_detail.html#tab-1" data-toggle="tab">当前机构</a>
                    </li>
                </ul>
            </div>
            <div style="float: left;margin-top: 10px" class="col-md-4">
            </div>
            <div style="float: right;width: 300px" class="col-md-4">
                <select id="gender" class="form-control" name="gender">
                    <option name="" disabled  selected="selected" >选择机构</option>
                    <s:iterator value="list">
                        <option name="displayOrg" class="orgName"><s:property value="NAME"/> </option>
                    </s:iterator>
                </select>
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
    $(document).ready(function(){
        $("option.orgName").click(function () {
                alert(2)
                var element = $(this).val();
                Ffive(element);
            }
        );
    });
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
                    field: 'mail',
                    title: '邮箱',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'statu',
                    title: '职务',
                    sortable: true,
                    align: 'center'
                }
            ]
        }
    );
    function Ffive(element){
        $.ajax(
            {
                url:"Organization-showAdminOrg",
                data: {NAME: element},
                dataType:"json",
                type: "Get",
                async: "false",
                success:function(json){
                    var showAdminOrg = JSON.parse(json.res);
                    //finishingTask为table的id
                    $('#showAdminOrg').bootstrapTable('load',showAdminOrg);
                },
                error:function(){
                    alert(" 错误");
                }
            }
        )
    }

    function operateFormatter(value,row,index) {
        return[
            '<a class="grant" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >机构转移</button></a>',
            '<a class="delete" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >踢出机构</button></a>'
        ].join('');
    }
    function rename(value,row,index) {
        var state=parseInt(row.STATE);
        if(state==0)
            return '未接受';
        else if(state==1)
            return '已同意';
        else if(state==-1)
            return ['已拒绝',
                '<a class="reAgree" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >重新邀请</button></a>'].join('');
    }
</script>
</html>
