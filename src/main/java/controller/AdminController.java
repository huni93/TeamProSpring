package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberMybatisDao;


@Controller
@RequestMapping("/admin/")
public class AdminController  {
   
   @Autowired
   HttpSession session;
   HttpServletRequest request;
   @Autowired
   MemberMybatisDao md;
   
   @RequestMapping("main")
   public String main() throws Exception {
      // TODO Auto-generated method stub
      return "admin/main";
   }
   
   @ModelAttribute
   protected void service(HttpServletRequest request) throws ServletException, IOException {
	  this.request=request;
	  request.setCharacterEncoding("utf-8");
	  this.session = request.getSession();
	  
      
   }
   
   @RequestMapping("boardban")
   public String boardban() throws Exception {
      
      
      
      return "admin/boardban";
      
      
      
      
   }
   
}