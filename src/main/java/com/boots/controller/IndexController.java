package com.boots.controller;

import com.boots.entity.Gift;
import com.boots.entity.User;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    @Autowired
    private UserService userService;


    @GetMapping("/")
    public String userList(Model model) {
        // getting current user name
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        // get gifts from user name (todo - should be implemented via user id though)
        User user = userService.findUserByUsername(currentPrincipalName);
        if (user != null) {
            model.addAttribute("listOfUserGifts", user.getGifts());
        }
        return "index";
    }
}
