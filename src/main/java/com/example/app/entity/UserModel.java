package com.example.app.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="users")
public class UserModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    @Size(min=3,max=30,message = "at least 3 characters")
    private String firstName;

    @NotEmpty
    @Size(min=3,max=30,message = "at least 3 characters")
    private String lastName;

    @NotEmpty
    @Email
    private String email;

    @NotEmpty
    @Size(min=8,max=128,message = "at least 8 characters")
    private String password;

    @Transient
    @NotEmpty
    @Size(min=8,max=128,message = "Confirm password must match")
    private String confirm;

    @OneToMany(mappedBy = "user",fetch = FetchType.LAZY)
    private List<BookModel> books;

    @OneToMany(mappedBy = "user",fetch = FetchType.LAZY)
    private List<BookModel> borrowedBooks;




}
