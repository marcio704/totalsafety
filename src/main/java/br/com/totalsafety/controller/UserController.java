package br.com.totalsafety.controller;

import br.com.totalsafety.entity.User;
import br.com.totalsafety.service.UserService;
import java.util.List;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/cms/user/list", method = RequestMethod.GET)
    public String list(Model model, HttpServletRequest request) {
        User user = ((User) request.getSession().getAttribute("user"));
        model.addAttribute("userList", userService.findList(user));
        model.addAttribute("linkSelected", "user");
        return "listUser";
    }

    @RequestMapping(value = "/cms/user/new", method = RequestMethod.GET)
    public String new_(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("linkSelected", "user");
        return "newUser";
    }

    @RequestMapping(value = "/cms/user/new", method = RequestMethod.POST)
    public String new_(@Valid User user, BindingResult result, Model model) {
        if (result.hasFieldErrors("name") || result.hasFieldErrors("email")) {
            model.addAttribute("user", user);
            return "new";
        }
        try {
            userService.insert(user);
            return "redirect:/cms/user/list";
        } catch (Exception ex) {
            result.reject("general.error.unexpected");
            return "new";
        }
    }

    @RequestMapping(value = "/cms/user/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable Integer id, Model model) {
        model.addAttribute("user", userService.find(id));
        model.addAttribute("linkSelected", "user");
        return "editUser";
    }

    @RequestMapping(value = "/cms/user/edit/{id}", method = RequestMethod.POST)
    public String edit(@Valid User user, BindingResult result, Model model,
            @RequestParam(value = "pwdConfirmation", required = true) String pwdConfirmation) {
        if (result.hasFieldErrors("name") || result.hasFieldErrors("email")) {
            model.addAttribute("user", user);
            return "editUser";
        }
        if (user.isChangePassword()) {
            if (user.getPassword().isEmpty() || pwdConfirmation.isEmpty()) {
                result.reject("company.user.password.empty");
                return "editUser";
            }
            if (!user.getPassword().equals(pwdConfirmation)) {
                result.reject("company.user.password.validation");
                return "editUser";
            }
        } else {
            user.setPassword(userService.find(user.getId()).getPassword());
        }
        try {
            userService.update(user);
            return "redirect:/cms/user/list";
        } catch (Exception ex) {
            result.reject("general.error.unexpected");
            return "editUser";
        }
    }

    @RequestMapping(value = "/cms/user/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable Integer id) {
        try {
            User user = userService.find(id);
            userService.delete(user);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/cms/user/list";
    }

    @RequestMapping(value = {"/login", "/user/login"}, method = RequestMethod.GET)
    public String login(ServletRequest req, Model model) {
        HttpSession session = ((HttpServletRequest) req).getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            model.addAttribute("user", new User());
            return "login";
        } else {
            return "redirect:/cms/home/list";
        }
    }

    @RequestMapping(value = {"/login", "/user/login"}, method = RequestMethod.POST)
    public String login(@Valid User user, BindingResult result, HttpServletRequest request, Errors errors, Model model) {
        if (result.hasFieldErrors("name") || result.hasFieldErrors("password")) {
            model.addAttribute("user", user);
            return "login";
        }
        try {
            User usuLogin = userService.findByNameAndPassword(user);
            if (usuLogin != null) {
                request.getSession().setAttribute("user", usuLogin);
                return "redirect:/cms/home/list";
            } else {
                errors.rejectValue("name", "general.user.validation");
                return "login";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            errors.rejectValue("name", "general.error.unexpected");
            return "login";
        }
    }

    @RequestMapping(value = "/cms/user/logout", method = RequestMethod.GET)
    public String logout(ServletRequest req) {
        HttpSession session = ((HttpServletRequest) req).getSession();
        session.removeAttribute("user");
        return "redirect:/";
    }

    @RequestMapping(value = "/user/forgot", method = RequestMethod.GET)
    public String forgotPassword(Model model) {
        model.addAttribute(new User());
        return "forgotPassword";
    }

    @RequestMapping(value = {"/user/forgot"}, method = RequestMethod.POST)
    public String forgotPassword(@Valid User user, BindingResult result, HttpServletRequest request, Errors errors, Model model) {
        if (result.hasFieldErrors("email")) {
            model.addAttribute("user", user);
            return "forgotPassword";
        }
        try {
            List<User> listUser = userService.findByEmail(user);
            if (listUser != null && !listUser.isEmpty()) {
                User emailUser = listUser.get(0);
                userService.sendForgotPwdEmail(emailUser);
                model.addAttribute("successMsg", "E-mail enviado com sucesso.");
                model.addAttribute("user", new User());
                return "forgotPassword";
            } else {
                errors.rejectValue("email", "general.invalid.email");
                return "forgotPassword";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            errors.rejectValue("email", "general.error.unexpected");
            return "forgotPassword";
        }
    }
}
