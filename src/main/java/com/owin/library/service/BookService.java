package com.owin.library.service;

import java.util.List;

import com.owin.library.domain.Book;

public interface BookService {

	public void addBook(Book book);
	public List<Book> listBook();
	public void deleteBook(Integer id);
	public Book getBookById(Integer id);
	public void editBook(Book book);
	
}
