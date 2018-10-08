package com.sp.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mainController")
public class MainController {
	@Autowired
	private MainService service;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String method(Model model) {
		
		//메인슬라이드
		List<Slide> conList = service.conSlideBanner();
		if(conList!=null) {
			for(Slide dto : conList) {
				dto.setArticleAddr("/concert/article?num="+dto.getConcertNum());
			}
		}
		
		List<Slide> exList = service.exSlideBanner();	
		if(exList!=null) {
			for(Slide dto : exList) {
				dto.setArticleAddr("/exhibit/article?num="+dto.getExhibitNum());
			}
		}
		
		//공지
		List<MainBbs> ntcList = service.mainNtcList();
		
		//이벤트
		List<MainBbs> evtList = service.mainEvtList();
		
		int listLength = conList.size()+exList.size();
		
		model.addAttribute("ntcList", ntcList);
		model.addAttribute("evtList", evtList);
		model.addAttribute("listLength", listLength);
		model.addAttribute("conList", conList);
		model.addAttribute("exList", exList);
		return ".mainMainLayout";
	}
	
	@RequestMapping(value="/main/sitemap")
	public String sitemap() {
		return ".main.sitemap";
	}
}
