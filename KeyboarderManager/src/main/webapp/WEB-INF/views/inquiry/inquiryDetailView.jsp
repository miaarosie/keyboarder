<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 1:1 문의</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>

	#inquiryDetail { 
		width:95%;
		height: 750px;
		overflow-y: scroll;
		margin: auto;
	}
	
	#inquiryDetailContent_1 {
            width : 100%;
            margin: auto;
        }

        #inquiryDetailContent_2 {
            width : 100%;
            height: 90%;
            border: 2px solid black;
            border-radius: 10px;
            background-color : white;
        }
        #inquiryDetailContent_3 {
            width: 95%;
            margin: auto;
            margin-bottom: 60px;
            margin-top: 60px;
        }
        #replyContent{
            border : none;
            width : 100%;
            background-color: white;
        }
	
</style>
</head>
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

<c:choose>
	<c:when test="${ loginUser.sellerId eq 'admin' }">
		<jsp:include page="/WEB-INF/views/common/boheader.jsp" />
		<jsp:include page="/WEB-INF/views/common/bosidebar.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="/WEB-INF/views/common/poheader.jsp" />
		<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />
	</c:otherwise>
</c:choose>

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">
<br>
<!-- 콘텐츠 영역 제목 -->
    <div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
        <div class="col-sm-6">
            <h1 class="m-0" style="margin-left:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1:1 문의내역</h1>
        </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
    </div>

    <!-- 실제 콘텐츠 영역 -->
    <div class="content">
        <div id="inquiryDetail">
            <div id="inquiryDetailContent_1">
            <input type="button" class="btn btn-dark" value="목록" onclick="location.href='list.iq'" style="background-color:black; float: right; margin-left: 5px;">
            <br><br><br>
            <div id="inquiryDetailContent_2">
                <div id="inquiryDetailContent_3">
                    <table id="datatable-scroller"
                        class="table table-bordered tbl_Form">
                        <caption></caption>
                        <colgroup>
                            <col width="250px" />
                            <col />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th width="15%" class="active">판매자</th>
                                <td width="20%">${i.sellerName}</td>
                                <th width="15%">답변현황</th>
                                <td width="20%">
                                    <c:choose>
                                        <c:when test="${ i.inquiryReply eq '답변대기'}">
                                            답변대기
                                        </c:when>
                                        <c:otherwise>
                                        답변완료
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th class="active">제목</th>
                                <td colspan="3">${i.inquiryName}</td>
                            </tr>
                            <tr>
                                <th style=" height:200px;"class="active" >내용</th>
                                <td colspan="3">${ i.inquiryContent}</td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <c:choose>
                        <c:when  test="${loginUser.sellerId eq 'admin' }">
                            <c:choose>
                                <c:when test="${ i.inquiryReply ne '답변대기' }">
                                    <h4>답변내용</h4>
                                        <div id="inquiryReplyContent" style="margin-top:20px;">
                                            <table id="replyArea"
                                                class="table table-bordered tbl_Form">
                                                <caption></caption>
                                                <colgroup>
                                                    <col width="250px" />
                                                    <col />
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <td id="replyContent1">${ i.inquiryReply }</td>   
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div> 
                                </c:when>
                                <c:otherwise>
                                    <h4>답변작성</h4>
                                    <div>
                                        <table id="replyInsert"
                                                class="table table-bordered tbl_Form">
                                            <caption></caption>
                                            <colgroup>
                                                <col width="250px" />
                                                <col />
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th colspan="2" width="90%">
                                                        <textarea class="form-control" name="recontent" id="recontent" cols="55" rows="2" style="resize:none; width:100%; margin-top:10px;" onkeypress="onChange();" maxlength="1000"></textarea>
                                                        <div id="count" style=" width: 100%; text-align: right;">
                                                            <span>0</span> /1000
                                                        </div>
                                                    </th>
                                                    <th style="vertical-align:middle; "><button class="btn btn-dark" style="background-color:black; width:90%; height:35px; margin-left:5px; font-size:80%;" onclick="addReply();">등록하기</button></th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${ i.inquiryReply eq '답변대기' }">
                                    <h4>답변내용</h4>
                                    <div id="inquiryReplyContent" style="margin-top:20px;">
                                        <table id="replyArea"
                                            class="table table-bordered tbl_Form">
                                            <caption></caption>
                                            <colgroup>
                                                <col width="250px" />
                                                <col />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <td><textarea id="replyContent" style="resize:none;" disabled readonly>아직 답변이 작성되지 않았습니다. 조금만 기다려주세요.</textarea></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <h4>답변내용</h4>
                                    <div id="inquiryReplyContent" style="margin-top:20px;">
                                        <table id="replyArea"
                                            class="table table-bordered tbl_Form">
                                            <caption></caption>
                                            <colgroup>
                                                <col width="250px" />
                                                <col />
                                            </colgroup>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </div> 
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                    
                    <script>
                        $(function() {
                            $('#recontent').keyup(function () {		
                                $("#count>span").text($(this).val().length);  			
                            });
                        });

                        function onChange() {
                            var key = window.event.keyCode;
                            // enter키 처리
                            if (key === 13) {
                                document.getElementById("recontent").value = document.getElementById("recontent").value + "";
                                return false;
                            }
                            else {
                                return true;
                            }
                        }
                    </script>
                </div>
            </div>
            </div>
        </div>
        <script>

            function selectReplyList() {
                $.ajax({
                    url:"rlist.iq",
                    data : {ino:${ i.inquiryNo }},
                    success : function(result) {
                    	//console.log(result.inquiryReply);
                        $("#replyContent1").text(result.inquiryReply);
                        $("#replyArea>tbody").html("<tr><td>" + result.inquiryReply +"</td></tr>");
                    },
                    error : function() {
                        console.log("댓글리스트 조회용 ajax통신실패!");
                    }
                });
            }
            
            function addReply() {
            	console.log($("#recontent").val());
                if($("#recontent").val().trim().length != 0) {
                    $.ajax({
                        url : "rinsert.iq",
                        data : {
                            inquiryNo : ${i.inquiryNo},
                            inquiryReply : $("#recontent").val()
                        },
                        success : function(result) {
                 		//  console.log(result); 
                            if(result == "success") {
                              /*   selectReplyList();
                                $("#recontent").val("");
                                $('#count').html("<span>0</span>/1000");
							 */
 							location.reload();
                            }
                        },
                        error : function() {
                            console.log("댓글 작성용 ajax 통신실패!");
                        }
                    });
                } else {
                	alert("댓글작성 실패", " 댓글작성 후 등록을 요청해주세요.");
                }	
            }
            $(function() {
                selectReplyList();
            });
        </script>
    </div> <!-- /.content -->
</div> <!-- /.content-wrapper -->
</body>
</html>