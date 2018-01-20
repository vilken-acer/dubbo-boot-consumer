<%--
  Created by IntelliJ IDEA.
  User: Acer-vilken
  Date: 2018/1/20
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户首页</title>
</head>
<jsp:include page="/js/easyui/easyu_core.jsp"></jsp:include>
<body class="easyui-layout">
    <div data-options="region:'north',title:'',split:true,height:120"></div>
    <%--<div data-options="region:'south',title:'下',split:true,height:130"></div>
    <div data-options="region:'east',title:'右',split:true,width:100"></div>  --%>
    <div data-options="region:'west',title:'',split:true,width:200">
        <div id="aa" class="easyui-accordion" fit="true">
            <div title="用户管理" data-options="iconCls:'icon-reload'", style="overflow:auto;padding:10px;">
                <div id="userTree"></div>
            </div>
            <div title="权限管理" data-options="iconCls:'icon-save'", selected:true" style="padding:10px;">
            <div id="powerTree"></div>
        </div>
        <div title="系统管理">
            <div id="systemTree"></div>
        </div>
    </div>
    </div>
    </div>
    <div data-options="region:'center',title:''">
        <div id="content_tabs" class="easyui-tabs" data-options="fit:true">
            <div title="首页">
                这是一个神奇的网站！欢迎被坑！！！
            </div>
        </div>
    </div>
<script>
    //用户管理
    $("#userTree").tree({
        url:"<%=request.getContextPath()%>/tree/getUserTreeData.do",
        onClick:function (node){
            if (node.href!=null) {
                var has = $("#content_tabs").tabs('exists', node.text);
                if (!has) {
                    $("#content_tabs").tabs('add',{
                        title:node.text,
                        closable:true,
                        href:"<%=request.getContextPath()%>/"+node.href
                    });
                }else{
                    $("#content_tabs").tabs('select', node.text);
                }
            }
        }
    });
    $("#powerTree").tree({
        url:"<%=request.getContextPath()%>/tree/getPowerTreeData.do",
        onClick:function (node){
            if (node.href!=null) {
                var has = $("#content_tabs").tabs('exists', node.text);
                if (!has) {
                    $("#content_tabs").tabs('add',{
                        title:node.text,
                        closable:true,
                        href:"<%=request.getContextPath()%>/"+node.href
                    });
                }else{
                    $("#content_tabs").tabs('select', node.text);
                }
            }
        }
    });
    $("#systemTree").tree({
        url:"<%=request.getContextPath()%>/tree/getSysTreeData.do",
        onClick:function (node){
            if (node.href!=null) {
                var has = $("#content_tabs").tabs('exists', node.text);
                if (!has) {
                    $("#content_tabs").tabs('add',{
                        title:node.text,
                        closable:true,
                        href:"<%=request.getContextPath()%>/"+node.href
                    });
                }else{
                    $("#content_tabs").tabs('select', node.text);
                }
            }
        }
    });
</script>
</body>
</html>
