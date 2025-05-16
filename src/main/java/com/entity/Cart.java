package com.entity;

public class Cart {
    
    private int cid;
    private int bid;
    private int uid;
    private String bookName;
    private String author;
    private Double price;
    private Double totalPrice;

    // Default Constructor
    public Cart() {
    }

    // Parameterized Constructor
    public Cart(int cid, int bid, int uid, String bookName, String author, Double price, Double totalPrice) {
        this.cid = cid;
        this.bid = bid;
        this.uid = uid;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.totalPrice = totalPrice;
    }

    // Getters and Setters

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    // toString() method for debugging
    @Override
    public String toString() {
        return "Cart [cid=" + cid + ", bid=" + bid + ", uid=" + uid + ", bookName=" + bookName + 
               ", author=" + author + ", price=" + price + ", totalPrice=" + totalPrice + "]";
    }
}
