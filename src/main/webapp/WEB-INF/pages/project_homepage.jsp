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
        <div id="main" style="margin-top:10px">
            <div id="head" style="width:100%;height: 70px;font-size:x-small;margin: 0 auto">
                <div style="float: left;height: 60px;padding: 20px 20px 0px 20px" class="col-md-4">
                    <div style="float: left;margin: 0px 0px 0px 50px">
                        <div id="choose_menu">
                            <div style="font-size: 18px;color: black"><button class="btn-warning btn">用户常规管理</button></div>
                        </div>
                    </div>
                    <div style="float: left;font-size:18px;width: 30px;text-align: center">|</div>
                    <div style="float: left">
                        <div style="float: left;font-size:18px;text-align: left;color: black"><button class="btn-primary btn">构件管理</button></div>
                    </div>
                    <div style="float: left;font-size:18px;width: 30px;text-align: center">|</div>
                    <div style="float: left">
                        <div style="float: left;font-size:18px;width: 100px;text-align: left;color: black"><button class="btn-primary btn">操作日志</button></div>
                    </div>
                </div>
            </div>

            <div id="view" style="padding: 0px 70px 0px 70px;margin-top:30px">
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
                    <div id="div2" class="col-sm-4">
                        <div class="contact-box">
                            <div>
                                <div style="margin: 10px 10px 10px 15px;float: left"><img src="/img/user_manager.png" height="125" width="125"/></div>
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
                                <div style="margin: 10px 10px 10px 15px;float: left"><img src="/img/user_manager.png" height="125" width="125"/></div>
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
                                <div style="margin: 10px 10px 10px 15px;float: left"><img src="/img/user_manager.png" height="125" width="125"/></div>
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
                                <div style="margin: 10px 10px 10px 15px;float: left"><img src="/img/user_manager.png" height="125" width="125"/></div>
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
    </div>
</div>
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/js/plugins/layer/layer.min.js"></script>
<script src="/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="/js/contabs.min.js"></script>
<script src="/js/plugins/pace/pace.min.js"></script>
<script src="/js/content.min.js?v=1.0.0"></script>
<script>
    $(document).ready(function(){$(".contact-box").each(function(){animationHover(this,"pulse")})});
</script>
</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:17:11 GMT -->
</html>
