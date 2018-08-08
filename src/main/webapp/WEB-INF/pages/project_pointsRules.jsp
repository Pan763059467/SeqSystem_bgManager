<%--
  Created by IntelliJ IDEA.
  User: zww
  Date: 2018/7/19
  Time: 16:54
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
    <title>积分规则管理</title>
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
                    <a href="user-jmpHomepage">后台管理系统首页</a> >> <a href="pointsRules-jmpPointsRules">积分规则管理</a>
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
                            <a href="project_detail.html#tab-1" data-toggle="tab">积分规则列表</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="panel-body">
                <div class="ibox-content">
                    <div class="bootstrap-table">
                        <table id="showAllRules"
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
<script src="<%=basePath%>/js/mjy.js"></script>
<script src="<%=basePath%>/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
</body>
<script type="text/javascript">
    $('#showAllRules').bootstrapTable({
            columns: [
                {
                    title: '规则编号',
                    field: 'id_rule',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    title: '规则内容',
                    field: 'content',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'points',
                    title: '所需积分',
                    sortable: true,
                    align: 'center',
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
            type:"GET",
            url:"pointsRules-showAllRules",
            dataType:"json",
            success:function(json){
                var allRule = JSON.parse(json.res);
                //finishingTask为table的id
                $('#showAllRules').bootstrapTable('load',allRule);
            },
            error:function(){
                alert("错误");
            }
        }
    );
    function operateFormatter(value,row,index) {
        return[
            '<a class="Modified" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs">修改积分</button></a>',
        ].join('');
    }

    window.actionEvents = {
        'click .Modified': function (e, value, row, index) {
            var id_rule = parseInt(row.id_rule);
            var content = row.content;
                swal(
                    {
                        title: "您确定修改规则“"+content+"”积分吗？",
                        text: "修改积分为",
                        type: "input",
                        showCancelButton: true,
                        confirmButtonColor: "#18a689",
                        confirmButtonText: "确定",
                        cancelButtonText: "取消",
                        closeOnConfirm: false
                    }, function (inputValue) {
                        if (inputValue === "") {
                            swal.showInputError("请输入修改的积分");
                            return false
                        }
                        $.ajax(
                            {
                                type: "GET",
                                data: {
                                    id_rule: id_rule,
                                    content: content,
                                    points: inputValue
                                },
                                url: "pointsRules-modified",
                                dataType: "json",
                                success: function () {
                                    swal({
                                        title: "积分修改成功！",
                                        type:"success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    },function(){
                                        location.href = "pointsRules-jmpPointsRules";
                                    })
                                },
                                error: function () {
                                    swal("修改积分失败！", "服务器异常。", "error");
                                }
                            }
                        )
                    })
        }
    }
</script>
</html>