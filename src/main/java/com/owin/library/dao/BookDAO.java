package com.owin.library.dao;

import java.util.List;
import com.owin.library.domain.Book;

public interface BookDAO {
	
	public void addBook(Book book);	
	public List<Book> listBook();	
	public void deleteBook(Integer id);
	public Book getBookbyId(Integer id);
	public void editBook(Book book);

}
