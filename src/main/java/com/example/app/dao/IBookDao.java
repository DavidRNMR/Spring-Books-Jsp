package com.example.app.dao;

import com.example.app.entity.BookModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IBookDao extends JpaRepository <BookModel,Long> {

    public List<BookModel> findByUserId(Long userId);
    public List<BookModel> findByBorrowerId(Long userId);
    public List<BookModel> findByBorrowerIdOrUserId(Long borrowerId, Long userId);
}
