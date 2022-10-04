package com.example.app.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@Table(name="books")
public class BookModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min=3,max=30,message = "at least 3 characters")
    private String title;

    @Size(min=3,max=30,message = "at least 3 characters")
    private String author;

    @Size(min=3,max=30,message = "at least 3 characters")
    private String myThoughts;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updateAt;

    @PrePersist
    protected void onCreate(){
        this.createAt = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        this.updateAt = new Date();
    }

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "user_id")
        private UserModel user;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "borrower_id")
        private UserModel borrower;

    public BookModel(String title, String author, String myThoughts, UserModel user) {
        this.title = title;
        this.author = author;
        this.myThoughts = myThoughts;
        this.user = user;
    }


}
