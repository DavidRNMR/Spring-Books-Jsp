package com.example.app.service;

import com.example.app.dao.IBookDao;
import com.example.app.entity.BookModel;
import com.example.app.entity.UserModel;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {

    @Autowired
    private IBookDao iBookDao;

    public List<BookModel> findAll() {
        return iBookDao.findAll();

    }
    public BookModel oneBook(Long id){

        Optional<BookModel> optionalBookModel= iBookDao.findById(id);

        if(optionalBookModel.isPresent()){

            return optionalBookModel.get();
        }
            else{
                return null;
            }
    }
    public BookModel create (BookModel bookModel){
        return iBookDao.save(bookModel);
    }

    public BookModel update (BookModel bookModel){
        return iBookDao.save(bookModel);
    }
    public void delete (Long id){
        iBookDao.deleteById(id);
    }

    //remove borrower
    public void removeBorrower (BookModel bookModel){

        bookModel.setBorrower(null);
        iBookDao.save(bookModel);
    }

    //add borrower
    public void addBorrower (BookModel bookModel,UserModel userModel){
        bookModel.setBorrower(userModel);
        iBookDao.save(bookModel);
    }

    public List<BookModel> unBorroweredBooks(UserModel userModel){

        return iBookDao.findByBorrowerIdOrUserId(null,userModel.getId());
    }

    public List<BookModel>borroweredBooks(UserModel userModel){
        return iBookDao.findByBorrowerId(userModel.getId());

    }
    public List<BookModel> myBooks (UserModel userModel){
        return iBookDao.findByUserId(userModel.getId());
    }



}
