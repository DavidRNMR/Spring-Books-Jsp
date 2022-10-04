package com.example.app.controllers;

import com.example.app.entity.BookModel;
import com.example.app.entity.LoginUser;
import com.example.app.entity.UserModel;
import com.example.app.service.BookService;
import com.example.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private BookService bookService;

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String index(Model model){
        //create an user and loginUser

        model.addAttribute("newUser",new UserModel());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }

    //process registred logic
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") UserModel newUser, BindingResult result, Model model, HttpSession httpSesion){

      UserModel user = userService.register(newUser,result);

      if(result.hasErrors()){
          model.addAttribute("newLogin", new LoginUser());
          return "index.jsp";
      }
      //store id from the database in the session
      httpSesion.setAttribute("userId",user.getId());
      return "redirect:/books";
    }

    //process login logic
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin")LoginUser loginUser, BindingResult result,Model model, HttpSession httpSession){

        UserModel user = userService.login(loginUser,result);

        if(result.hasErrors()|| user==null){

            model.addAttribute("newUser", new UserModel());
            return "index.jsp";
        }
        httpSession.setAttribute("userId",user.getId());
        httpSession.setAttribute("firstName",user.getFirstName());
        httpSession.setAttribute("lastName",user.getLastName());

        return "redirect:/books";
    }
    //render dashboard

    @GetMapping("/books")
    public String dashboard(HttpSession httpSession,Model model){

        Long userId = (Long)httpSession.getAttribute("userId");
        if(userId==null){
            return "redirect:/logout";
        }
        List<BookModel> bookList = bookService.findAll();

        model.addAttribute("user",userService.getOne(userId));
        model.addAttribute("bookList",bookList);

        return "dashboard.jsp";
    }

    //render book form
    @GetMapping("/books/new")
    public String showBookForm(@Valid @ModelAttribute("newBook")BookModel bookModel,HttpSession httpSession){

        if(httpSession.getAttribute("userId")==null){
            return "redirect:/logout";
        }
        return "bookForm.jsp";
    }

    //process book form
    @PostMapping("/books/new")
    public String createBook(@Valid @ModelAttribute("newBook")BookModel bookModel, BindingResult result,HttpSession httpSession){

        Long userId = (Long)httpSession.getAttribute("userId");

        if(userId==null){
            return "redirect:/logout";
        }
        if(result.hasErrors()){
            return "bookForm.jsp";
        }
        else{
            bookService.create(new BookModel(bookModel.getTitle(),bookModel.getAuthor(),bookModel.getMyThoughts(),userService.getOne(userId)));
            return "redirect:/books";
        }
    }
    //find one book
    @GetMapping("/books/{id}")
    public String showDetails(@PathVariable Long id, Model model){

        model.addAttribute("book", bookService.oneBook(id));
        model.addAttribute("user",userService.getOne(id));

        return "details.jsp";
    }

    //edit
    @GetMapping("/books/edit/{id}")
    public String showEdit(@PathVariable("id")Long id, Model model, HttpSession httpSession){

        if(httpSession.getAttribute("userId")==null){
            return "redirect:/logout";
        }
        model.addAttribute("book",bookService.oneBook(id));
        return "editForm.jsp";
    }

    //process form
    @PutMapping("/books/edit/{id}")
    public String editForm(@PathVariable("id") Long id,@Valid @ModelAttribute("book") BookModel bookModel,
                           BindingResult result,HttpSession httpSession){

        if(httpSession.getAttribute("userId")==null){
            return "redirect:/logout";
        }
        if(result.hasErrors()){
            return "editForm.jsp";
        }
        else{
            bookService.update(bookModel);
            return "redirect:/books";
        }
    }

    //delete
    @DeleteMapping("/books/delete/{id}")
    public String destroyBook(@PathVariable("id") Long id, HttpSession httpSession){

        if(httpSession.getAttribute("userId")==null){
            return "redirect:/logout";
        }
        bookService.delete(id);
        return "redirect:/bookmarket";
    }

    @GetMapping("/logout")
    public String logout(HttpSession httpSession){
        httpSession.invalidate();
        return "redirect:/";
    }

    //books borrowed logic
    @GetMapping("/bookmarket")
    public String bookMarket(HttpSession httpSession,Model model){

        Long userId = (Long) httpSession.getAttribute("userId");

        if(userId == null) {
            return "redirect:/logout";
        }
        model.addAttribute("user",userService.getOne(userId));

        List<BookModel> bookList = bookService.unBorroweredBooks(userService.getOne(userId));
        model.addAttribute("books",bookList);

        List<BookModel> myBooks = bookService.borroweredBooks(userService.getOne(userId));
        model.addAttribute("myBooks",myBooks);

        return "bookMarket.jsp";
    }

    @RequestMapping("/bookmarket/{bookID}")
    public String borrowBook(@PathVariable("bookId") Long id, HttpSession httpSession){

        Long userId = (Long) httpSession.getAttribute("userId");

        if(userId==null){
            return "redirect:/logout";
        }
        bookService.addBorrower(bookService.oneBook(id), userService.getOne(userId));
        return "redirect:/bookmarket";
    }

    @RequestMapping("/bookmarket/return/{bookID}")
    public String returnBook(@PathVariable("bookID")Long id, HttpSession httpSession){

        if(httpSession.getAttribute("userId")==null){
            return "redirect:/logout";
        }
        bookService.removeBorrower(bookService.oneBook(id));
        return "redirect:/bookmarket";
    }



}
