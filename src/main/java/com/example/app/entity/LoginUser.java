package com.example.app.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginUser {


    @NotEmpty
    @Email(message = "email must be valid")
    private String email;

    @NotEmpty
    @Size(min=8,message = "min 8 characters")
    private String password;


}
