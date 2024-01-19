package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartMybatisDao;
import model.Cart;

@Controller
@RequestMapping("/jumun/")
public class JumunController {

	@Autowired
	CartMybatisDao cd;
	HttpSession session;
	HttpServletRequest req;

	@ModelAttribute
	protected void service(HttpServletRequest request) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();
		this.req = request;
	}

	@RequestMapping("jumunAdd")
	public String jumunadd(int pnum) throws Exception {

		String id = (String) session.getAttribute("id");

		Cart c = new Cart();
		c.setUserid(id);
		c.setItemid(pnum);

		cd.addToAproducts(c);

		req.setAttribute("msg", "추가 되었습니다");
		req.setAttribute("url", "/jumun/jumunList");
		return "alert";

	}

	@RequestMapping("jumunList")
	public String jumunList() throws Exception {

		String id = (String) session.getAttribute("id");
		List<Cart> li = cd.jumunList(id);

		System.out.println(li);
		req.setAttribute("li", li);

		return "jumun/jumunList";
	}

	@RequestMapping("myList")
	public String myList() throws Exception {

		String id = (String) session.getAttribute("id");
		List<Cart> li = cd.myList(id);

		System.out.println(li);
		req.setAttribute("li", li);

		return "jumun/myList";
	}

}
