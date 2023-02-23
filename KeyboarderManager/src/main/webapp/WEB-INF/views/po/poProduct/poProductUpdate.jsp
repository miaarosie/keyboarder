
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 상품 상세 조회</title>
<style>

#title_sub {
	font-size: 13px;
	margin-left: 8px;
}

#product_img_list{
    border-collapse: collapse;
    width: 100%;
    margin:auto;
}
#buttonarea{
	width: 95%;
}
#buttonarea button{
	float: right;
	margin:5px;
	margin-bottom:20px;
}
#contentarea {
	width: 95%;
	margin: auto;
	padding: 20px;
}



</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/poheader.jsp" />

	<jsp:include page="../../common/posidebar.jsp" />

	<div class="content-wrapper">
	<br>
	<!-- 콘텐츠 영역 제목 -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0" style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품
                                    상세 조회</h1>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	
	<div class="content">
		<div id="contentarea" class="card">
		<form id="postForm" method="post" action="" enctype="multipart/form-data">
	
    <input type="hidden" name="productNo" value="${p.productNo}">
  <input type="hidden" name="sellerNo" value="${loginUser.sellerNo}">
   <c:if test="${p.productStatus eq 0 }">
	<div id="buttonarea">
		<button type="button"  class="btn btn-secondary" onclick="postFormSubmit(1);">수정하기</button>
		<button type="button"  class="btn btn-secondary"onclick="postFormSubmit(3);">공개하기</button>
		</div>
		</c:if>
		
	<c:if test="${p.productStatus eq 1 }">
		<div id="buttonarea">
		<button type="button"  class="btn btn-secondary" onclick="postFormSubmit(1);">수정하기</button>
		<button type="button"  class="btn btn-secondary" onclick= "postFormSubmit(2);">삭제하기</button>
		</div>
		</c:if>
		
                 <table id="product_img_list" style="height:500px;">
                     
                 <tr>
                  <td rowspan="2" style="width:40%;">
                      <!-- Product image-->
                      <img class="card-img-top" id="img1"
                          src="resources/uploadFiles/${ p.attachment1}"
                          alt="..." style="width: 500px; height:500px;"/>
                          <label for="attachNo">
							</label> 
							<c:if test="${not empty p.attachment1}">
							<input type="file" id="file1" name="reupfile" onchange="addImg();"/>
							<input type="hidden" name="originfile" value="${p.attachment1 }">
						</c:if>	
                 	</td>
                  <td colspan="6" style="height: 250px; width:60%">
                  		<div style="height: 30%;">
                  			상품명 : <input type="text" style="width:700px; border:none;" name="productName" value="${p.productName}"><br><Br>
                  			상품가격: <input type="text" style="width:400px; border:none;" name="price" value="${p.price}">
                  		</div>
                  		<div style="height: 70%;">상품설명<hr>
                  		<textarea style="resize: none; width: 100%; height: 170px; border:none;" name="description" required>${p.description}</textarea></div>	
                  </td>
                 </tr>
				<tr id="subpic">
                 <td>
                 <br>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top" id="img2"
                           src="resources/uploadFiles/${p.attachment2}"
                           alt="..." style="width: 250px; height: 250px;" />
							<c:if test="${not empty p.attachment2}">
							<input type="file" id="file2" name="reupfile" onchange="addImg();"/>
							<input type="hidden" name="originfile" value="${p.attachment2 }">
						</c:if>		
                  </div> 
                 </td>
                 <td>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top" id="img3"
                           src="resources/uploadFiles/${ p.attachment3}"
                           alt="..." style="width: 250px; height: 250px;"/> 
							<c:if test="${not empty p.attachment3}">
							<input type="file" id="file3" name="reupfile" onchange="addImg();"/>
							<input type="hidden" name="originfile" value="${p.attachment3 }">
                           </c:if>		
                  </div>
                 </td>
                 <td>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top" id="img4"
                           src="resources/uploadFiles/${ p.attachment4}"
                           alt="..." style="width: 250px; height: 250px;"/>
							<c:if test="${not empty p.attachment4}">
							<input type="file" id="file4" name="reupfile" onchange="addImg();"/>
							<input type="hidden" name="originfile" value="${p.attachment4 }">
                           </c:if>	
                  </div>
                 </td>
                 <td colspan="3">
                 </td>
             	</tr>
             </table>
             <script>
  
             
         	$('#file1').change(function(){
    		    setImageFromFile(this,'#img1');
    		});
    		$('#file2').change(function(){
    		    setImageFromFile(this,'#img2');
    		});
    		$('#file3').change(function(){
    		    setImageFromFile(this,'#img3');
    		});
    		$('#file4').change(function(){
    		    setImageFromFile(this,'#img4');
    		});

    		function setImageFromFile(input, expression) {
    		    if (input.files && input.files[0]) {
    		        var reader = new FileReader();
    		        reader.onload = function (e) {
    		            $(expression).attr('src', e.target.result);
    		        }
    		        reader.readAsDataURL(input.files[0]);
    		    }
    		}
    		
    		function postFormSubmit(num){
    			if(num ==1){
    				$("#postForm").attr("action","update.pro").submit();
    				
    			}else if(num==2){
    				$("#postForm").attr("action","delete.pro").submit();
    			}else{
    				$("#postForm").attr("action","change.pro").submit();
    			}
    		}
          
             </script>
		</form>
		
		</div> <!-- /#contentarea -->
	</div>
</div>
</body>
</html>