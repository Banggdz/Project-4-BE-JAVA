<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 20/09/2025
  Time: 10:18 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value = "/api/building"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {}
    </script>

    <div id="sidebar" class="sidebar responsive">
        <script type="text/javascript">
            try {
                ace.settings.check('sidebar', 'fixed')
            } catch (e) {}
        </script>

        <div class="sidebar-shortcuts" id="sidebar-shortcuts">
            <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                <button class="btn btn-success">
                    <i class="ace-icon fa fa-signal"></i>
                </button>

                <button class="btn btn-info">
                    <i class="ace-icon fa fa-pencil"></i>
                </button>

                <button class="btn btn-warning">
                    <i class="ace-icon fa fa-users"></i>
                </button>

                <button class="btn btn-danger">
                    <i class="ace-icon fa fa-cogs"></i>
                </button>
            </div>
            <!-- sidebar-shortcuts -->
            <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                <span class="btn btn-success"></span>

                <span class="btn btn-info"></span>

                <span class="btn btn-warning"></span>

                <span class="btn btn-danger"></span>
            </div>
        </div>
        <!-- /.sidebar-shortcuts -->

        <ul class="nav nav-list">
            <li class="active">
                <a href="index.html">
                    <i class="menu-icon fa fa-tachometer"></i>
                    <span class="menu-text"> Dashboard </span>
                </a>

                <b class="arrow"></b>
            </li>

        </ul>
    </div>

    <!-- /.main-container -->
    <div class="main-content">
        <div class="page-content" id="page-content">

            <div class="page-header">
                <h1>
                    Thêm tòa nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right">
                            overview &amp;stats
                        </i>
                    </small>
                </h1>
            </div>

            <div class="row">
                <form:form modelAttribute="buildingEdit" id="listForm" method="GET">

                <div class="col-xs-12">

                    <form class="form-horizontal" role="form" id="form-edit">
                        <div class="form-group">
                            <label class="col-xs-3">Tên tòa nhà</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="name"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Quận</label>
                            <div class="col-xs-2">
                                 <form:select class="form-control" path="district">
                        <form:option value="">---Chọn quận---</form:option>
                        <form:options items="${districts}" ></form:options>
                    </form:select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phường</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="ward" name="ward">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Đường</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="street" name="street">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Kết cấu</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="structure" name="structure">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Số tầng hầm</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="floors" name="floors">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Diện tích sàn</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="floorArea" name="floorArea">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Hướng</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="direction" name="direction">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Hạng</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="grade" name="grade">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Diện tích thuê</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="rentalArea" name="rentalArea">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Giá thuê</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="rentalPrice" name="rentalPrice">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Mô tả giá</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="priceDescription" name="priceDescription">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phí dịch vụ</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="serviceFee" name="serviceFee">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phí ô tô</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="carFee" name="carFee">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phí mô tô</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="motorFee" name="motorFee">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phí ngoài giờ</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="overtimeFee" name="overtimeFee">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Tiền điện</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="electricity" name="electricity">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Đặt cọc</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="deposit" name="deposit">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Thanh toán</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="payment" name="payment">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Thời hạn thuê</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="rentalTerm" name="rentalTerm">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Thời gian trang trí</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="decorationTime" name="decorationTime">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Tên quản lý</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="managerName" name="managerName">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">SĐT quản lý</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="managerPhone" name="managerPhone">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phí môi giới</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="brokerFee" name="brokerFee">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Loại tòa nhà</label>
                            <div class="col-xs-9">
                            <form:checkboxes items="${typeCodes}" path="typeCode"></form:checkboxes>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Ghi chú</label>
                            <div class="col-xs-9">
                                <textarea class="form-control" id="note" name="note"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Hình đại diện</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="file" id="avatar" name="avatar">
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-xs-3"></label>
                            <div class="col-xs-9">
                            <c:if test="${not empty buildingEdit.id}">
                                <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                                <button type="button" class="btn btn-warning" id="btnCancle">Hủy thao tác</button>
                            </c:if>
                            <c:if test="${ empty buildingEdit.id}">
                                <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm tòa nhà</button>
                                <button type="button" class="btn btn-warning" id="btnCancle">Hủy thao tác</button>
                            </c:if>
                            </div>
                        </div>
                        <form:hidden path="id"></form:hidden>
                    </form>

                </div>
</form:form>
            </div>
        </div>
    </div>
</div>
<script>
    $('#btnAddOrUpdateBuilding').click(function (){
        var data = {};
        var typeCode = [];
         var formData = $('#listForm').serializeArray();
        $.each(formData,function (i,v){
            if(v.name != 'typeCode'){
                data[""+v.name+""] = v.value;
            }
            else{
                typeCode.push(v.value);
            }
        });
        data['typeCode'] = typeCode;
        if(typeCode !=''){
            addOrUpdateBuilding(data);
        }
        else{
            window.location.href = "<c:url value = "/admin/building-edit?typeCode=require"/>";
        }

    });
    function addOrUpdateBuilding(data){
    $.ajax({
            type: "POST",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            contentType:"application/json",
            dataType:"JSON",
            success: function (respond){
                console.log("Success");
            },
            error: function (respond){
                console.log("failed");
                console.log(response);
            }
        })
    }
    $("#btnCancle").click(function (){
        window.location.href="/admin/building-list";
    })
</script>
</body>
</html>
