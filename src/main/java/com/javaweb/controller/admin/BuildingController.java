package com.javaweb.controller.admin;



import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.BuildingType;
import com.javaweb.utils.DistrictCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.HttpMediaTypeException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private BuildingService buildingService;

    @Autowired
    private IUserService userService;
    @RequestMapping(value="/admin/building-list",method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request){
        ModelAndView nav = new ModelAndView("admin/building/list");

//        để hiện lại form, ko mất dữ liệu trên các ô input khi submit
        nav.addObject("modelSearch",buildingSearchRequest);

//        dữ liệu trả về do nguoi dung nhap khi gọi API tìm kiếm tòa nhà
        List<BuildingSearchResponse> responseList = new ArrayList<>();
//        res.setListResult(buildingSearchResponse);
        nav.addObject("buildingListResponse",res);
        BuildingSearchResponse item1 = new BuildingSearchResponse();
        item1.setId(1L);
        item1.setName("ACM Building");
        item1.setAddress("138 Quang Trung, Pham Ngu Lao, Quan 1");
        item1.setNumberOfBasement(2L);
        item1.setManagerName("Anh Long");
        item1.setManagerPhone("0900000001");
        item1.setRentArea("100,200,300");
        BuildingSearchResponse item2 = new BuildingSearchResponse();
        item2.setId(2L);
        item2.setName("Building MA");
        item2.setAddress("Nguyen Hue, Tan Hai, Quan 3");
        item2.setNumberOfBasement(6L);
        item2.setManagerName("Anh Hai");
        item2.setManagerPhone("0900000002");
        item2.setRentArea("500,200,300");
        responseList.add(item1);
        responseList.add(item2);
        nav.addObject("buildingList",responseList);
        nav.addObject("listStaffs",userService.getStaffs());
        nav.addObject("districts", districtCode.type());
        nav.addObject("typeCodes", BuildingType.type());
        return nav;
    }
    @RequestMapping(value="/admin/building-edit",method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO,HttpServletRequest request){
        ModelAndView nav = new ModelAndView("admin/building/edit");
        nav.addObject("districts", DistrictCode.type());
        nav.addObject("typeCodes", BuildingType.type());

        return nav;
    }
    @RequestMapping(value="/admin/building-edit-{id}",method = RequestMethod.GET)
    public ModelAndView buildingEdit(@PathVariable("id") Long Id, HttpServletRequest request){
        ModelAndView nav = new ModelAndView("admin/building/edit");
        // xuong DB tim building theo id
        BuildingDTO buildingDTO = new BuildingDTO();
        buildingDTO.setName("Bang");
        buildingDTO.setId(Id);
        nav.addObject("buildingEdit",buildingDTO);
        return nav;
    }
}
