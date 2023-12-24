package com.greenhouse.controller.Client;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greenhouse.DAO.AccountDAO;
import com.greenhouse.model.Account;
import com.greenhouse.model.Message;
import com.greenhouse.service.SessionService;
import com.greenhouse.service.TokenService;

@Controller
@RequestMapping("/client/change-password")
public class ChangePasswordController {
    @Autowired
    private TokenService tokenService;
    @Autowired
    private AccountDAO accountDAO;
    @Autowired
    private SessionService sessionService;

    @GetMapping("")
    public String changePassword(Model model, @RequestParam("id") Optional<String> id,
            @RequestParam("token") Optional<String> token) {
        model.addAttribute("idAccount", id.orElse(null));
        model.addAttribute("token", token.orElse(null));
        // User Session - start
        Account account = sessionService.get("account");
        if (account != null) {
            try {
                int qty = accountDAO.findQuanityCartById(account.getId());
                model.addAttribute("qtyCart", qty);
            } catch (Exception e) {
                model.addAttribute("qtyCart", 0);
            }
            model.addAttribute("sessionUsername", account.getUsername());
        }
        // User Session - end
        model.addAttribute("template", "change-password.html");
        model.addAttribute("fragment", "content");
        return "client/main-layout";
    }

    @PostMapping("")
    public String changePassword(Model model, @RequestParam("id") String id,
            @RequestParam("token") Optional<String> token, @RequestParam("password") String password,
            @RequestParam("confirmPassword") String confirmPassword) {
        Account account = sessionService.get("account");
        if (password.equals(confirmPassword) && tokenService.validateToken(token.get())) {
            Optional<Account> acc = accountDAO.findById(Integer.parseInt(id));
            if (acc.isPresent()) {
                acc.get().setPassword(password);
                accountDAO.save(acc.get());
                return "redirect:/client/signin";
            }
        } else if (account != null) {
            Optional<Account> acc = accountDAO.findById(account.getId());
            if (acc.isPresent()) {
                acc.get().setPassword(password);
                accountDAO.save(acc.get());
                Message.message = "Đổi mật khẩu thành công";
                Message.type = "success";
                return "redirect:/client/signin";
            }
        }
        model.addAttribute("template", "change-password.html");
        model.addAttribute("fragment", "content");
        return "client/main-layout";
    }
}
