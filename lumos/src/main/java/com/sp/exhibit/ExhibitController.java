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

import com.sp.exhibit.schedule.DateUtil;
import com.sp.member.SessionInfo;


@Controller("exhibit.exhibitController")
public class ExhibitController {
	@Autowired
	private ExhibitService exhibitService;
	
	@RequestMapping(value="/exhibit/main")
	public String main() {
		return ".exhibit.main";
	}
	
	@Autowired
	private DateUtil dUtil;
	
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
			@RequestParam String content,
			Exhibit dto
			) throws Exception {
		
		dto.setExHallImage(content);
		dto.setHallNum(num);
		exhibitService.updateExHall(dto);
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
		
		List<String> listPrice = exhibitService.exhibitPrice(num);
		
		if(listPrice!=null && listPrice.size() > 0) {
			String exPriceString="";
			for( String s : listPrice) {
				exPriceString+=s+" / ";
			}
			exPriceString=exPriceString.substring(0, exPriceString.length()-3);
			dto.setExPriceString(exPriceString);
		}
		
		model.addAttribute("dto", dto);
		return ".exhibit.article";
	}
	
	@RequestMapping(value = "/exhibitReview/created", method = RequestMethod.GET)
	public String createdReviewForm(
			@RequestParam(value="num") int num,
			HttpSession session,
			Model model) throws Exception {
		Exhibit dto = exhibitService.readBoard(num);
		if(dto==null) {
			return "redirect:/exhibit/main";
		}
		
		int sysDate = Integer.parseInt(dUtil.syadateToString().replaceAll("-", ""));
		int srtDate = Integer.parseInt(dto.getExhibitStart().replaceAll("-", ""));
		
		if(sysDate<srtDate) {
			return "redirect:/exhibit/main";
		}
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", info.getUserId());
		paramMap.put("exhibitNum", num);
		
		ExReview rdto = exhibitService.readExReviewForUpdate(paramMap);
		if(rdto==null) {
			model.addAttribute("mode", "created");
		} else {
			model.addAttribute("rdto", rdto);
			model.addAttribute("mode", "update");
		}
		
		model.addAttribute("dto", dto);
		return ".exhibit.createdReview";
	}
	
	@RequestMapping(value = "/exhibitReview/created", method = RequestMethod.POST)
	public String createdReviewSubmit(
			@RequestParam(value="num") int num,
			ExReview dto,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		
		dto.setExhibitNum(num);
		exhibitService.insertExReview(dto);
		
		model.addAttribute("dto", dto);
		return "redirect:/mypage/myActivity";
	}
	
	@RequestMapping(value = "/exhibitReview/update", method = RequestMethod.POST)
	public String updateReviewSubmit(
			@RequestParam(value="num") int num,
			ExReview dto,
			Model model) throws Exception {
		
		dto.setExreviewNum(num);
		exhibitService.updateExReview(dto);
		
		return "redirect:/mypage/myActivity";
	}
	
	@RequestMapping(value = "/bookExhibit/form", method = RequestMethod.GET)
	public String bookExhibitForm(
			@RequestParam(value="exhibitNum") int num,
			HttpSession session,
			Model model) throws Exception {
		
		Exhibit dto = exhibitService.readBoard(num);
		if(dto==null) {
			return "redirect:/exhibit/main";
		}
		
		List<String> listPrice = exhibitService.exhibitPrice(num);
		
		if(listPrice!=null && listPrice.size() > 0) {
			String exPriceString="";
			for( String s : listPrice) {
				exPriceString+=s+" / ";
			}
			exPriceString=exPriceString.substring(0, exPriceString.length()-3);
			dto.setExPriceString(exPriceString);
		}
		
		List<Exhibit> audienceList = exhibitService.audienceList(num);
		
		model.addAttribute("audienceList", audienceList);
		model.addAttribute("dto", dto);
		return ".exhibit.book.form";
	}
}
