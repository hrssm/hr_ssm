package hr.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.RequestMethod;

import hr.pojo.User;
import hr.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	//要使用service
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login.do")
	public String login(User user,HttpServletRequest request)
	{
		User userTemp = userService.queryUserByUname(user.getU_name());
		System.out.println("进入登录");
		if(userTemp != null)
		{
			if(user.getU_password() != null && userTemp.getU_password() != null)
			{
				if(user.getU_password().equals(userTemp.getU_password()))
				{
					request.getSession().setAttribute("userlogin", userTemp);
					
					return "redirect:/index.jsp";
				}
			}
		}
		System.out.println("登录失败");
		return "redirect:/login.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/validUname.do")
	public boolean validUname(String u_name)
	{
		if(u_name!= null && null != userService.queryUserByUname(u_name))
			return true;
		else 
			return false;
	}
	
	@RequestMapping("/registerUser.do")
	public String registerUser(User user)
	{
		System.out.println(user.getU_name());
		
		boolean flag = false;
		if(user != null)
		{
			if(user.getU_name() != null && null == userService.queryUserByUname(user.getU_name()))
			{
				flag = true;
			}
		}
		System.out.println(flag);
		if(flag)
		{
			userService.addUser(user);
			return "redirect:/login.jsp";
		}else {
			return "redirect:/register.jsp";
		}
	}
}
