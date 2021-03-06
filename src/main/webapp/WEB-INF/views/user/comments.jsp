<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>">
<script type="text/javascript">
	function iframeAutoFit() {
		try {
			if (window != parent) {
				var a = parent.document.getElementsByTagName("IFRAME");
				for ( var i = 0; i < a.length; i++) //author:meizz
				{
					if (a[i].contentWindow == window) {
						var h1 = 0, h2 = 0;
						a[i].parentNode.style.height = a[i].offsetHeight + "px";
						a[i].style.height = "10px";
						if (document.documentElement
								&& document.documentElement.scrollHeight) {
							h1 = document.documentElement.scrollHeight;
						}
						if (document.body)
							h2 = document.body.scrollHeight;
						var h = Math.max(h1, h2);
						if (document.all) {
							h += 4;
						}
						if (window.opera) {
							h += 1;
						}
						a[i].style.height = a[i].parentNode.style.height = h
								+ "px";
					}
				}
			}
		} catch (ex) {
		}
	}
	if (window.attachEvent) {
		window.attachEvent("onload", iframeAutoFit);
		//window.attachEvent("onresize",  iframeAutoFit);
	} else if (window.addEventListener) {
		window.addEventListener('load', iframeAutoFit, false);
		//window.addEventListener('resize',  iframeAutoFit,  false);
	}
</script>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<style type="text/css">
.background {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	font-family: "微软雅黑";
}

.topicTitle:link,.topicTitle:visited {
	color: #525252;
	text-decoration: none;
}

.topicTitle:hover {
	color: #2C86E5;
	text-decoration: underline;
}

.pageNav {
	width: 480px;
	height: 30px;
	margin-top: 15px;
	float: left;
}

.pageGo {
	width: 120px;
	height: 30px;
	line-height: 30px;
	margin-top: 15px;
	float: left;
	font-size: 13px;
	margin-top: 15px;
}

.pageNav a button {
	width: 35px;
	height: 30px;
	font-size: 14px;
	font-family: 微软雅黑;
	background-color: white;
	border: 1px solid silver;
}

.pageNav a button:HOVER {
	width: 35px;
	height: 30px;
	font-size: 14px;
	font-family: 微软雅黑;
	background-color: #A2C1DE;
	border: 1px solid silver;
}

.pageNav button {
	width: 35px;
	height: 30px;
	font-size: 14px;
	font-family: 微软雅黑;
	background-color: #EFF4FB;
	border: 1px solid silver;
}

.listCommentStyle {
	background-color: white;
	margin-bottom: 10px;
	border: 1px solid #C2D5E3;
}

.listCommentStyle a:link,.listCommentStyle a:visited {
	color: #000;
	text-decoration: none;
} /* 未被访问的链接 */ /*已被访问的链接 */
.listCommentStyle a:hover {
	color: #2979BF;
	font-weight: bolder;
	text-decoration: none;
} /* 鼠标指针移动到链接上 */
</style>
<div class="background">
	<div style="min-height: 350px;">
		<c:if test="${listComment.size()==0}">
			<h1 align="center" style="color: #6699CC">暂无评论</h1>
		</c:if>
		<c:forEach items="${listComment}" var="comment">
			<table class="listCommentStyle">
				<tr>
					<td
						style="border-bottom: 1px solid #C2D5E3;background-color: #EFF4FB;width:750px;height: 20px">
						<div style="width: 400px;text-align: left;float: left;">

							<font style="font-size: 12px;color: #817E7E;">&nbsp;状态：</font> <font
								style="font-size: 14px;color: red;"><c:if
									test="${comment.commentsTopic.status==0}">
								未结帖
							</c:if> <c:if test="${comment.commentsTopic.status==1}">
								已结帖
							</c:if> </font> <font style="font-size: 12px;color: #817E7E;">[问题积分: <c:out
									value="${comment.commentsTopic.integral}" />]&nbsp;[评论量: <c:out
									value="${comment.commentsTopic.countComment}" />]</font>
						</div>
						<div style="width: 300px;text-align: right;float: left;">
							<font style="font-size: 14px;color: #817E7E;">评论时间:<fmt:formatDate value="${comment.commentTime}" type="date"/>
							</font>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width:750px;height: 30px">
						<div
							style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width: 750px;float: left;font-size: 13px;color:#817E7E;">
							&nbsp;我评论了<a
								href="NC-JSP/user/home.jsp"
								target="_top" style="font-size: 15px;">“<c:out
									value="${comment.commentsTopic.topicsUser.nickname}" />”</a>的帖子<a
								style="font-size: 16px;font-weight: bold;"
								href="topics/toTheDetailPage?topicId=<c:out
								value="${comment.commentsTopic.id}" />&&nowPage=1"
								target="_top" class="topicTitle">“<c:out
									value="${comment.commentsTopic.title}" />”</a> [<a
								href="category/goCategory?categoryId=<c:out value="${comment.commentsTopic.topicsType.typesCategory.id}" />&&nowPage=1"
								target="_top" style="font-size: 13px;"><c:out
									value="${comment.commentsTopic.topicsType.typesCategory.namee}" />
							</a>-<a
								href="topics/getTopicsByTypeId?typeId=<c:out
								value="${comment.commentsTopic.topicsType.id}" />&&nowPage=1"
								target="_top" style="font-size: 13px;"><c:out
									value="${comment.commentsTopic.topicsType.name}" /> </a>]
							<c:if test="${comment.commentsTopic.niceTopic==1}">[<font
									color="red">精品</font>]</c:if>
							<c:if test="${comment.commentsTopic.niceTopic==0}"></c:if>
						</div>
					</td>
				</tr>
			</table>
		</c:forEach>

	</div>
	<c:if test="${listComment.size()!=0}">
		<div class="pageNav" align="right">
			<c:if test="${pageBean.totalPages == 1}">
				<button disabled="disabled" style="width: 80px;">上一页</button>
				<button disabled="disabled">1</button>
				<button disabled="disabled" style="width: 80px;">下一页</button>
			</c:if>

			<c:if test="${pageBean.totalPages == 2}">
				<c:if test="${pageBean.currentPage==1}">
					<button disabled="disabled" style="width: 80px;">上一页</button>
					<button disabled="disabled">1</button>
					<a
							href="users/getUserComments?nowPage=2"><button>2</button>
					</a>
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.currentPage+1}" />"><button
							style="width: 80px;">下一页</button> </a>
				</c:if>
				<c:if test="${pageBean.currentPage==2}">
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.currentPage-1}" />"><button
							style="width: 80px;">上一页</button> </a>
					<a
							href="users/getUserComments?nowPage=1"><button>1</button>
					</a>
					<button disabled="disabled">2</button>
					<button disabled="disabled" style="width: 80px;">下一页</button>
				</c:if>
			</c:if>
			<c:if test="${pageBean.totalPages == 3}">
				<c:if test="${pageBean.currentPage==1}">
					<button disabled="disabled" style="width: 80px;">上一页</button>
					<button disabled="disabled">1</button>
					<a
							href="users/getUserComments?nowPage=2"><button>2</button>
					</a>
					<a
							href="users/getUserComments?nowPage=3"><button>3</button>
					</a>
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.currentPage+1}" />"><button
							style="width: 80px;">下一页</button> </a>
				</c:if>
				<c:if test="${pageBean.currentPage==2}">
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.currentPage-1}" />"><button
							style="width: 80px;">上一页</button> </a>
					<a
							href="users/getUserComments?nowPage=1"><button>1</button>
					</a>
					<button disabled="disabled">2</button>
					<a
							href="users/getUserComments?nowPage=3"><button>3</button>
					</a>
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.currentPage+1}" />"><button
							style="width: 80px;">下一页</button> </a>
				</c:if>
				<c:if test="${pageBean.currentPage==3}">
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.currentPage-1}" />"><button
							style="width: 80px;">上一页</button> </a>
					<a
							href="users/getUserComments?nowPage=1"><button>1</button>
					</a>
					<a
							href="users/getUserComments?nowPage=2"><button>2</button>
					</a>
					<button disabled="disabled">3</button>
					<button disabled="disabled" style="width: 80px;">下一页</button>
				</c:if>
			</c:if>
			<c:if test="${pageBean.totalPages > 3}">
				<c:if test="${pageBean.currentPage==1}">
					<button disabled="disabled" style="width: 80px;">上一页</button>
					<button disabled="disabled">1</button>
					<a
							href="users/getUserComments?nowPage=2"><button>2</button>
					</a>
					<a><button disabled="disabled">...</button> </a>
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.totalPages}" />"><button>
						<c:out value="${pageBean.totalPages}"></c:out>
					</button> </a>
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.currentPage+1}" />"><button
							style="width: 80px;">下一页</button> </a>
				</c:if>
				<c:if test="${pageBean.currentPage<pageBean.totalPages&&pageBean.currentPage!=1}">
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.currentPage-1}" />"><button
							style="width: 80px;">上一页</button> </a>
					<a
							href="users/getUserComments?nowPage=1"><button>1</button>
					</a>
					<c:if test="${pageBean.currentPage>2}">
						<a><button disabled="disabled">...</button> </a>
					</c:if>
					<button disabled="disabled">
						<c:out value="${pageBean.currentPage}"></c:out>
					</button>
					<c:if test="${pageBean.currentPage<pageBean.totalPages-1}">
						<a><button disabled="disabled">...</button> </a>
					</c:if>
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.totalPages}" />"><button>
						<c:out value="${pageBean.totalPages}"></c:out>
					</button> </a>
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.currentPage+1}" />"><button
							style="width: 80px;" style="width: 80px;">下一页</button> </a>
				</c:if>
				<c:if test="${pageBean.currentPage==pageBean.totalPages}">
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.currentPage-1}" />"><button
							style="width: 80px;">上一页</button> </a>
					<a
							href="users/getUserComments?nowPage=1"><button>1</button>
					</a>
					<a><button disabled="disabled">...</button> </a>
					<a
							href="users/getUserComments?nowPage=<c:out value="${pageBean.currentPage-1}" />"><button>
						<c:out value="${pageBean.totalPages-1}"/>
					</button> </a>
					<button disabled="disabled">
						<c:out value="${pageBean.totalPages}"/>
					</button>
					<button disabled="disabled" style="width: 80px;">下一页</button>
				</c:if>
			</c:if>
		</div>
		<script type="text/javascript">
			function goPage() {
				var currentPage = parseInt($("#currentPage").val());
				var selectedPage = parseInt($("#selectPage").val());
				if (selectedPage != 0 && selectedPage != currentPage) {
					document.goPageForm.action = "users/getUserComments?nowPage="
							+ selectedPage;
					goPageForm.submit();
				}

			}
		</script>
		<div class="pageGo" align="right">
			<form action="user_GetComments.action" method="post"
				name="goPageForm">
				<input type="text" id="currentPage"
					value="<c:out value="${pageBean.currentPage}" />"
					style="display: none"> 第 <select onchange="goPage();"
					id="selectPage"
					style="width:70px;height:24px;border-radius:0;border: 1px solid silver;">
					<option value="0">请选择</option>
					<%
						int i = 1;
					%>
						<c:forEach begin="1" end="${pageBean.totalPages}">
							<option value="<%=i%>"><%=i%></option>
							<%
								i++;
							%>
						</c:forEach>
				</select> 页
			</form>
		</div>
	</c:if>
</div>