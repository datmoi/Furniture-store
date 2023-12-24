package com.greenhouse.controller.Client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greenhouse.DAO.AccountDAO;
import com.greenhouse.DAO.CartDAO;
import com.greenhouse.model.Account;
import com.greenhouse.service.SessionService;

@Controller
@RequestMapping("/client/order")
public class OderController {

    @Autowired
    private SessionService sessionService;
    @Autowired
    private AccountDAO accountDAO;
    @Autowired
    private CartDAO cartDAO;

    @GetMapping("")
    public String getOrder(Model model, @RequestParam(value = "checkedIDs", required = false) String checkedIDs) {
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
        model.addAttribute("account", account);

        String[] checked = checkedIDs.split(",");
        List<Object> carts = new ArrayList<Object>();
        var total = 0;
        for (String string : checked) {
            carts.add(cartDAO.findByCartIdStatusFalse(Integer.parseInt(string))); 
            total += cartDAO.getTotalCheckOutByIdCart(Integer.parseInt(string));
        }
        model.addAttribute("carts", carts);
        model.addAttribute("total", total);
        
        model.addAttribute("template", "checkout.html");
        model.addAttribute("fragment", "content");
        return "client/main-layout";
    }
    
}
