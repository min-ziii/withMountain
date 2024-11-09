package com.test.hike.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.hike.dao.CommunityDAO;
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
    	
    	List<CommunityBoardDTO> boardList = dao.boardList();
    	model.addAttribute("boardList", boardList);
    	
        return "community.photo";
    }
    
    @GetMapping("/free")
    public String free(Model model) {
    	
    	List<CommunityBoardDTO> boardList = dao.boardList();
    	model.addAttribute("boardList", boardList);
    	
    	return "community.free";
    }
    
    @GetMapping("/qna")
    public String qna(Model model) {
    	
    	List<CommunityBoardDTO> boardList = dao.boardList();
    	model.addAttribute("boardList", boardList);
    	
    	return "community.qna";
    }
    
    //글 추가
    @GetMapping("/add")
    public String add() {
    	return "community.add";
    }
    
    //글 수정
    @GetMapping("/edit")
    public String edit() {
    	return "community.edit";
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
    public String view(Model model, @RequestParam(required = false) Integer cm_board_id) {
        if (cm_board_id == null) {
            return "redirect:/error"; // cm_board_id가 없으면 오류 페이지로 리다이렉트
        }

        CommunityBoardDTO communityBoardDTO = dao.boardView(cm_board_id);
        model.addAttribute("communityBoardDTO", communityBoardDTO);
        
        return "community.view";
    }

    
    //글 삭제
    @GetMapping("/del")
    public String del() {
    	return "community.del";
    }
    
    
    
}




