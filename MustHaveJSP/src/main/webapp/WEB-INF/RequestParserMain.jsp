<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>FileUpload</title>
	<style>
		table, tr, td {
			padding:5px;
			vertical-align: top;
			border: 1px solid black;
			border-collapse: collapse;
		}
		.title {
			background-color: lightgray;
			text-align: right;
			width: 100px;
		}
		.content {
			width: 300px;
		}
	</style>
</head>
<script>
    function validateForm(form) { 
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        return true;
    }
    function setFormAttributes(form) {
        const method = document.querySelector('select[name="method"]').value;
        const enctype = document.querySelector('select[name="enctype"]').value;

        console.log("method", method);
        console.log("enctype", enctype);
        
        form.method = method;
        form.enctype = enctype;
    }
    function methodChange(select) {
    	var enctypes = document.querySelector('select[name="enctype"]');
    	if (select.value === "get") {
    		 enctypes.disabled = true;
             // 파일 입력 필드를 비활성화 (disable)
             var fileInput = document.querySelector('input[name="ofile"]');
             if (fileInput)	fileInput.disabled = true;
    	} else {
			enctypes.disabled = false;
    	}
    }
    function enctypeChange(select) {
		var fileInput = document.querySelector('input[name="ofile"]');
		if (fileInput) {
    		if (select.value === "multipart/form-data")	fileInput.disabled = false;
    		else										fileInput.disabled = true;
		}
    }
    document.addEventListener('DOMContentLoaded', function() {
        var method = document.querySelector('select[name="method"]');
        if (method) methodChange(method);
        var enctype = document.querySelector('select[name="enctype"]');
        if (enctype) enctypeChange(enctype);
    });
</script>
<body>
<table>
	<tr>
		<td class="title">전송 방식</td>
		<td class="content">
			<select name="method" onclick="methodChange(this)">
				<option value="get" ${method == "GET"?"selected":"" }>GET</option>
				<option value="post" ${method == "POST"?"selected":"" }>POST</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="title">인코딩 방식</td> 
		<td class="content">
			<select name="enctype" onclick="enctypeChange(this)" disabled>
				<option value="application/x-www-form-urlencoded"
					${enctype == "application/x-www-form-urlencoded"?"selected":"" } >application/x-www-form-urlencoded</option>
				<option value="multipart/form-data"
					${enctype == "multipart/form-data"?"selected":"" } >multipart/form-data</option>
				<option value="text/plain"
					${enctype == "text/plain"?"selected":"" } >text/plain</option>
			</select>
		</td>
	</tr>
</table>
<form action="RequestParser" onsubmit="setFormAttributes(this); return validateForm(this);">
	<table>
		<tr>
			<td class="title">제목</td>
			<td class="content"><input type="text" name="title" value="title" style="width: 80%;"/></td>
		</tr>
		<tr>
			<td class="title">카테고리</td>
			<td class="content"> 
				<input type="checkbox" name="cate" value="사진" checked />사진 
				<input type="checkbox" name="cate" value="과제" />과제 
				<input type="checkbox" name="cate" value="워드" />워드 
				<input type="checkbox" name="cate" value="음원" />음원<br/>
			</td>
		</tr>
		<tr> 
			<td class="title">첨부파일</td>
			<td class="content"><input type="file" name="ofile" disabled /></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="전송하기" style="width: 80%;" /></td>
		</tr>
	</table>
</form>
<hr/>
${returnmsg}
</body>
</html>