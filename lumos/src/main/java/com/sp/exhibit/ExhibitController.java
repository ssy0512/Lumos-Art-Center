package com.sp.exhibit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;


@Controller("exhibit.exhibitController")
public class ExhibitController {
	@Autowired
	private ExhibitService exhibitService;
	
	@RequestMapping(value="/exhibit/main")
	public String main() {
		return ".exhibit.main";
	}
	
	@RequestMapping(value="/admin/exhibit/update", method=RequestMethod.GET)
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
	
	@RequestMapping(value="/admin/exhibit/update", method=RequestMethod.POST)
	public String updateSubmit(
			@RequestParam int num,
			Exhibit dto
			) throws Exception {
		
		dto.setExhibitNum(num);
		exhibitService.updateBoard(dto);
		// 수정 하기
		
		return "redirect:/exhibit/main";
	}
	
	//작품 찜하기
	@RequestMapping(value="/exhibit/insertExhibitInterest", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertBoardLike(
			@RequestParam int num,
			HttpSession session,
			HttpServletResponse resp
			) throws Exception {
		String state="true";
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> model = new HashMap<>();
		if(info==null) {
			resp.sendError(403);
			return model;
		}
		Map<String, Object> paramMap=new HashMap<>();
		paramMap.put("exhibitNum", num);
		paramMap.put("userId", info.getUserId());
		int result = exhibitService.insertBoardLike(paramMap);
		if(result==0) {
			state="false";
		}
		
		model.put("state", state);
		
		return model;
	}
	
	// 찜한 작품인지 여부
	@RequestMapping(value = "/exhibit/isExhibitInterest", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> isBoardLike(
			@RequestParam int num, HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<>();
		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(info==null) {
			state = "false";
			model.put("state", state);
			return model;
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("exhibitNum", num);
		paramMap.put("userId", info.getUserId());
		int result = exhibitService.countBoardLike(paramMap);
		if (result == 0) {
			state = "false";
		}

		model.put("state", state);

		return model;
	}
	
	@RequestMapping(value="/exhibit/info")
	public String infoMain(
			@RequestParam(value="num", defaultValue="0") int num,
			Model model
			) {
		
		List<Exhibit> list = exhibitService.listExHall();
		
		Exhibit dto = null;
		if(num==0) {
			dto = exhibitService.readExHall(list.get(0).getHallNum());
		} else {
			dto = exhibitService.readExHall(num);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		return ".exhibit.info.exInfo";
	}
	
	@RequestMapping(value="/admin/exHallinfo/update", method=RequestMethod.GET)
	public String updateHallInfoForm(
			@RequestParam int num,
			HttpSession session,
			Model model
			) {
		
		Exhibit dto = exhibitService.readExHall(num);
		if(dto==null) {
			return "redirect:/exhibit/info";
		}

		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".exhibit.info.created";
	}
	
	@RequestMapping(value="/admin/exHallinfo/update", method=RequestMethod.POST)
	public String updateHallInfoSubmit(
			@RequestParam int num,
			Exhibit dto
			) throws Exception {
		
		dto.setHallNum(num);
		exhibitService.updateBoard(dto);
		// 수정 하기
		
		return "redirect:/exhibit/info";
	}
	
	@RequestMapping(value = "/exhibit/article", method = RequestMethod.GET)
	public String article(
			@RequestParam(value="num") int num,
			HttpServletRequest req,
			Model model
			) {
		Exhibit dto = exhibitService.readBoard(num);
		if(dto==null) {
			return "redirect:/exhibit/main";
		}
		
		model.addAttribute("dto", dto);
		return ".exhibit.article";
	}
}
