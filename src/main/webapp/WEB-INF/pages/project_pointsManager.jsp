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
    <title>用户积分表</title>
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
                    <a href="user-jmpHomepage">后台管理系统首页</a> >> 用户积分
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
                        <a href="project_detail.html#tab-1" data-toggle="tab">用户积分列表</a>
                    </li>
                </ul>
            </div>
            <div style="float: left;margin-top: 10px" class="col-md-1">
                <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#addPoints">赠送积分</button>
            </div>
                <div style="float: left" class="col-md-4">
                    <input id="modified_one_points" type="text" maxlength="40"
                           placeholder="请输入对单个用户进行积分修改的值"
                           class="form-control" required="">
                </div>
            </div>
            <div class="panel-body">
                <div class="ibox-content">
                    <div id="tableshowAllUser">
                        <table id="showAllUser"
                               data-toggle="table"
                               data-click-to-select="true"
                               data-search="true"
                               data-show-refresh="true"
                               data-show-toggle="true"
                               data-show-columns="true"
                               data-toolbar="#toolbar"
                               data-query-params="queryParams"
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
    <div  class="modal inmodal" id="addPoints" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">赠送积分</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group"><label>请输入给所有用户赠送积分的数量/个</label>
                        <input id="points" type="text" maxlength="20" class="form-control" required="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                    <button id="Confirmation" type="button" class="btn btn-primary">赠送</button>
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
    $('#showAllUser').bootstrapTable({
            columns: [
                {
                    title: '用户名',
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
                    field: 'points',
                    title: '当前积分',
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
            url:"user-showAllUser",
            dataType:"json",
            success:function(json){
                var allUser = JSON.parse(json.res);
                //finishingTask为table的id
                $('#showAllUser').bootstrapTable('load',allUser);
            },
            error:function(){
                alert("错误");
            }
        }
    );
    function operateFormatter(value,row,index) {
        return[
            '<a class="Modified" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs">修改积分</button></a>',
            '<a class="Record" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >查看积分历史</button></a>'
        ].join('');
    }

    function ALLMember(element){

    }
    window.actionEvents = {
        'click .Record': function (e, value, row, index) {
            //查看用户积分记录
            var id_user = parseInt(row.id_user);
            var user_name = row.name;
            $.ajax(
                {
                    type: "GET",
                    data: {
                        id_user: id_user,
                        name: user_name
                    },
                    url: "N_user-saveRecordId",
                    dataType: "json",
                    success: function () {
                        location.href = "N_user-jmpPointsRecordPage";
                    },
                    error: function () {
                        swal("查看记录失败！", "服务器异常。", "error");
                    }
                }
            )
        },
        'click .Modified': function (e, value, row, index) {
            //查看用户积分记录
            var id_user = parseInt(row.id_user);
            var user_name = row.name;
            var points=$("input#modified_one_points").val();
            alert(points);
            if(points !== 0 && points !==""){
            swal(
                {
                    title: "您确定修改用户"+user_name+"积分为"+points+"吗？",
                    text: "确认请点击确定",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "确定",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    $.ajax(
                        {
                            type: "GET",
                            data: {
                                id_user: id_user,
                                name: user_name,
                                points: points
                            },
                            url: "N_user-modified_one",
                            dataType: "json",
                            success: function () {
                                swal({
                                    title: "积分修改成功！",
                                    type:"success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                },function(){
                                    location.href = "user-jmpPointManager";
                                })
                            },
                            error: function () {
                                swal("修改积分失败！", "服务器异常。", "error");
                            }
                        }
                    )
                })
            } else{
                swal("请先输入积分数额！", "在表头输入框输入。", "error");
            }
        }
    }
</script>
<script>
    $("button#Confirmation").click(function () {
        var points = $("input#points").val();
        swal(
                {
                    title: "您确认给所有用户增送积分吗",
                    text: "确认请点击确定",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "确定",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    $.ajax(
                        {
                            url: "N_user-addPoints",
                            data: {points:points},
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res === true) {
                                    swal({
                                        title: "积分赠送成功！",
                                        type:"success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    },function(){
                                        location.href = "user-jmpPointManager";
                                    })
                                }
                                else swal("赠送失败！", "未知错误", "error");
                            },
                            error: function () {
                                swal("赠送失败！", "服务器异常。", "error");
                            }
                        }
                    )
                })
    })
</script>
</html>
