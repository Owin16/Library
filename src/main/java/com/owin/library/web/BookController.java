package com.owin.library.web;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.owin.library.domain.Book;
import com.owin.library.service.BookService;

@Controller
public class BookController {
	
	private static final String rootPath = System.getProperty("catalina.home");
	
	@Autowired
	private BookService bookService;
	
	 @Autowired
	// ServletContext context;
	
	@RequestMapping("/index")
	public String listBooks(Map<String, Object> map){


		map.put("book", new Book());
		map.put("bookList", bookService.listBook());
				
		return "library";
	}

	@RequestMapping("/")
	public String home() {
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("book") Book book, 
			BindingResult result, @RequestParam("file") MultipartFile file) {


		if(!file.isEmpty()) {
			if(validateFile(file)) {
				bookService.addBook(book);
				saveFile(book.getTitle(), file);
			}
			else return "err";
		}
		
		return "redirect:/index";
	}
	
	@RequestMapping("get/delete/{bookId}")
	public String deleteBook(@PathVariable("bookId") Integer bookId) {

		bookService.deleteBook(bookId);

		return "redirect:/index";
	}
	
	@RequestMapping("/get/{bookId}")
	public String getBook(@PathVariable("bookId") Integer bookId, Model model) {
		
		model.addAttribute("getBook", bookService.getBookById(bookId));
		model.addAttribute("editBook", bookService.getBookById(bookId));
		model.addAttribute("downloadBook", bookService.getBookById(bookId));
		
		return "book";
	}
	
	@RequestMapping(value = "/get/edit", method = RequestMethod.POST)
	public String editBook(@ModelAttribute("editBook") Book book,
			BindingResult result) {

		bookService.editBook(book);

		return "book";
	}
	
	public void saveFile(String fileName, MultipartFile file) {
		
		try {
			File book = new File (rootPath + "/resources/" + fileName);
			FileUtils.writeByteArrayToFile(book, file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean validateFile(MultipartFile file) {
		if (file.getContentType().equals("text/plain") ||
			file.getContentType().equals("text/html") ||
			file.getContentType().equals("text/xml") ||
			file.getContentType().equals("application/pdf") ||
			file.getContentType().equals("application/msword"))	
			
			return true;
		
		else return false;		
	}
	
}
