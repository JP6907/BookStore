package com.jp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jp.po.BookCustom;
import com.jp.po.TypeCustom;
import com.jp.service.BookService;
import com.jp.service.TypeService;
import com.jp.utils.ImageUtils;
import com.jp.utils.PageUtil;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	@Qualifier("bookService")
	private BookService bookService;
	
	@Autowired
	@Qualifier("typeService")
	private TypeService typeService;
	
	
	 @RequestMapping("/toBookList")
	    public String toBookInfoList(Model model, @Param("pageNumNow")Integer pageNumNow) throws Exception{
		 	System.out.println("请求图书列表,页号:" + pageNumNow);
		 	//默认获取第一页
		 	int page = 1;
		 	//总页码数
		 	int pageNumTotal = bookService.getBookPagetotalNum();
		 	//如果有指定页码
		 	if(pageNumNow!=null){
		 		page = pageNumNow>=1?pageNumNow:1;
		 		page = page>pageNumTotal?pageNumTotal:page;
		 	}
		 	
		 	//要显示的页码列表
		 	List<Integer> pageList = PageUtil.getPageNumList(page, pageNumTotal);
		 	model.addAttribute("pageNumTotal", pageNumTotal);  //总页书
		 	model.addAttribute("pageList", pageList);  //要显示的页码列表
		 	model.addAttribute("pageNumNow", page); //当前页码
		 	System.out.println(page+"/" +pageNumTotal);
		 	
	        List<BookCustom> bookList = bookService.getBookListByPage(page, PageUtil.NumPerPageInBack);
	        
	        model.addAttribute("bookList" , bookList);
	        
	        return "book_list";
	    }
	 //搜索书籍
	 ///////////////
	 ///暂无分页功能
	 ///////////////
	 @RequestMapping("/queryBook")
	 public String queryBook(@Param("lsbn_name_type")String lsbn_name_type,
			 				@Param("pageNumNow")Integer pageNumNow,Model model) throws Exception{
		 
		 System.out.println("搜索书籍:" + lsbn_name_type);
		 List<BookCustom> bookList = bookService.queryBook(lsbn_name_type);
		 model.addAttribute("bookList", bookList);
		 return "book_list";
	 }
	
	//获取图书详情
	 @RequestMapping("/getBookItems")
	 public String getBookItems(@Param("lsbn")String lsbn){
		 
		 System.out.println(lsbn);
		 
		 return "forward:/book/toBookList";
	 }
	 
	 //添加书籍
	 @RequestMapping("/addBook")
	 public String addBook(Model model) throws Exception{
		//获取图书类型列表	 
		List<TypeCustom> typeList = typeService.getTypeList(null, null);
		model.addAttribute("typeList", typeList);
		 
		return "book_add";
	 }
		 
	//添加书籍提交
	 @RequestMapping("/addBookSubmit")
	public String addBookSubmit(HttpServletRequest request,
								@Param("bookCustom")BookCustom bookCustom,
								@RequestParam("image")MultipartFile image) 
								throws Exception{
			 
		System.out.println("添加书籍:");
		double price = bookCustom.getPrice();
		double currPrice = bookCustom.getCurrprice();
		//计算折扣
		double discount = ((double)Math.round(currPrice/price*100)/100) * 10;
		bookCustom.setDiscount(discount); //计算折扣
		
		System.out.println(bookCustom);
		//文件保存路径
		String imagePath = request.getServletContext().
				getRealPath("/" + ImageUtils.BookImageFolderName + "/");
		//保存
		bookService.addBook(bookCustom, image, imagePath);
		
		
		return "forward:/book/toBookList";
	 }
	 //修改书籍
	 @RequestMapping("/modifyBook")
	 public String modifyBook(@Param("lsbn")String lsbn, Model model) throws Exception{
		 
		System.out.println("修改图书信息---lsbn:" + lsbn);
		BookCustom bookCustom = bookService.getBookByLsbn(lsbn);
		model.addAttribute("bookCustom", bookCustom);
		//获取图书类型列表	 
		List<TypeCustom> typeList = typeService.getTypeList(null, null);
		model.addAttribute("typeList", typeList);
		 
		 return "book_modify"; 
	 }
	 
	 //修改书籍提交
	 /////////////
	 ///修改图片未添加
	 ////////////
	 @RequestMapping("/modifyBookSubmit")
	 public String modifyBookSubmit(@Param("bookCustom")BookCustom bookCustom, 
			 							Model model) throws Exception{
		 
		System.out.println("提交修改图书信息---:");
		
		double price = bookCustom.getPrice();
		double currPrice = bookCustom.getCurrprice();
		//计算折扣
		double discount = ((double)Math.round(currPrice/price*100)/100) * 10;
		bookCustom.setDiscount(discount); //计算折扣
		
		System.out.println(bookCustom);
		
		bookService.modifyBook(bookCustom);
		
		model.addAttribute("bookCustom", bookCustom);
		 
		return "book_modify"; 
	 }
	 
	 //删除书籍
	 @RequestMapping("/deleteBook")
	 public String deleteBook(@Param("lsbn")String lsbn) throws Exception{
		 
		System.out.println("删除书籍---lsbn：" + lsbn);
		List<String> lsbnList = new ArrayList<String>();
		lsbnList.add(lsbn);
		bookService.deleteBooks(lsbnList);
		 
		 return "forward:/book/toBookList"; 
	 }
	 

}
