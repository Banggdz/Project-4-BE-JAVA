<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 20/09/2025
  Time: 10:19 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="buildingAPI" value = "/api/building"/>
<c:url var="buildingListURL" value="/admin/building-list"/>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content" id="main-content">
        <div class="main-content-inner">
            <div class="breadcrumb" id="breadcrumb">
                <script type="text/javascript">
                    try {
                        ace.settings.check('navbar', 'fixed')
                    } catch (e) {}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Quản lí tòa nhà</li>
                </ul>
<%--                /.breadcrumb--%>
            </div>
        </div>
        <div class="page-content" id="page-content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box ui-sortable-handle" id="widget-box-1">
                        <div class="widget-header">
                            <h5 class="widget-title">Tìm kiếm</h5>

                            <div class="widget-toolbar">
                                <div class="widget-menu">
                                    <a href="#" data-action="settings" data-toggle="dropdown">
                                        <i class="ace-icon fa fa-bars"></i>
                                    </a>

                                </div>
                            </div> <!-- đóng widget-toolbar đúng chỗ -->
                        </div> <!-- đóng widget-header đúng chỗ -->

                        <!-- widget-body phải nằm ngoài widget-header -->
                        <div class="widget-body">
                            <div class="widget-main" >
                                <form:form id="listForm" modelAttribute="modelSearch" action="${buildingListURL}" method="GET">
<%--                                action="/admin/building-list" --%>
                                    <div class="row">
    <div class="form-group">
        <div class="col-xs-12">
            <div class="col-sm-6">
                <div>
                    <label for="" class="name">Tên tòa nhà</label>
<%--                    <input type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                <form:input class="form-control" path="name"/>
                </div>
            </div>
            <div class="col-xs-6">
                <div>
                    <label for="" class="name">Diện tích sàn</label>
<%--                    <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                    <form:input clas="form-control" path="floorArea"/>

                </div>
            </div>
        </div>

        <div class="col-xs-12">
            <div class="col-sm-4">
                <label for="" class="name">Số tầng hầm</label>
<%--                <input type="text" class="form-control" name="numberOfBasement"value="${modelSearch.numberOfBasement}">--%>
                <form:input class="form-control" path="numberOfBasement"/>

            </div>
            <div class="col-sm-4">
                <label for="" class="name">Hướng</label>
<%--                <input type="text" class="form-control" name="direction"value="${modelSearch.direction}">--%>
                  <form:input class="form-control" path="direction"/>

            </div>
            <div class="col-sm-4">
                <label for="" class="name">Hạng</label>
<%--                <input type="number" class="form-control" name="level"value="${modelSearch.level}">--%>
                   <form:input class="form-control" path="level"/>
            </div>
        </div>

        <div class="col-xs-12">
            <div class="col-sm-3">
            <div>
                <label for="" class="name">Diện tích từ</label>
                <input type="text" class="form-control" name="areaFrom" value="${modelSearch.areaFrom}">
            </div>
            </div>
            <div class="col-sm-3">
                <label for="" class="name">Diện tích đến</label>
                <input type="text" class="form-control" name="areaTo" value="${modelSearch.areaTo}">
            </div>
            <div class="col-sm-3">
                <label for="" class="name">Giá thuê từ</label>
                <input type="number" class="form-control" name="rentPriceFrom">
            </div>
            <div class="col-sm-3">
                <label for="" class="name">Giá thuê đến</label>
                <input type="number" class="form-control" name="rentPriceTo">
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-xs-12">
            <div class="col-sm-2">
                <div>
                    <label for="" class="name">Quận</label>
                    <form:select class="form-control" path="district">
                        <form:option value="">---Chọn quận---</form:option>
                        <form:options items="${districts}" ></form:options>
                    </form:select>
                </div>
            </div>
            <div class="col-sm-5">
                <div>
                    <label for="" class="name">Phường</label>
                    <input type="text" class="form-control" name="ward" value="">
                </div>
            </div>
            <div class="col-sm-5">
                <div>
                    <label for="" class="name">Đường</label>
                    <input type="text" class="form-control" name="street" value="">
                </div>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-xs-12">
            <div class="col-sm-5">
                <label for="" class="name">Tên quản lý</label>
                <input type="text" class="form-control" name="managerName">
            </div>
            <div class="col-sm-5">
                <label for="" class="name">SĐT quản lý</label>
                <input type="text" class="form-control" name="managerPhone">
            </div>
            <div class="col-sm-2">
                <label for="" class="name">Nhân viên</label>
                <form:select class="form-control" path="staffId">
                    <form:option value="">---Chọn nhân viên---</form:option>
                    <form:options items="${listStaffs}"/>
                </form:select>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-xs-12">
            <div class="col-sm-6">
<%--                <label class="checkbox-inline">--%>
<%--                    <input type="checkbox" name="typeCode" value="NOI_THAT"> Nội thất--%>
<%--                </label>--%>
                <form:checkboxes items="${typeCodes}" path="typeCode"></form:checkboxes>
            </div>
        </div>
    </div>

    <div class="col-xs-12">
        <div class="col-sm-6">
            <button type="button" class="btn btn-danger" id="btnSearchBuilding">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                Tìm kiếm
            </button>
        </div>
    </div>
</div>

                                </form:form>
<div class="pull-right">
                                        <a href="/admin/building-edit">
                                        <button class="btn btn-info" title="Thêm tòa nhà">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                                <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                            </svg>
                                        </button>
                                        </a>
                                        <button class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                                <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                            </svg>
                                        </button>
                                    </div>

                                <!-- Bảng danh sách (xóa chữ 'v' thừa trước table) -->

                                <table id="tableList"
                                       class="table table-striped table-bordered table-hover dataTable no-footer"
                                       style="margin: 3em 0 1.5em;"
                                       role="grid">

                                    <thead>
                                    <tr>
                                        <th class="center">
                                        <label class="pas-rel">
                                                <input type="checkbox">
                                                <span class="lbl"></span>
                                            </label>

                                        </th>
                                        <th>Tên tòa nhà</th>
                                        <th>Địa chỉ</th>
                                        <th>Số tầng hầm</th>
                                        <th>Tên quản lý</th>
                                        <th>Số điện thoại quản lý</th>
                                        <th>Diện tích sàn</th>
                                        <th>Diện tích trống</th>
                                        <th>Diện tích thuê</th>
                                        <th>Phí môi giới</th>
                                        <th>Thao tác</th>
                                        <th class="hidden-480">Status</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="item" items="${buildingList}">
                            <tr>
                                        <td class="center">
                                            <label class="pas-rel">
                                                <input type="checkbox"class="ace"name="checkList" value="${item.id}">
                                                <span class="lbl"></span>
                                            </label>
                                        </td>
                                        <td>${item.name}</td>
                                        <td>${item.address}</td>
                                        <td>${item.numberOfBasement}</td>
                                        <td>${item.managerName}</td>
                                        <td>${item.managerPhone}</td>
                                        <td>${item.floorArea}</td>
                                        <td>${item.rentArea}</td>
                                        <td>${item.id}</td>
                                        <td>${item.id}</td>

                                        <!-- Action buttons -->
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <a class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">
                                                    <i class="ace-icon glyphicon glyphicon-list"></i>
                                                </a>
                                                <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${item.id}">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </a>
                                                <a class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})" >
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </a>
                                            </div>
                                        </td>

                                        <!-- Status -->
                                        <td><span class="label label-warning">Expiring</span></td>
                                    </tr>
                                    </c:forEach>


                                    </tbody>
                                </table>
                                <!-- End Bảng danh sách -->
                                <p class="alert alert-success">
                                    Raw denim you probably haven't heard of them jean shorts Austin.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%--/ maincontainer--%>
<div class="modal fade" id="assignmentBuildingModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 style="color:red;"><span class="glyphicon glyphicon-lock"></span> Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">

                <table id="staffList"
                       class="table table-striped table-bordered table-hover dataTable no-footer"
                       style="margin: 3em 0 1.5em;"
                       role="grid">

                    <thead>
                    <tr>
                        <th class="text-center">
                            <input type="checkbox">
                        </th>
                        <th>Tên Nhân Viên</th>
                    </tr>
                    </thead>

                    <tbody>

<%--                    <tr>--%>
<%--                        <td class="text-center">--%>
<%--                            <input type="checkbox"class="ace" id="checkbox_1" value="1">--%>
<%--                        </td>--%>
<%--                        <td>Nguyễn Văn A</td>--%>
<%--                    </tr>--%>

                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="Building" value="">
            </div>

            <div class="modal-footer">
                <button type="submit" id="btnassignmentBuilding" class="btn btn-default" ><span class="glyphicon glyphicon-remove"></span>Giao tòa nhà</button>
                <button type="submit" class="btn btn-warning" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>Đóng</button>
            </div>


        </div>
    </div>
</div>
<%--/modal fate --%>

<script>
     function assignmentBuilding(buildingId){
            // khi nhan nut giao toa nha : dau tien co ID cua toa nha . Lấy ID đó đưa vào hideden (vao value )
            $('#assignmentBuildingModal').modal();
            loadStaff(buildingId);
            $('#buildingId').val(buildingId); // đưa vào value, cho value = tòa nhà đang đưuọc giao
        }
        // load staff
        function loadStaff(buildingId){
            $.ajax({
                // add building
                type: "GET", // HTTP method, add
                url: "${buildingAPI}/" + buildingId + '/staffs', //call api
                // data: JSON.stringify(data), // transfer data to Json , client
                // contentType: "application/json", // client : Định dạng gửi dữ liệu gửi về
                // định dạng respond là dạng gì
                dataType: "JSON", // định dạng từ sever đẩy lên ntn, cấu trúc gì
                success: function (response) {
                    var row = '';
                    $.each(response.data, function (index, item) {
                        row += '<tr>';
                        row += ' <td class="text-center"><input type="checkbox"   value=' + item.staffId + ' id="checkbox_' +  item.staffId + '" class = "check-box-element "'    + item.checked + '/></td>';
                        row += '<td class="text-center" >' + item.fullName + '</td>';
                        row += '</tr>';
                    });
                    $('#staffList tbody').html(row);
                    console.info("success"); // respond : Backend gửi lên if success
                },
                error: function(response){
                    console.log("error");
                    <%--window.location.href = "<c:url value="/admin/building-list?message=error"/>";--%>
                    <%--console.log(response);--%>
                }
            });

        }
    $('#btnassignmentBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find("tbody input[type=checkbox]:checked").map(function(){
            return $(this).val();
        }).get();
        data["staffs"]=staffs;
        if(data["staffs"] != " "){
            assignment(data);
        }
    });
    function assignment(data){
      $.ajax({
                type: "POST",
                url: "${buildingAPI}/" +  'assignment' , //call api
                 data: JSON.stringify(data), // transfer data to Json , client
                contentType: "application/json", // client : Định dạng gửi dữ liệu gửi về
                // định dạng respond là dạng gì
                dataType: "JSON", // định dạng từ sever đẩy lên ntn, cấu trúc gì
                success: function (response) {
                    alert("success"); // respond : Backend gửi lên if success
                },
                error: function(response){
                   alert("error");
                    <%--window.location.href = "<c:url value="/admin/building-list?message=error"/>";--%>
                    <%--console.log(response);--%>
                }
            });
    }
    $('#btnSearchBuilding').click(function (e){
        e.preventDefault();
        $('#listForm').submit();
    });
    function deleteBuilding(id){
        var buildingId = [id];
        deleteBuildings(buildingId);
    }
    $('#btnDeleteBuilding').click(function (e){
        e.preventDefault();
        var buildingIds = $('#tableList').find('tbody input[type=checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        deleteBuilding(buildingIds);
    })
    function deleteBuildings(data){
    $.ajax({
            type: "DELETE",
            url: "${buildingAPI}/"+data,
            data: JSON.stringify(data),
            contentType:"application/json",
            dataType:"JSON",
            success: function (respond){
                console.log("Success");
            },
            error: function (respond){
                console.log("failed");
                console.log(respond);
            }
    })
    }
</script>
</body>
</html>
