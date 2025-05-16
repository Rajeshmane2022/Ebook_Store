package com.entity;

public class BookDetails 
{
	private int bookId;
	private String bookName, author, bookCategory, status, photoName, email;
	private String price;
	

	
	public BookDetails(String bookName, String author, String bookCategory, String status, String photoName, String email, String price) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.bookCategory = bookCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
		this.price = price;
	}


	public BookDetails() {
		// TODO Auto-generated constructor stub
	}


	

	public int getBookId() {
		return bookId;
	}


	public void setBookId(int bookId) {
		this.bookId = bookId;
	}


	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getBookCategory() {
		return bookCategory;
	}

	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "BookDetails [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", bookCategory="
				+ bookCategory + ", status=" + status + ", photoName=" + photoName + ", email=" + email + ", price="
				+ price + "]";
	}
	
	
	
	
	
}
