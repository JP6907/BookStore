package com.jp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jp.po.User;
import com.jp.service.UserService;



@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	/**
	 * 后台管理系统登陆
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param: @param loginname
	 * @param: @param password
	 * @param: @param model
	 * @param: @param session
	 * @param: @return
	 * @param: @throws Exception      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping(value="/manageSystemLogin")
	 public String manageSystemLogin(String loginname,String password,Model model,
			 HttpSession session) throws Exception{
		
		System.out.println("后台管理系统登陆请求......");
		User user = userService.login(loginname, password);
		if(user != null){
			System.out.println("登陆成功:" + user.getUsername() + " " + user.getIdentity());
			// 登录成功，将user对象设置到HttpSession作用范围域
			session.setAttribute("admin", user);
			session.setAttribute("identity", user.getIdentity());

			return "main";
		}else{
			System.out.println("登录名或密码错误:" + loginname + "---" + password);
			// 登录失败，设置失败提示信息，并跳转到登录页面
			model.addAttribute("message", "登录名或密码错误，请重新输入!");
			return "login";
		}
	}

	/**
	 * 处理/login请求
	 * @throws Exception 
	 * */
	@RequestMapping(value="/login")
	 public String login(String loginname,String password,Model model,
			 HttpSession session) throws Exception{
		
		System.out.println("用户登陆请求......");
		User user = userService.login(loginname, password);
		if(user != null){
			System.out.println("登陆成功:" + user);
			// 登录成功，将user对象设置到HttpSession作用范围域
			session.setAttribute("user", user);

			return "forward:/bookShop/toBookList";
		}else{
			System.out.println("登录名或密码错误:" + loginname + "---" + password);
			// 登录失败，设置失败提示信息，并跳转到登录页面
			model.addAttribute("message", "登录名或密码错误，请重新输入!");
			return "login";
		}
	}
	
	@RequestMapping(value="/loginout")
	 public String login(HttpSession session) throws Exception{
		
		System.out.println("用户退出登陆......");
		session.setAttribute("admin", null);
		return "forward:/bookShop/toBookList";
	}
	
	
}
