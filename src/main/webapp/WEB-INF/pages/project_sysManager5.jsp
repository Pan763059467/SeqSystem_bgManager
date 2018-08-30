<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/8/30
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>构件库</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="<%=basePath %>/example/favicon.ico">

    <link href="<%=basePath %>css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath %>css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath %>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath %>css/lzf.css" rel="stylesheet">
    <link href="<%=basePath %>css/z_style.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/summernote/summernote-lite.css" rel="stylesheet">
    <link href="<%=basePath %>css/mjy.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <style>
        a   {color: black}
        a:link {color:grey;} /*未访问颜色*/
        a:visited {color:gray;} /*已访问颜色*/
        a:hover {color:grey;} /*悬浮（鼠标经过）时颜色*/
        a:active {color:beige;} /*点击时的颜色*/
    </style>
    <script>
        var timer1=null;
        function toshow() {
            clearTimeout(timer1);
            component_menu.style.display='block';
        };
        function tomiss() {
            timer1=setTimeout(function () {
                component_menu.style.display='none';
            },500);
            component_menu.onmouseover=function() {
                clearTimeout(timer1);
            }
            component_menu.onmouseout=function () {
                timer1=setTimeout(function () {
                    div1.style.display='none';
                },500);

            }
        };
    </script>


</head>
<body>
<div  class="modal inmodal" id="newCommon" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">新建通用构件</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>内容</label> <textarea  id="content"  style="height: 300px" type="text" maxlength="100000" placeholder="请输入内容" class="form-control" required="required"></textarea></div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="newCommon-button" type="submit" class="btn btn-primary">新建</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="newUser" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">新建用户构件</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>用户名</label> <input id="content2" type="text" placeholder="请输入用户名(必填，不超过100字符)" maxlength="100" class="form-control" required="required"></div>
                <div class="form-group"><label>用户描述</label> <textarea id="content3"  style="height: 60px" type="text" placeholder="请输入备注(必填，不超过2000字符)"  maxlength="2000" class="form-control" required="required"></textarea></div>
                <div class="form-group"><label>用户权限</label> <textarea  id="content4"  style="height: 200px" type="text" maxlength="100000" placeholder="请输入内容" class="form-control" required="required"></textarea></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="newUser-button" type="submit" class="btn btn-primary">新建</button>
            </div>
        </div>
    </div>
</div>

<div id="wrapper" style="padding: 0px" class="wrapper wrapper-content ">
    <div id="next1" style="width: 100%;margin: 0 auto;font-weight: 400" class="gray-bg">
        <div class=" row wrapper white-bg">
            <ol class="breadcrumb" style="margin-left: 50px">
                <li style="font-size: 15px">
                    <strong>
                        <a href="user-jmpHomepage"><span class="lzf_b">首页</span></a> >><a href="library-get"><span class="lzf_b">构件库</span></a> >> 构件
                    </strong>
                </li>
            </ol>
        </div>
        <div id="main" style="width:100%;margin-top: 10px ">
            <div id="head" style="width:1200px;font-size:x-small;margin: 0 auto">
                <div style="float: left;height: 50px;width:300px;padding: 20px 20px 0px 20px;margin-left: 100px">
                    <h2 style="font-weight:700"> ${requestScope.library.name}</h2>
                </div>
                <div style="float: left;height: 50px;width:200px;padding: 40px 0px 20px 0px;text-align:center;margin-top:5px">
                    <p style="font-size: 16px;color: black">贡献人：${requestScope.library.user_name}</p>
                </div>
                <div style="float: left;height: 50px;width:200px;padding: 40px 0px 20px 0px;margin-top:5px;margin-left: 10px">
                    <p style="font-size: 16px;color: black">发布时间：${requestScope.library.time}</p>
                </div>
                <div style="float: left;height: 50px;width:100px;padding: 40px 0px 20px 0px;margin-top:5px;margin-left: 10px">
                    <p style="font-size: 16px;color: black">类型：${requestScope.library.title}</p>
                </div>
                <div style="float: left;height: 50px;width:100px;padding: 40px 0px 20px 0px;margin-top:5px;margin-left: 10px">
                    <s:if test="#request.library.id_user == #session.user.id_user">
                        <s:if test="#request.id_template==1">
                            <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#newCommon">创建通用构件</button>
                        </s:if>
                        <s:elseif test="#request.id_template==2">
                            <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#newUser">创建用户构件</button>
                        </s:elseif>
                        <s:elseif test="#request.id_template==3">
                            <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#newCase">创建用例构件</button>
                        </s:elseif>
                    </s:if>
                </div>
            </div>
            <s:if test="#request.id_template==1">
                <div id="mid" style="clear: both;height:450px;width:1200px;margin-left:200px;padding: 20px 75px 20px 75px;overflow: hidden">
                    <s:iterator value="list2">
                        <div  style="background-color: white;height: 115px;width:300px;float:left;margin: 0px 37.5px 30px 0px;padding: 5px" class="col-md-4 contact-box">
                            <div style="height:100px;margin: 10px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';color: black;font-weight:700;" >内容：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:500;overflow: hidden" id="commonContent"><s:property value="content"/></span>
                                <span style="display:none;font-family:'Arial Negreta', 'Arial Normal', 'Arial';color: black;font-weight:700;" id="idStructure"><s:property value="id_structure"/></span>
                            </div>
                            <s:if test="#request.library.id_user == #session.user.id_user">
                                <div style="float: right;z-index:99999999;margin: -40px 10px 0px 0px">
                                    <button id="deleteCommon" type="button" class="btn btn-warning btn-xs" myvalue="<s:property value="id_structure"/>">删除</button>
                                    <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editCommon">编辑</button>
                                    <div  class="modal inmodal" id="editCommon" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content animated bounceInRight">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                                                    </button>
                                                    <h4 class="modal-title">编辑通用构件</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group"><label>内容</label> <textarea id="editCommonContent" style="height: 300px" type="text" maxlength="100000" class="form-control" required="required"><s:property value="content"/></textarea></div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                                                    <button id="editCommon-button" type="submit" class="btn btn-primary" myvalue="<s:property value="id_structure"/>">保存</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </s:if>
                        </div>
                    </s:iterator>
                </div>
            </s:if>
            <s:if test="#request.id_template==2">
                <div id="mid" style="clear: both;height:450px;width:1300px;margin-left:150px;padding: 20px 75px 20px 75px;overflow: hidden">
                    <s:iterator value="list2">
                        <div  style="background-color: white;height: 200px;width:520px;float:left;margin: 0px 37.5px 30px 0px;padding: 5px;" class="col-md-4 contact-box">
                            <div style="height:20px;margin: 10px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">用户名：</span><span style="word-break:break-all;font-family:'Arial Normal', 'Arial';font-weight:500;overflow: hidden"><s:property value="roleName"/></span>
                            </div>
                            <div style="height:50px;margin: 0px 0px 0px 10px;float: left; overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">用户描述：</span><span style="word-break:break-all;font-family:'Arial Normal', 'Arial';font-weight:500;overflow: hidden"><s:property value="describe"/></span>
                            </div>
                            <div style="height:50px;margin: 0px 0px 0px 10px;float: left;overflow: hidden">
                                <div style="width: 60px;float: left"><span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">用户权限:</span></div>
                                <div style="float: left">
                                <span style="word-break:break-all;font-family:'Arial Normal', 'Arial';font-weight:500;overflow: hidden">
                                        <s:property value="permissions"/>
                                </span>
                                </div>
                            </div>
                            <s:if test="#request.library.id_user == #session.user.id_user">
                                <div style="z-index:99999999;margin: 130px 10px 0px 420px">
                                    <button id="deleteUser" type="submit" class="btn btn-warning btn-xs" myvalue="<s:property value="id_structure"/>">删除</button>
                                    <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editUser">编辑</button>
                                    <div  class="modal inmodal" id="editUser" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content animated bounceInRight">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                                                    </button>
                                                    <h4 class="modal-title">编辑用户构件</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group"><label>用户名</label> <input id="Usercontent2" type="text" maxlength="100" value="<s:property value="roleName"/>" class="form-control" required="required"></div>
                                                    <div class="form-group"><label>用户描述</label> <textarea id="Usercontent3"  style="height: 60px" type="text"  maxlength="2000" class="form-control" required="required"><s:property value="describe"/></textarea></div>
                                                    <div class="form-group"><label>用户权限</label> <textarea  id="Usercontent4"  style="height: 200px" type="text" maxlength="100000" class="form-control" required="required"><s:property value="permissions"/></textarea></div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                                                    <button id="editUser-button" type="submit" class="btn btn-primary" myvalue="<s:property value="id_structure"/>">保存</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </s:if>
                        </div>
                    </s:iterator>
                </div>
            </s:if>
            <s:if test="#request.id_template==3">
                <div id="mid" style="clear: both;width:1500px;margin-left:90px;padding: 20px 75px 20px 75px;overflow: hidden">
                    <s:iterator value="list3">
                        <div id="div1" style="background-color: white;width:600px;float:left;margin: 0px 37.5px 30px 0px;padding: 5px" class="col-md-4 contact-box">
                            <div style="margin: 10px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">功能点名称 ：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property value="funName"/></span>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';color: black;font-weight:700;">优先级 ：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:if test="#request.priority==1">高</s:if><s:if test="#request.priority==2">中</s:if><s:if test="#request.priority==3">低</s:if></span>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="color: black;font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;">功能点描述 ：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property value="describe"/></span>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">用例过程 ：</span><br/>
                                <s:iterator value="funRoleList">
                                    <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:500;">角色：<s:property value="roleName"/>　描述：<s:property value="roleDescribe"/>　<s:property value="usableName"/>　<s:property value="usablePara"/><br/></span>
                                </s:iterator>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="color: black;font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;">可用性 ：</span><br/>
                                <s:iterator value="funUsableList">
                                    <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:500;"><s:property value="usableName"/>　<s:property value="usablePara"/><br/></span>
                                </s:iterator>
                                <s:iterator value="funRoleList">
                                    <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:500;"><s:property value="usableName"/>  &nbsp; <s:property value="usablePara"/><br/></span>
                                </s:iterator>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">输入：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property escapeHtml="false" value="input"/></span>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="color: black;font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;">输出：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property escapeHtml="false" value="output"/></span>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="color: black;font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;">基本操作流程 ：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property escapeHtml="false" value="basic"/></span>
                            </div>
                            <div style="margin: 5px 0px 20px 10px;overflow: hidden">
                                <span style="color: black;font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;">备选操作流程 ：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property escapeHtml="false" value="alternative"/></span>
                            </div>
                            <s:if test="#request.library.id_user == #session.user.id_user">
                                <div style="z-index:99999999;margin: 130px 10px 0px 500px">
                                    <button id="deleteFun" type="submit" class="btn btn-warning btn-xs" myvalue="<s:property value="id_structure"/>">删除</button>
                                    <button type="button" class="btn btn-primary btn-xs" >编辑</button>
                                </div>
                            </s:if>
                        </div>
                    </s:iterator>
                </div>
            </s:if>
            <div id="footer" style="clear: both;text-align: center; margin-top:25px">
                <div id="pages" style="height: 50px;margin:0px auto;" class="btn-group">
                    <s:if  test="#request.page==1">
                        <button type="button" class="btn btn-gray"><i class="fa fa-chevron-left"></i></button>
                    </s:if>
                    <s:else><button type="button" class="btn btn-white turnpage lastPage"><i class="fa fa-chevron-left"></i></button></s:else>
                    <s:iterator begin="1" end="#request.num" step="1" status="st">
                        <s:if test="#request.page==#st.index+1">
                            <button type="button" class="btn btn-white active pagenum nowpage"><s:property value='#st.index+1'/></button></s:if>
                        <s:else ><button type="button" class="btn btn-white pagenum"><s:property value='#st.index+1'/></button></s:else>
                    </s:iterator>
                    <s:if test="#request.page==#request.num"><button type="button" class="btn btn-gray"><i class="fa fa-chevron-right"></i></button></s:if>
                    <s:else><button type="button" class="btn btn-white turnpage nextPage"><i class="fa fa-chevron-right"></i></button></s:else>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=basePath %>js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath %>js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath %>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath %>js/plugins/layer/layer.min.js"></script>
<script src="<%=basePath %>js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="<%=basePath %>js/contabs.min.js"></script>
<script src="<%=basePath %>js/plugins/pace/pace.min.js"></script>
<script src="<%=basePath %>js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath %>js/plugins/toastr/toastr.min.js"></script>
<script src="<%=basePath %>js/mjy.js"></script>
<script src="<%=basePath %>js/lzf.js"></script>
<script src="<%=basePath%>/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="<%=basePath %>js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote.min.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote-zh-CN.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote-bs4.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote-bs4.min.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote-lite.js"></script>

</body>
</html>
