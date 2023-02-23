<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 상품 전체 조회</title>
<style>
  div { box-sizing: border-box;}

    #productCount, #productSearch {
        width: 95%;
        margin: auto;
    }
    #productCount {
        padding-top: 30px;
        height: 100px;
    }
    #productCount table td {
        text-align: center;
    }
    #productSearch {
        height: 100px;
        padding-top: 30px;
    }
    #productList {
		width: 100%;
        height: 500px;
        overflow-y: scroll;
        overflow-x:hidden; 
        overflow-y:auto;
    }

    #productList_1 { 
    	width: 100%; 
    	margin: 0px 20px;
    }

    #productone { width: 100%; height: auto; padding-left: 90px; }

    #pro { width: 300px; float: left; margin-bottom: 50px; margin-right: 10px; }

    #pro p { margin: 0px; padding: 15px; font-size: 15px; }

	#productList {
		width: 95%;
		margin: auto;
	}
	
	.left div {
		padding-left: 60px;
		text-align: left;
		font-size: 22px;
		font-weight: 600;
	}
	
	.label p {
		height: 30px;
		line-height: 5px;
	}
	.proName p {
		width: 90%;
		height: 50px;
		line-height: 15px;	}
	#pro img {
		width: 100%;
		height: 100%;
		padding: 10px;
	}
	
	#pro img:hover {
		cursor: pointer;
	}
	
</style>
</head>
<body class="hold-transition sidebar-mini">

    <jsp:include page="../../common/poheader.jsp" />
 
    <jsp:include page="../../common/posidebar.jsp" />
    
  <div class="content-wrapper">
    <form id="showProduct" method="post" action="select.pro">
     <input type="hidden" name="sellerNo" value="${loginUser.sellerNo}">
 
          <br>
 			
          <!-- 콘텐츠 영역 제목 -->
          <div class="content-header">
             <div class="container-fluid">
                <div class="row mb-2">
                   <div class="col-sm-6">
                      <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품 전체 조회</h1>
                   </div>
                   <div style="width:97%;">
                   		<button type="button" class="btn btn-secondary" style="float: right;" onclick="location.href='insertEnroll.pro'">등록하기</button>
                   </div>
                </div> <!-- /.row -->
             </div> <!-- /.container-fluid -->
          </div> <!-- /.content-header -->
 
          <div class="content">
 

            <div id="productCount" class="card">
                <table style="margin: 0px 10px 0px 80px; width=100%;">
                   <tr>
                      <td width="5%"><img src="resources/uploadFiles/invoices.png" style="width:35px; hieght:35px;"></td>
                      <td width="5%">전체</td>
                      <td width="15%" class="left"><div id="all"></div></td>
                      <td width="5%"><img src="resources/uploadFiles/shop.png" style="width:35px; hieght:35px;"></td>
                      <td width="5%">판매중</td>
                      <td width="15%" class="left"><div id="onsale">${p.onSale}</div></td>
                      <td width="5%"><img src="resources/uploadFiles/minus.png" style="width:35px; hieght:35px;"></td>
                      <td width="5%">품절</td>
                      <td width="15%" class="left"><div id="soldout">${p.soldOut}</div></td>
                      <td width="5%"><img src="resources/uploadFiles/invoices.png" style="width:35px; hieght:35px;"></td>
                      <td width="5%">판매종료</td>
                      <td width="15%" class="left"><div id="noSale">${p.soldOut}</div></td>
                   </tr>
                </table>
            </div>
 
            <br>
 			
            <div id="productSearch"  class="card">
                <table width="100%">
                   <tr>
                      <td width="5%" align="right">${p.productName}</td>
                      <td width="85%"><input type="text" class="form-control" name="productName"  value="${param.productName}">
                      </td>
                      <td width="10%">
                         <button type="submit" class="btn btn-secondary" style="width: 80%;" 
                       >검색</button>
                      </td>
                   </tr>
                </table>
            </div>
            
            <br>
          
            <div id="productList" class="card">
             
                <div id="productList_1" class=" px-2 px-lg-1 mt-5">
                    <div id="productone">
                 
						<c:forEach var="p" items="${ list }">
						 	<c:if test="${ p.productStatus eq 1 }">
                       			<div id="pro" align="center">
	                            	<div style="width: 100%; height: 300px">
		                            	<img class="card-img-top"
		                            	src="resources/uploadFiles/${ p.attachment1}"
		                            	alt="..." onclick="location.href='detail.pro?productNo=${p.productNo}'" />
	                            	</div>
	                           		<div class="label"><p>판매중</p></div>
	                           		<div class="proName"><p>${p.productName}</p></div>
	                            	<div class="proPrice">${p.price}</div>
                            	</div>
                            </c:if>
                            
                            
                            <c:if test="${ p.productStatus eq 0 }">
								<div id="pro" align="center">
									<div style="width: 100%; height: 300px;">
			                            <img class="card-img-top"
			                            src="resources/uploadFiles/${ p.attachment1}"
			                            alt="..." onclick="location.href='detail.pro?productNo=${p.productNo}'" />
	                            	</div>
		                            <div class="label"><p>품절</p></div>
		                            <div class="proName"><p>${p.productName }</p></div>
		                            <div class="proPrice">${p.price}</div>
	                            </div>
                            </c:if>
					 </c:forEach>
				
                        </div>
					<div>
					
                    </div>
                </div>   
          </div>
       </div>
       
       <script> //카운트 조회용
       $(function() {
    	   console.log	("${loginUser.sellerNo}");
    	  $.ajax({
    		  url : "count.pro",
    		  data : {sellerNo :"${loginUser.sellerNo }"
    			  	 
    	  },
    		  success : function(result) {
    			  var soldOut = Number(result.soldOut);
    			  var onSale = Number(result.onSale);
    			  $("#all").text(soldOut+onSale);
    			  $("#onsale").text(result.onSale);
    			  $("#soldout").text(result.soldOut);
    			  $("#noSale").text(result.soldOut);
    		  },
    		  error : function() {
    			  console.log("카운트 조회용 ajax 요청 실패!");
    		  }
    	  }); 
       });
       </script>
       
       <!-- content -->
    </form>
    </div>
    <!-- content-wrapper -->
 </body>
</html>