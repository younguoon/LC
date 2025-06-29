package com.lottecard.fgs.admin.app.cmn;

import com.lottecard.fgs.global.config.view.LayoutType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        System.out.println("[HomeController] HOME -> redirect to login");
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginPage() {
        System.out.println("[HomeController] LOGIN PAGE -> returning: " + LayoutType.SIMPLE.path());
        return LayoutType.SIMPLE.path();
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
            @RequestParam String password,
            @RequestParam(required = false) String remember,
            HttpSession session, Model model) {

        System.out.println("[HomeController] LOGIN POST -> username: " + username);

        if ("admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("loginUser", username);
            session.setAttribute("isLoggedIn", true);
            System.out.println("[HomeController] LOGIN SUCCESS -> redirect to login-success");
            return "redirect:/login-success";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            System.out.println("[HomeController] LOGIN FAILED -> returning: " + LayoutType.SIMPLE.path());
            return LayoutType.SIMPLE.path();
        }
    }

    @GetMapping("/login-success")
    public String loginSuccess(HttpSession session) {
        Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (isLoggedIn == null || !isLoggedIn) {
            System.out.println("[HomeController] LOGIN-SUCCESS -> not logged in, redirect to login");
            return "redirect:/login";
        }
        System.out.println("[HomeController] LOGIN-SUCCESS -> returning post-redirect");
        return "post-redirect";
    }

    @PostMapping("/admin/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        System.out.println("[HomeController] DASHBOARD POST START");

        Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (isLoggedIn == null || !isLoggedIn) {
            System.out.println("[HomeController] DASHBOARD -> not logged in, redirect to login");
            return "redirect:/login";
        }

        String loginUser = (String) session.getAttribute("loginUser");
        model.addAttribute("loginUser", loginUser);

        System.out.println("[HomeController] DASHBOARD -> loginUser: " + loginUser);
        System.out.println("[HomeController] DASHBOARD -> returning: " + LayoutType.MAIN.path());

        return LayoutType.MAIN.path();
    }

    @GetMapping("/admin/dashboard")
    public String adminDashboardGet() {
        System.out.println("[HomeController] DASHBOARD GET -> redirect to access-denied");
        return "redirect:/access-denied";
    }

    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        System.out.println("[HomeController] LOGOUT -> redirect to login");
        return "redirect:/login";
    }
}