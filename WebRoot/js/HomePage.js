
 window.onload = function()
 {
  document.getElementById("username").focus();
 }

function register() {
    //var username = $("#username").val();
    //var userpwd = $("#userpwd").val();
	$.ajax({
        url:"user/register.do",
        method:"post",
        data:$("#registerForm").serialize(),
        success:function () {
                alert("注册成功");
                clearInputs();
                $('#register').modal('hide');

        },
        error:function () {
            alert("注册失败");
        }
    })
}

function login() {
	//var username = $("#username").val();
    //var userpwd = $("#userpwd").val();
     $.ajax({
        url:"user/login.do",
        method:"post",
        dataType:"json",
        data:$("#loginForm").serialize(),//遍历表单中的数据
        success:function (user) {
            if(user.username != null && user.userpwd!= null){
                clearInputs();   
                $('#login').modal('hide');
                window.location.reload();
                //$("#logintoul").remove();
               // $("#logintoul").appendTo("#loginul");
            }else{
                alert("请输入用户名及密码!");
            }
        },
        error:function (data) {
        	console.log(data);
            alert("登录失败,请重新输入正确的用户名及密码!");
        }
    })
}

function logout() {
    $.ajax({
        url:"user/logout.do",
        method:"post",
        success:function () {
            location.reload();
            alert("退出成功");
        },
        error:function () {
            location.reload();
            alert("退出失败");
        }
    })
}
function clearInputs() {
    $("#username").val('');
    $("#userpwd").val('');
}

function isValidate(addComment) {
	var user_id=addComment.user_id.value;
	var content=CKEDITOR.instances.content.getData();
	 if (user_id == "") {
		alert("请先登录!");
		return false;
	} 
	
	if (content == "") {
		alert("请填写评论内容");
		return false;
	}
	insertComment(addComment);
	return false;//防止页面刷新
}

function insertComment(addComment){
	var user_id = addComment.user_id.value;
	var time = addComment.time.value;
	var username = addComment.username.value;
	var article_id = addComment.article_id.value;
	var content =CKEDITOR.instances.content.getData();
	console.log(user_id);
	console.log(time);
	console.log(article_id);
	console.log(content);
	$.ajax({									
		url:"comment/addComment.do",
		method:"post",
		data:"user_id="+user_id+"&article_id="+article_id+"&content="+content,//$("#addComment").serialize(),//
		success:function(data){
			$("#comment").append("<div class='panel'><p style='float:right'>" +
					"<a href=''>"+username+"</a>&nbsp;&nbsp;&nbsp;&nbsp;"+time+"评论&nbsp;&nbsp;&nbsp;&nbsp;</p><p>"+content+"</p></div>");
			CKEDITOR.instances.content.setData('');
			
		},
		error:function(data, XMLHttpRequest, textStatus, errorThrown){  
			console.log(data);  
			console.log(XMLHttpRequest.status);  
			console.log(XMLHttpRequest.readyState);  
			console.log(textStatus);  
			alert("评论失败!");
		}
		
	})
}
function addArticle(){
	$.ajax({
		url:"addArticle",
		method:"post",
		data:  $("#addArticle").serialize(), //"user_id="+user_id+"&sys_category_id="+sys_category_id+"&summary="+summary+"&content="+content,
		success: function(){
			alert("添加博客成功!");
			window.location.reload();
		},
		error:function(){
			alert("添加博客失败!");
		}
	})
}	

function updateArticle(){
	$.ajax({
		url:"updateArticle",
		method:"post",
		data:  $("#addArticle").serialize(), //"user_id="+user_id+"&sys_category_id="+sys_category_id+"&summary="+summary+"&content="+content,
		success: function(){
			alert("修改博客成功!");
		},
		error:function(){
			alert("修改博客失败!");
		}
	})
}	
function upUserInfo(userInfoForm){
	var id = userInfoForm.id.value;
	console.log(id);
	$.ajax({
		url:"upUserInfo.do",
		method:"post",
		data:  $("#userInfoForm").serialize(), //"user_id="+user_id+"&sys_category_id="+sys_category_id+"&summary="+summary+"&content="+content,
		success: function(){
			alert("修改信息成功!");
			window.location.href="userInfo?id="+id;
		},
		error:function(){
			alert("修改信息失败!");
		}
	})
	return false;
}
function updateSc(iput){
	var scname =iput.parent().siblings().children("#category_name").val(); /*td.parent().prev().find("input").val();*/
	var scid =iput.parent().siblings().children("#id").val();	
	$.ajax({
		url:"updateSc",
		method:"post",
		data:  "id="+scid+"&category_name="+scname, 
		success: function(){
			
			alert("修改分类列表成功!");
		},
		error:function(){
			alert("修改分类列表失败!");
		}
	})
	return false;
}
function addSc(iput){
	var scname =iput.parent().siblings().children("#category_name").val();
	if (scname == "") {
		alert("请填写评论内容");
		return false;
	}
	$.ajax({
		url:"addSc",
		method:"post",
		data:  "category_name="+scname, 
		success: function(){
			$("#sctable").append(
					'<tr>'+
						'<td><input id="category_name" class="form-control" type="text" value="'+scname+'"></td>'+
						'<td><input id="id" type="hidden" value=""></td>'+
						'<td><input class="btn btn-info" type="button" value="修改" onclick="updateSc($(this));">'+
						'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
						'<input class="btn btn-warning" type="button" value="删除" onclick="delSc($(this));"></td>'+
					'</tr>');
			alert("增加分类列表成功!");
			iput.parent().siblings().children("#category_name").val('');
		},
		error:function(){
			alert("增加分类列表失败!");
		}
	})
	return false;
}
function delSc(iput){
	var scname =iput.parent().siblings().children("#category_name").val();
	var scid =iput.parent().siblings().children("#id").val();	
	$.ajax({
		url:"delSc",
		method:"post",
		data:"id="+scid+"&category_name="+scname,
		success: function(){
			iput.parents("tr").empty();
			alert("删除分类成功!");
		},
		error:function(){
			alert("删除分类失败!");
		}
	})
	return false;
}
function isValidateSearch(searchForm) {
	var keyword=searchForm.keyword.value;
	 if (keyword==""||keyword ==null) {
		alert("请输入搜索内容!");
		return false;
	} 
	return true;
}
