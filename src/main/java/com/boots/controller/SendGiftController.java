package com.boots.controller;

import com.boots.entity.Gift;
import com.boots.entity.User;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
public class SendGiftController {
    @Autowired
    private UserService userService;


    @GetMapping("/send_gift")
    public String getOtherUsers(Model model) {
        // getting current user
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        User user = userService.findUserByUsername(currentPrincipalName);
        // get all users
        List<User> users = userService.allUsers();
        // remove current user
        users.remove(user);
        List<String> userNames = new ArrayList<>();
        for (User us : users) {
            userNames.add(us.getUsername());
        }
        model.addAttribute("listOfUserNames", userNames);
        model.addAttribute("listOfUserGifts", user.getGifts());
        model.addAttribute("path1", "test");
        model.addAttribute("path2", "test");
        return "send_gift";
    }


    // тут такой хэндлер, чтобы не городить перекрестных форм через ModelAttribute
    @RequestMapping(value = "/send_gift", method = RequestMethod.POST)
    public String getInfoFromForm(@RequestParam Map<String, String> allRequestParams) {
        String userName = allRequestParams.get("userName");
        Long userGiftId = Long.valueOf(allRequestParams.get("userGift"));
        Gift userGift = userService.findGiftById(userGiftId);
        String giftNote = allRequestParams.get("giftNote");

        userGift.setGiftNote(giftNote);
        // write to db
        userService.updateNoteGiftById(userGiftId, giftNote);

        // getting current user
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        User currentUser = userService.findUserByUsername(currentPrincipalName);
        Set<Gift> currentUserGifts = currentUser.getGifts();
        currentUserGifts.remove(userGift);
        // write to db
        userService.updateUserGifts(currentUserGifts, currentUser);

        // getting user who will be receiving the present
        User giftUser = userService.findUserByUsername(userName);
        Set<Gift> giftUserGifts = giftUser.getGifts();
        // delete gift from currentUser and assign it to giftUser
        giftUserGifts.add(userGift);
        giftUser.setGifts(giftUserGifts);
        // write to db
        userService.updateUserGifts(giftUserGifts, giftUser);

        return "redirect:/";
    }


}
