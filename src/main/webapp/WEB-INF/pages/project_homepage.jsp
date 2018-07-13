<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:16:41 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>主页</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="/example/favicon.ico">
    <link href="<%=basePath %>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath %>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath %>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar  gray-bg" style="overflow:hidden">
<div id="wrapper" style="padding: 0px" class="wrapper wrapper-content animated fadeInDown gray-bg">

    <div id="next1" style="width: 100%;margin: 0 auto;font-weight: 400" class="gray-bg">
        <div class=" row wrapper white-bg" >
            <ol class="breadcrumb" style="margin-left: 50px">
                <li style="font-size: 15px">
                    <strong>
                        <a href="user-jmpHomepage"><span class="lzf_b">后台管理系统首页</span></a>
                    </strong>
                </li>
            </ol>
        </div>
        <div class="row m-t-sm">
            <div class="col-sm-12">
                <div class="row wrapper white-bg " style="margin: -5px 30px 0px 30px;min-height: 600px" >
                    <div class="panel blank-panel">
                        <div class="panel-heading">
                            <div class="panel-options">
                                <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#tab-1" data-toggle="tab">用户常规管理</a>
                                </li>
                                <li>
                                    <a href="#tab-2" data-toggle="tab">构件管理</a>
                                </li>
                                <li>
                                    <a href="#tab-3" data-toggle="tab">评论管理</a>
                                </li>
                                </ul>
                            </div>
                        </div>
                        <div class="panel-body ">
                            <div class="tab-content">
                            <div class="tab-pane active" id="tab-1">
                                <div id="view" style="padding: 0px 20px 0px 20px;margin-top:30px">
                                    <div class="row">
                                        <div id="div1" class="col-sm-4">
                                            <div class="contact-box">
                                                <div>
                                                    <div style="margin: 10px 10px 10px 15px;float: left"><img src="/img/user_manager.png" height="125" width="125"/></div>
                                                    <div style="margin: 10px;float: left">
                                                        <h3>用户信息管理</h3>
                                                        <br/>
                                                        <p> 审查用户信息，管理用户</p>
                                                        <p>账号，可删除系统内用户账号</p>
                                                    </div>
                                                    <div style="clear: both;margin: 0px 10px 0px 10px">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="div2" class="col-sm-4" href="user-jmpSysManager1">
                                            <div class="contact-box">
                                                <div>
                                                    <div style="margin: 10px 10px 10px 15px;float: left"><img src="/img/org_apply_manager.png" height="125" width="125"/></div>
                                                    <div style="margin: 10px;float: left">
                                                        <h3>机构申请管理</h3>
                                                        <br/>
                                                        <p> 审查用户的机构申请请求</p>
                                                        <p>通过后即成立机构</p>
                                                    </div>
                                                    <div style="clear: both;margin: 0px 10px 0px 10px">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="div3" class="col-sm-4">
                                            <div class="contact-box">
                                                <div>
                                                    <div style="margin: 10px 10px 10px 15px;float: left"><img src="/img/org_manager.png" height="125" width="125"/></div>
                                                    <div style="margin: 10px;float: left">
                                                        <h3>机构管理</h3>
                                                        <br/>
                                                        <p>查看机构成员与项目</p>
                                                        <p>可重新任命机构管理员</p>
                                                    </div>
                                                    <div style="clear: both;margin: 0px 10px 0px 10px">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="div4" class="col-sm-4">
                                            <div class="contact-box">
                                                <div>
                                                    <div style="margin: 10px 10px 10px 15px;float: left"><img src="/img/score_manager.png" height="125" width="125"/></div>
                                                    <div style="margin: 10px;float: left">
                                                        <h3>用户积分管理</h3>
                                                        <br/>
                                                        <p>查看用户积分的获取与使用记录</p>
                                                        <p>可以修改用户当前积分</p>
                                                    </div>
                                                    <div style="clear: both;margin: 0px 10px 0px 10px">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="div5" class="col-sm-4">
                                            <div class="contact-box">
                                                <div>
                                                    <div style="margin: 10px 10px 10px 15px;float: left"><img src="/img/comment_manager.png" height="125" width="125"/></div>
                                                    <div style="margin: 10px;float: left">
                                                        <h3>文档评论管理</h3>
                                                        <br/>
                                                        <p>可查看该系统所有文档下评论</p>
                                                        <p>删除评论不受时间限制</p>
                                                    </div>
                                                    <div style="clear: both;margin: 0px 10px 0px 10px">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab-2">
                            </div>
                            <div class="tab-pane" id="tab-3">
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
    )
</script>
</html>
