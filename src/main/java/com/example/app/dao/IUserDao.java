package com.example.app.dao;

import com.example.app.entity.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface IUserDao extends JpaRepository<UserModel,Long> {

    Optional<UserModel> findByEmail(String email);
}
