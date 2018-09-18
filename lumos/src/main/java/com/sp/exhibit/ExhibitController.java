package com.sp.exhibit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller("exhibit.exhibitController")
public class ExhibitController {
	@Autowired
	private ExhibitService exhibitService;
	
	@RequestMapping(value="/exhibit/main")
	public String main() {
		return ".exhibit.main";
	}
	
	@RequestMapping(value="/exhibit/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			HttpSession session,
			Model model
			) {
		
		Exhibit dto = exhibitService.readBoard(num);
		if(dto==null) {
			return "redirect:/exhibit/main";
		}

		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".exhibit.created";
	}
	
	@RequestMapping(value="/exhibit/update", method=RequestMethod.POST)
	public String updateSubmit(
			@RequestParam int num,
			Exhibit dto
			) throws Exception {
		
		dto.setExhibitNum(num);
		exhibitService.updateBoard(dto);
		// 수정 하기
		
		return "redirect:/exhibit/main";
	}
	
}
