package com.owin.library.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;
import com.owin.library.domain.Book;



@Repository
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void addBook(Book book) {
		sessionFactory.getCurrentSession().save(book);	
	}

	@SuppressWarnings("unchecked")
	public List<Book> listBook() {
		return sessionFactory.getCurrentSession().createQuery("from Book").list();
	}

	@CacheEvict(value="bookCache", allEntries=true)
	public void deleteBook(Integer id) {
		Book book = (Book) sessionFactory.getCurrentSession().load(Book.class, id);
		
		if (book != null)
			sessionFactory.getCurrentSession().delete(book);
	}
	
	@Cacheable(value="bookCache")
	public Book getBookbyId(Integer id) {
		Book book = (Book) sessionFactory.getCurrentSession().load(Book.class, id);
		return book;
	}

	@CacheEvict(value="bookCache", allEntries=true)
	public void editBook(Book book) {

			sessionFactory.getCurrentSession().update(book);
	}
	
}

