package kr.co.koza.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.koza.service.ThumbsupService;
import kr.co.koza.vo.ThumbsupVO;

@Controller
public class ThumbupController {
	@Autowired
	private ThumbsupService thumbsupService;
	
	
	// 게시글 좋아요
	@RequestMapping(value="/thumbsupProcess", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String thumbsupProcess(ThumbsupVO thumbsupVO){
		String resultText = thumbsupService.thumbsupProcess(thumbsupVO);
		
		return resultText;
	}
}
