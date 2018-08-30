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
                    <a href="user-jmpHomepage">后台管理系统首页</a> >> <a href="Organization-jmpSysManager4"> 构件库申请 </a>
                </strong>
            </li>
        </ol>
    </div>
    <div class="form-group col-md-1">
    </div>
    <div style="padding: 15px 30px 0px 0px;margin-left: -50px" class="col-md-10" >
        <div class="panel">
            <div class="panel-heading">
                <div class="panel-options">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="project_detail.html#tab-1" data-toggle="tab">待处理申请</a>
                        </li>
                        <li class="">
                            <a href="project_detail.html#tab-2" data-toggle="tab">已处理申请</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-1">
                        <div style="margin:-30px 0px 0px 0px">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content">
                                    <div class="bootstrap-table" >
                                        <table id="showAllLib"
                                               data-toggle="table"
                                               data-url="showApplyOrg-showList"
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
                    <div class="tab-pane" id="tab-2">
                        <div style="margin:-30px 0px 0px 0px">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content">
                                    <div class="bootstrap-table" >
                                        <table id="showHistory"
                                               data-toggle="table"
                                               data-url="showApplyOrg-showOthers"
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
    $('#showAllLib').bootstrapTable({
            columns: [
                {
                    title: '申请人',
                    field: 'user_name',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'lib_name',
                    title: '构件库名',
                    sortable: true,
                    align: 'center'
                }, {
                    field: 'content',
                    title: '备注',
                    sortable: true,
                    align: 'center'
                },{
                    field: 'date',
                    title: '申请时间',
                    sortable: true,
                    align: 'center'
                },{
                    field:'title',
                    title:'构件库类型',
                    align:'center',
                    sortable: true,
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
    )
    $.ajax(
        {
            type:"GET",
            url:"libApply-showLibList",
            dataType:"json",
            success:function(json){
                var allLib = JSON.parse(json.res);
                //finishingTask为table的id
                $('#showAllLib').bootstrapTable('load',allLib);
            },
            error:function(){
                alert("错误");
            }
        }
    )

    $('#showHistory').bootstrapTable({
            columns: [
                {
                    title: '申请人',
                    field: 'user_name',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'lib_name',
                    title: '构件库名',
                    sortable: true,
                    align: 'center'
                }, {
                    field: 'content',
                    title: '备注',
                    sortable: true,
                    align: 'center'
                },{
                    field: 'date',
                    title: '申请时间',
                    sortable: true,
                    align: 'center'
                },{
                    field:'title',
                    title:'构件库类型',
                    align:'center',
                    sortable: true,
                },{
                    field:'status',
                    title:'状态',
                    align:'center',
                    sortable: true,
                    formatter: "rename"
                }
            ]
        }
    )
    $.ajax(
        {
            type:"GET",
            url:"libApply-showHistory",
            dataType:"json",
            success:function(json){
                var history = JSON.parse(json.res);
                //finishingTask为table的id
                $('#showHistory').bootstrapTable('load',history);
            },
            error:function(){
                alert("错误");
            }
        }
    )

    function operateFormatter(value,row,index) {
        return[
            '<a class="displayLib" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >查看构件库内容</button></a>',
            '<a class="acceptLib" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >同意</button></a>',
            '<a class="refuseLib" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >拒绝</button></a>'
        ].join('');
    }

    function rename(value,row,index) {
        var status=parseInt(row.status);
        if(status == 1)
            return '已同意';
        else if(status == -1)
            return '已拒绝';
    }

    window.actionEvents = {
        'click .displayLib': function (e, value, row, index) {
            //查看用户积分记录
            var id_library = row.id_library;
            $.ajax(
                {
                    type: "GET",
                    data: {
                        id_library:id_library
                    },
                    url: "libApply-saveIdLib",
                    dataType: "json",
                    success: function () {
                        location.href = "libApply-jmpSysManager5Page";
                    },
                    error: function () {
                        swal("查看记录失败！", "服务器异常。", "error");
                    }
                }
            )
        },
        'click .acceptLib': function (e, value, row, index) {
            var id_library = row.id_library;
            var id_user = row.id_user;

            swal(
                {
                    title: "确认同意申请吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确认",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function () {
                    $.ajax({
                        type: "GET",
                        url: "libApply-accept",
                        data: {
                            id_library : id_library,
                            id_user : id_user
                        },
                        dataType: "json",
                        success: function (json) {
                            swal({
                                title: "同意成功",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            });
                            $('#showAllLib').bootstrapTable('remove', {
                                field: 'lib_name',
                                values: [row.lib_name]
                            });
                            var showAllLib = JSON.parse(json.res);
                            $('#showAllLib').bootstrapTable('load',showAllLib);
                            var showHistory = JSON.parse(json.res2);
                            $('#showAllLib').bootstrapTable('load',showHistory);
                        },
                        error: function (result) {
                            swal("操作失败！", "出现未知错误，请重试。", "error");
                        }
                    })
                })
        },
        'click .refuseLib' : function (e, value, row, index) {
            var id_library = row.id_library;
            var id_user = row.id_user;

            swal(
                {
                    title: "确认拒绝申请吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确认",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function () {
                    $.ajax({
                        type: "GET",
                        url: "libApply-refuse",
                        data: {
                            id_library : id_library,
                            id_user : id_user
                        },
                        dataType: "json",
                        success: function (json) {
                            swal({
                                title: "同意成功",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            });
                            $('#showHistory').bootstrapTable('remove', {
                                field: 'lib_name',
                                values: [row.lib_name]
                            });
                            var showAllLib = JSON.parse(json.res);
                            $('#showHistory').bootstrapTable('load',showAllLib);
                            var showHistory = JSON.parse(json.res2);
                            $('#showHistory').bootstrapTable('load',showHistory);
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
