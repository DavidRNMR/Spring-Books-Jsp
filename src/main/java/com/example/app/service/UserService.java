package com.example.app.service;

import com.example.app.dao.IUserDao;
import com.example.app.entity.LoginUser;
import com.example.app.entity.UserModel;
import org.apache.catalina.User;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private IUserDao iUserDao;

    public UserModel register (UserModel newUser, BindingResult result){

        //find user in database
        Optional<UserModel> optionalUserModel = iUserDao.findByEmail(newUser.getEmail());

        if(optionalUserModel.isPresent()){

            result.rejectValue("email", "unique","email registered");
        }
        //reject if the password doesnt match
        if(!newUser.getPassword().equals(newUser.getConfirm())){

            result.rejectValue("confirm","matches","the confirm password doesnt match");
        }
        if(result.hasErrors()){

            return null;
        }
        String hashed = BCrypt.hashpw(newUser.getPassword(),BCrypt.gensalt());
        newUser.setPassword(hashed);
        return iUserDao.save(newUser);
    }

    public UserModel login (LoginUser loginUser,BindingResult result){

        //find user by email in database
        Optional<UserModel> potentialUser = iUserDao.findByEmail(loginUser.getEmail());

        if(!potentialUser.isPresent()){

           result.rejectValue("email","unique","not registered");
           return null;
        }
        //get the user to check validation

        UserModel user= potentialUser.get();

        //reject if the password doesnt match
        if(!BCrypt.checkpw(loginUser.getPassword(),user.getPassword())){

            result.rejectValue("password","matches","Invalid password");
        }
        if(result.hasErrors()){
            return null;
        }
        return user;
    }

    public UserModel getOne (Long id){

        Optional<UserModel> optionalUserModel = iUserDao.findById(id);

        if(optionalUserModel.isPresent()){
            return optionalUserModel.get();
        }
        else{
            return null;
        }
    }
}
