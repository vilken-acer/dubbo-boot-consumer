<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/js/easyui/easyu_core.jsp"></jsp:include>
</head>
<body class="easyui-layout">
	<!-- easyUI  HTML 代码 -->
	<div id="easyui-panel"  data-options="fit:true" style="height:100%">
		<!-- <div id="easyui-panel" style="height:20%; padding:0px; margin:0px">
		  <form id="conditionForm">
		  
			员工姓名： <input class="easyui-searchbox" id="empName" data-options="searcher:searchEmp"/>
			员工编号： <input class="easyui-textbox" id="empName" data-options="searcher:searchEmp"/>
			员工部门：<select class="easyui-combobox" panelheight="auto" id="empDep"></select>
			部门编号：<select class="easyui-combobox" id="depCode"></select>
			 员工学历： <select class="easyui-combobox" id="empDegree">
							<option value="">请选择</option>
							<option value="1">高中</option>
							<option value="2">大学</option>
							<option value="3">傻货</option>
							<option value="4">神童</option>
						</select><p></p>
			员工的学历：<select class="easyui-combobox" style="width:100px" id="empDegreeB"></select>
			员工生日 ： <input class="easyui-datebox"  id="empMinBirthday" /> ~ <input class="easyui-datebox" id="empMaxBirthday" />
			 <div onclick="searchEmp()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</div>
			 <div onclick="searchEmpReset()" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">重置</div>
		</form>
		</div>  -->
		<div id="easyui-panel" style="height:80%; padding:0px; margin:0px">
			
			<!-- 个人头像 -->
			<div style="display: none">
				<div id="imgDiv">
					<img id="showImg" alt="none" width="50"/>
				</div>
			</div>
		
			<!-- 个人简介 -->
			<div  style="display: none">
				<div id="myIntroduceDiv">
					<!-- <div id="introduceA" class="easyui-linkbutton" data-options="iconCls:'icon-search'">简介</div> -->
					<a href="#" id="introduceA" class="easyui-linkbutton" plain="true" iconCls="icon-search"></a>
				</div>
			</div>
		
			<!-- 每行的操作按钮 -->
			<!-- <div style="display: none">
				<div id="actionDiv">
					<div id="editEmp" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</div>
					<div id="delEmp" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</div>
				</div>
			</div> -->
			<table id="userData"></table>  
			<!-- 定义工具栏 -->
			<div id="toolbarId">
				<div class="easyui-linkbutton" onclick="addUser();" data-options="iconCls:'icon-add'">新增</div>
				<div class="easyui-linkbutton" onclick="deleteUser();" data-options="iconCls:'icon-remove'">删除</div>
				<div class="easyui-linkbutton" onclick="editUserGloble();" data-options="iconCls:'icon-edit'">修改</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
		$('#userData').datagrid({
		    url:'<%=request.getContextPath()%>/user/selectUserList.do',
		    fit:true,
		    //开启分页功能
		    pagination:true,
		    //每页要展示的条数
		     pageSize:5,
		    //选择性每页要展示的条数
		    pageList:[3,5,7],
		    //singleSelect:true,
		    ctrlSelect:true, 
		    rownumber:true,
		    pagePosition:"both",
		    //引入工具栏
		    toolbar:"#toolbarId",
		    columns:[[
					{field:'checkThis',checkbox:true,width:2},
					{field:'userId',title:'用户ID',align:'center',width:100},
					{field:'userName',title:'名字',align:'center',width:90},    
					{field:'userSex',title:'性别',align:'center',width:90,
						formatter:function(value,row,index){
							return row.userSex==1?"男":"女";
						}	
					},    
					{field:'userAge',title:'年龄',align:'center',width:90},    
					{field:'userBirthday',title:'生日',align:'center',width:90},  
		        
		    ]]
		});
	})
	
	function addUser(){
		var addUser = $("<div></div>").dialog({
			title:"新增",
			href:"<%=request.getContextPath() %>/user/addUserPage.do",
			model:true,
			width:400,
			height:500,
			buttons:[{
				text:'取消',
				iconCls:'icon-cancel',
				handler:function(){
					addUser.dialog("destroy");
				}
			},{
				text:'保存',
				iconCls:'icon-add',
				handler:function(){
					alert($("#addUpdateForm").serialize());
					$.ajax({
						url:'<%=request.getContextPath() %>/user/addUser.do',
						type:'post',
						data:$("#addUpdateForm").serialize(),
						dataType:'',
						async:true,
						success:function(data){
							alert("Success!");
							addUser.dialog("destroy");
							$('#userData').datagrid("reload");
						},
						error:function(){
							alert("Fail......");
						}
					})
				}
			}]
		})
	}
	
	function deleteUser(){
		//alert(123);
		//获取要删除的员工信息的行对象  
	     var checkedRows = $('#userData').datagrid("getChecked");  
		 var delValue="";
	     if (checkedRows.length < 1) {  
	         $.messager.alert("提示","请选择要删除的数据");
	         return;
	     }else{
				$.messager.confirm("确认","确定要删除这条数据吗!",function(p){
			    	for (var i = 0; i < checkedRows.length; i++) {
			    		delValue+=checkedRows[i].userId+",";
					}
                    delValue = delValue.substring(0,delValue.length-1);
				     alert(delValue);

				     $.ajax({
							url:"<%=request.getContextPath()%>/user/deleteUser.do",
							type:"post",
							data:{'userId':delValue},
							dataType:"",
							success:function (data){
								alert("成功删除数据");
								$('#userData').datagrid("load");
							},error:function (){
								alert("删除失败");
							}
						})
	         }); 
	     }
	}
	
	//全局的但那个修改
	function editUserGloble(){
		var checkedRows = $("#userData").datagrid("getChecked");
		var id = "";
		if (checkedRows.length<1) {
			$.messager.alert("警告！","请选择要修改的数据");
			return;
		}else if (checkedRows.length!=1) {alert(123);
			$.messager.alert("提示！","请选择其中的一条数据进行修改！");
			return;
		}else{
			for (var i = 0; i < checkedRows.length; i++) {
				id = checkedRows[i].userId;
			}
			
		    
			var updateUser=$("<div></div>").dialog({
				title:"修改",
				//content中的href 引用的内容
				href:"<%=request.getContextPath()%>/user/editQueryUser.do?userId="+id,
				//模态模式
				modal:true,
				width:500,
				height:600,
				//底部图标
				buttons:
					
					[{
						text:'取消',
						iconCls:"icon-cancel",
						handler:function(){
							updateUser.dialog("destroy");
						  }
					},{
						
						text:'更新',
						iconCls:"icon-add",
						handler:function(){
							alert($("#addUpdateForm").serialize());
							//ajax向后台发送请求  成功回调函数中销毁对话框 刷新数据表格
							$.ajax({
								url:"<%=request.getContextPath()%>/user/addUser.do",
								type:"post",
								data:$("#addUpdateForm").serialize(),
								dataType:"",
								success:function (data){
									$.messager.alert("Success！","更新Success!");
									updateUser.dialog("destroy");
									$('#userData').datagrid("reload");
								},error:function (){
									$.messager.alert("Failed","更新失败");
								}
							})
							
						}
					}]
			})
					
		}
	}
	</script>
</body>
</html>