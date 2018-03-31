package com.owin.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.owin.library.dao.BookDAO;
import com.owin.library.domain.Book;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDAO bookDAO;

	@Transactional
	public void addBook(Book book) {
		bookDAO.addBook(book);
	}

	@Transactional
	public List<Book> listBook() {
		return bookDAO.listBook();
	}

	@Transactional
	public void deleteBook(Integer id) {
		bookDAO.deleteBook(id);		
	}

	@Transactional
	public Book getBookById(Integer id) {	
		return bookDAO.getBookbyId(id);
	}

	@Transactional
	public void editBook(Book book) {
		bookDAO.editBook(book);
	}

}

