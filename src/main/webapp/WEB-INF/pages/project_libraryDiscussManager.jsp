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
    <title>构件库评论管理</title>
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
                    <a href="user-jmpHomepage">后台管理系统首页</a> >> 构件库评论管理
                </strong>
            </li>
        </ol>
    </div>


    <div class="form-group col-md-1">
    </div>
    <div style="margin:16px 0px 0px -60px" class="col-md-10">
        <div class="ibox-title">
            <h5>构件库评论</h5>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="bootstrap-table">
                    <table id="discussList"
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
    $('#discussList').bootstrapTable({
            columns: [
                {
                    title: '构件库名',
                    field: 'library_name',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'user_name',
                    title: '发言人',
                    sortable: true,
                    align: 'center'
                }, {
                    field: 'time',
                    title: '时间',
                    sortable: true,
                    align: 'center'
                },{
                    field: 'content',
                    title: '发言内容',
                    sortable: true,
                    align: 'center'
                },{
                    field: 'operate',
                    title: '操作',
                    align: 'center',
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
            url:"user-showAllLibDiscuss",
            dataType:"json",
            success:function(json){
                var discussList = JSON.parse(json.res);
                //finishingTask为table的id
                $('#discussList').bootstrapTable('load',discussList);
            },
            error:function(){
                alert("错误");
            }
        }
    )
    function operateFormatter(value,row,index) {
        return[
            '<a class="delete" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >删除</button></a>'
        ].join('');
    }
    window.actionEvents = {
    'click .delete' :
        function(e, value, row, index) {
            //修改操作
            var id_user = parseInt(row.id_user);
            var id_lib_discuss = parseInt(row.id_lib_discuss);
            var library_name = row.library_name;
            var user_name = row.user_name;
            alert(id_lib_discuss);
            alert(id_user);
            alert(library_name);
            alert(user_name);
            swal(
                {
                    title: "您确定要删除这个评论吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "删除",
                    cancelButtonText: "取消",
                    closeOnConfirm: true
                },function () {
                    $.ajax({
                        type: "GET",
                        url: "deleteDiscuss-deleteDiscuss",
                        data: {
                            id_lib_discuss: id_lib_discuss,
                            id_user:id_user
                        },
                        dataType: "json",
                        success: function () {
                            swal("删除成功！", "您已经删除该评论。", "success");
                            $('#discussList').bootstrapTable('remove', {
                                field: 'library_name',
                                values: [row.library_name]
                            });
                        },
                        error: function () {
                            swal({
                                icon: "error"
                            });
                        }
                    })
                }
            );
        }
    }

</script>
</html>
