package com.greenhouse.controller.Client;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greenhouse.DAO.AccountDAO;
import com.greenhouse.model.Account;
import com.greenhouse.service.EmailService;
import com.greenhouse.service.TokenService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
@RequestMapping("client/signup")
public class SignUpController {

    @Autowired
    private AccountDAO accountDAO;
    @Autowired
    private EmailService emailService;
    @Autowired
    private TokenService tokenService;

    @GetMapping("")
    public String signup(Model model) {
        model.addAttribute("account", new Account());
        model.addAttribute("template", "signup.html");
        model.addAttribute("fragment", "content");
        return "client/main-layout";
    }

    @PostMapping("")
    public String registerAccount(@Valid @ModelAttribute("account") Account account, BindingResult result,
            HttpServletRequest request,
            Model model) {
        if (result.hasFieldErrors("fullname") || result.hasFieldErrors("username")
                || result.hasFieldErrors("password") || result.hasFieldErrors("email")
                || result.hasFieldErrors("phone")) {
            model.addAttribute("template", "signup.html");
            model.addAttribute("fragment", "content");
            return "client/main-layout";
        }
        String username = account.getUsername();
        String email = account.getEmail();
        String phone = account.getPhone();
        // Kiểm tra xem tên người dùng đã tồn tại hay chưa
        if (accountDAO.checkDuplicateUsername(username) != null) {
            // Tên người dùng đã tồn tại, hiển thị thông báo lỗi
            model.addAttribute("signupMessage", "Tên người dùng đã tồn tại!<br>Kiểm tra lại Username!");
        } else if (accountDAO.checkDuplicateEmail(email) != null) {
            model.addAttribute("signupMessage", "Email người dùng đã tồn tại!<br>Kiểm tra lại Email!");
        } else if (accountDAO.checkDuplicatePhone(phone) != null) {
            model.addAttribute("signupMessage", "Số điện thoại đã tồn tại!<br>Kiểm tra lại Số Điện Thoại!");
        } else {
            // Lưu thông tin người dùng vào CSDL và tạo mã kích hoạt
            accountDAO.save(account);
            String activationToken = tokenService.generateToken(account.getUsername());

            // Tạo đường link kích hoạt tài khoản
            String activationLink = request.getScheme() + "://" + request.getServerName() + ":"
                    + request.getServerPort() + request.getContextPath() + "/client/signup/active?id="
                    + account.getId() + "&token=" + activationToken;

            // Gửi mail kích hoạt tài khoản
            emailService.sendEmailActiveAccount(email, "Kích hoạt tài khoản GreenHouse", activationLink);
        }

        // Chuyển hướng đến trang đăng nhập sau khi đăng ký thành công hoặc gửi email
        model.addAttribute("template", "signup.html");
        model.addAttribute("fragment", "content");
        return "client/main-layout";
    }

    @GetMapping("/active")
    public String getActive(Model model, @RequestParam("id") Optional<String> id, @RequestParam("token") Optional<String> token) {
        // Kiểm tra xem token có còn trong thời gian hiệu lực hay không
        if (tokenService.validateToken(token.orElse("null"))) {
            var acc = accountDAO.findById(Integer.parseInt(id.get()));
            acc.get().setActive(true);
            accountDAO.save(acc.get());
            // Chuyển hướng đến trang đăng nhập sau khi kích hoạt tài khoản thành công
            model.addAttribute("message", "Kích hoạt tài khoản thành công.");
            model.addAttribute("template", "index.html");
            model.addAttribute("fragment", "content");
        } else {
            // Token đã hết hạn
            model.addAttribute("message", "Thư kích hoạt tài khoản đã hết hiệu lực.");
            model.addAttribute("template", "index.html");
            model.addAttribute("fragment", "content");
        }
        return "client/main-layout";
    }

}
