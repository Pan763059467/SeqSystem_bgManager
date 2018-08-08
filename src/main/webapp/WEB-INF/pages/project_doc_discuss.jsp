<%--
  Created by IntelliJ IDEA.
  User: zww
  Date: 2018/7/16
  Time: 14:28
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
    <title>文档评论管理</title>
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
                    <a href="user-jmpHomepage">首页</a> >> 文档评论管理
                </strong>
            </li>
        </ol>
    </div>


    <div class="form-group col-md-1">
    </div>
    <div style="margin:16px 0px 0px -60px" class="col-md-10">
        <div class="ibox-title">
            <h5>文档评论 </h5>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="bootstrap-table">
                    <table id="Doc_Dis_List"
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
    $('#Doc_Dis_List').bootstrapTable({
            columns: [
                {
                    title: '项目名',
                    field: 'pro_name',
                    align: 'center',
                    sortable: true,
                    align: 'middle'
                },
                {
                    title: '文档名',
                    field: 'doc_name',
                    align: 'center',
                    sortable: true,
                    align: 'middle'
                },
                {
                    title: '用户名',
                    field: 'user_name',
                    align: 'center',
                    sortable: true,
                    align: 'middle'
                },
                {
                    title: '操作内容',
                    field: 'content',
                    sortable: true,
                    align: 'center'
                }, {
                    title: '操作时间',
                    field: 'time',
                    sortable: true,
                    align: 'center'
                }, {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: "actionEvents",
                    formatter: "operateFormatter"
                }
            ]
        }
    )
    $.ajax(
        {
            type:"GET",
            url:"doc_dis-docDisList",
            dataType:"json",
            success:function(json){
                var doc_dis_list = JSON.parse(json.res);
                $('#Doc_Dis_List').bootstrapTable('load',doc_dis_list);
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
            var id_pro_discuss = parseInt(row.id_pro_discuss);
            var id_user = row.id_user;
            //删除操作
            swal({
                title: "您确定要删除这个评论吗",
                text: "点击确定将删除这个评论！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                $.ajax({
                    type: "GET",
                    url: "doc_dis-deleteDiscuss",
                    data: {id_user: id_user,id_pro_discuss: id_pro_discuss},
                    dataType: "json",
                    success: function () {
                        swal({
                            title: "删除成功",
                            text: "点击返回管理页面！",
                            type:"success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        },function(){
                            location.href = "user-jmpDocDisManager";
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

