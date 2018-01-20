<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="addUpdateForm">
	
		<input type="text" value="${user.userId }" name="userId"/><p></p>
		用户名<input class="easyui-textbox" value="${user.userName }" name="userName"/><p></p>
		<%-- 商品图 <input type="file" name="uploadImgName" id="toUpImg"/><p></p>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:$('#toUpImg').uploadify('upload','*')">开始上传</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-lock'" href="javascript:$('#toUpImg').uploadify('stopa')">停止上传</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:$('#toUpImg').uploadify('upload')">上传</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:$('#toUpImg').uploadify('cancel')">取消上传</a>
				<div id="fileQuence"></div>
				<div id="imgQuence"><img id="showImg" src="<%=request.getContextPath()%>/goods/showGoodsImg.do?goodsImgId=${gds.goodsImgId}" alt="none" ></div>
				<input type="hidden" value="${gds.goodsImgId }" name="goodsImgId"/> --%>
		性别：<input type="radio" ${user.userSex==1?'checked':'' } value="1" name="userSex"/>男
		 	 <input type="radio" ${user.userSex==2?'checked':'' } value="2" name="userSex"/>女<p></p>
		年龄：<input class="easyui-textbox" value="${user.userAge }" name="userAge"/><p></p>
				<p></p>
		生日：<input class="easyui-datebox" value="${user.userBirthday }" name="userBirthday"/><p></p>
		<%-- 商品类型<select name="goodsTypeId">
					<option value="">请选择</option>
					<option <c:if test="${gds.goodsTypeId==1 }">selected</c:if> value="1">清洁类</option>
					<option <c:if test="${gds.goodsTypeId==2 }">selected</c:if> value="2">食品类</option>
					<option <c:if test="${gds.goodsTypeId==3 }">selected</c:if> value="3">电器类</option>
					<option <c:if test="${gds.goodsTypeId==4 }">selected</c:if> value="4">其他类</option>
				</select> --%><p></p>
		<%-- 个人简介：<textarea name="hrmEmpIntroduce" class="easyui-kindeditor" style="width:100%;height:200px">${gds.hrmEmpIntroduce }</textarea> --%>
		<!-- <input type="button" name="update" value="修改"/> -->
	</form>
</body>
</html>