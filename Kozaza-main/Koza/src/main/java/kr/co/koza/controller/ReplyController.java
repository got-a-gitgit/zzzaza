package kr.co.koza.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.koza.service.ReplyService;
import kr.co.koza.vo.ReplyVO;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	
	@RequestMapping("/replyContentAction")
	public String replyContentAction(ReplyVO requestParam) {
		
		replyService.writeReply(requestParam);
		
		return "redirect:readPostForm?contentIndex="+requestParam.getContentIndex();
	}
	
	@RequestMapping("/deleteReplyAction")
	public String deleteReplyAction(ReplyVO requestParam) {
		ReplyVO vo = replyService.selectByReplyIndex(requestParam);
		replyService.deleteReply(vo);
		
		return "redirect:readPostForm?contentIndex="+vo.getContentIndex();
	}
	
	@RequestMapping("/updateReplyAction")
	public String updateReplyAction(ReplyVO requestParam) {
		ReplyVO vo = replyService.selectByReplyIndex(requestParam);
		replyService.updateReply(requestParam);
		
		return "redirect:readPostForm?contentIndex="+vo.getContentIndex();
	}
}
