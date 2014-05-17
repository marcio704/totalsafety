package br.com.totalsafety.controller;

import br.com.totalsafety.entity.About;
import br.com.totalsafety.exception.ImageSizeException;
import br.com.totalsafety.service.AboutService;
import br.com.totalsafety.service.EmployeeService;
import br.com.totalsafety.util.ImageUtil;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AboutController {

    @Autowired
    private AboutService aboutService;
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = {"/about"}, method = RequestMethod.GET)
    public String about(Model model) {
        model.addAttribute("about", aboutService.find(About.ABOUT_FIRST));
        model.addAttribute("employeeList", employeeService.findAll());
        return "about";
    }

    @RequestMapping(value = {"/cms/about"}, method = RequestMethod.GET)
    public String edit(Model model) {
        model.addAttribute("about", aboutService.find(About.ABOUT_FIRST));
        model.addAttribute("employeeList", employeeService.findAll());
        model.addAttribute("linkSelected", "about");
        return "editAbout";
    }

    @RequestMapping(value = "/cms/about", method = RequestMethod.POST)
    public String edit(@Valid About about, BindingResult result,
            @RequestParam(value = "imageUpload", required = true) MultipartFile imageUpload, HttpServletRequest request) {
        if (!result.hasErrors()) {
            if (imageUpload != null && !imageUpload.isEmpty()) {
                try {
                    String imgBase64 = ImageUtil.multipartFileToBase64String(imageUpload);
                    about.setImg(imgBase64);
                } catch (IOException | RuntimeException ex) {
                    result.reject("general.image.validation");
                    return "editAbout";
                } catch (ImageSizeException ise) {
                    result.reject("general.image.validation.size");
                    return "editAbout";
                }
            } else {
                if (about.getId() == null || about.getId() == 0) {
                    result.reject("general.image.validation.empty");
                    return "editAbout";
                }
            }
            try {
                if (about.getId() == null || about.getId() == 0) {
                    aboutService.insert(about);
                } else {
                    aboutService.update(about);
                }
                return "redirect:/about";
            } catch (Exception ex) {
                ex.printStackTrace();
                result.reject("general.error.unexpected");
                return "editAbout";
            }
        } else {
            return "editAbout";
        }
    }

}
