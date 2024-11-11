package com.test.hike.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.hike.dao.CommunityDAO;
import com.test.hike.dto.CommentsDTO;
import com.test.hike.dto.CommunityBoardDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {
	
	private final CommunityDAO dao;
	
	//글 리스트
    @GetMapping("")
    public String photo(Model model) {
    	
    	List<CommunityBoardDTO> boardList = dao.boardList("photo");
    	model.addAttribute("boardList", boardList);
    	
        return "community.photo";
    }
    
    @GetMapping("/free")
    public String free(Model model) {
    	
    	List<CommunityBoardDTO> boardList = dao.boardList("free");
    	model.addAttribute("boardList", boardList);
    	
    	return "community.free";
    }
    
    @GetMapping("/qna")
    public String qna(Model model) {
    	
    	List<CommunityBoardDTO> boardList = dao.boardList("qna");
    	model.addAttribute("boardList", boardList);
    	
    	return "community.qna";
    }
    
    //글 추가
    @GetMapping("/add")
    public String add() {
    	return "community.add";
    }
    
    //글 추가
    @PostMapping("/addok")
    public String addok(@RequestBody CommunityBoardDTO boardDTO) {
        // boardDTO에는 title, content, hashtags 등의 값이 자동으로 매핑됩니다.
        System.out.println("제목: " + boardDTO.getTitle());
        System.out.println("내용: " + boardDTO.getContent());
        System.out.println("해시태그: " + boardDTO.getHashtags());
        System.out.println("게시판 종류: " + boardDTO.getType());

        // 게시물 추가 로직
        dao.boardAdd(boardDTO);

        return "게시글이 성공적으로 추가되었습니다.";  // 응답 메시지 또는 리다이렉트 URL을 반환
    }


    //글 수정
    @GetMapping("/edit")
    public String edit(Model model, @RequestParam("cm_board_id") Integer cm_board_id) {
    	
    	CommunityBoardDTO communityBoardDTO = dao.boardView(cm_board_id);
    	List<String> tags = dao.boardTags(cm_board_id);
    	
    	communityBoardDTO.setHashtags(tags);
    	model.addAttribute("communityBoardDTO", communityBoardDTO);
    	
    	return "community.edit";
    }
    
    //글 수정
    @PostMapping("/editok")
    public String editok(@ModelAttribute CommunityBoardDTO boardDTO) {
    	
    	dao.boardEdit(boardDTO);
    	
    	return "redirect:/community/view?cm_board_id=" + boardDTO.getCm_board_id();
    }
    
    //글 상세
	/*
	 * @GetMapping("/view") public String view(Model model, Integer cm_board_id) {
	 * 
	 * CommunityBoardDTO communityBoardDTO = dao.boardView(cm_board_id);
	 * model.addAttribute("communityBoardDTO", communityBoardDTO);
	 * 
	 * return "community.view"; }
	 */
    @GetMapping("/view")
    public String view(Model model, @RequestParam("cm_board_id") int cm_board_id) {
       
        CommunityBoardDTO communityBoardDTO = dao.boardView(cm_board_id);
        List<CommentsDTO> comments =dao.commentsList(cm_board_id);
        int likeCount = dao.boardLikes(cm_board_id);
        
        model.addAttribute("communityBoardDTO", communityBoardDTO);
        model.addAttribute("comments", comments);
        
        return "community.view";
    }

    
    //글 삭제
    @GetMapping("/del")
    public String del(@RequestParam("cm_board_id") Integer cm_board_id) {
    	
    	dao.boardDel(cm_board_id);
    	
    	return "redirect:/community";
    }
    
    
    
}