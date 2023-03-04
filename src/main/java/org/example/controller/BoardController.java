package org.example.controller;
import org.example.domain.BoardDto;
import org.example.domain.PageHandler;
import org.example.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    BoardService boardService;
    @PostMapping("/modify")
    public String modify(BoardDto boardDto, Integer page, Integer pageSize, RedirectAttributes rattr, Model m, HttpSession session) {

        String writer = (String)session.getAttribute("id");
        boardDto.setWriter(writer);

        try {
            if (boardService.modify(boardDto)!= 1)
                throw new Exception("Modify failed.");

            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            rattr.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/board/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            m.addAttribute("msg", "MOD_ERR");
            return "board"; // 등록하려던 내용을 보여줘야 함.
        }
    }


    @PostMapping("/write") // insert니까 delete인 remove하고 동일
    public String write(BoardDto boardDto, RedirectAttributes rattr, Model m, HttpSession session) {
        String writer = (String)session.getAttribute("id");
        boardDto.setWriter(writer);
        try {
            if (boardService.write(boardDto) != 1)
                throw new Exception("Write failed.");
            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/board/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("mode", "new"); // 글쓰기 모드로
            m.addAttribute(boardDto);      // 등록하려던 내용을 보여줘야 함.
            m.addAttribute("msg", "WRT_ERR");
            return "board";
        }
    }

    @GetMapping("/write")
    public String write(Model m){
        m.addAttribute("mode", "new");
        return "board";
    }

    @PostMapping("/remove")
    public String remove(Integer bno, Integer page, Integer pageSize, RedirectAttributes rattr, Model m, HttpSession session){
       String writer = (String)session.getAttribute("id");
        try {
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
           int rowCnt = boardService.remove(bno, writer);
            if(rowCnt != 1)
                throw new Exception("board remove error");
            rattr.addFlashAttribute("msg", "DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR");
        }
        return "redirect:/board/list";
    }

    @GetMapping("/read")
    public String read(Integer bno, Integer page, Integer pageSize, Model m){//1234
        try {
            BoardDto boardDto = boardService.read(bno);
//        m.addAttribute("boardDto", boardDto);  // 아래 문장과 동일
            m.addAttribute(boardDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "board";
    }


    @GetMapping("/list")
    // 게시물리스트를 보여주는 메서드
    public String list(@RequestParam(defaultValue ="1") Integer page, @RequestParam(defaultValue = "10") Integer pageSize, Model m, HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

//        if(page == null) page=1;
//        if(pageSize == null) pageSize=10;

        try {
            int totalCnt = boardService.getCount();
            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);

           List<BoardDto> list = boardService.getPage(map);
           m.addAttribute("list", list);
           m.addAttribute("ph", pageHandler);
           m.addAttribute("page", page);
           m.addAttribute("pageSize", pageSize);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return "boardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id")!=null;
    }
}