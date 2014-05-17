package br.com.totalsafety.controller;

import br.com.totalsafety.entity.Home;
import br.com.totalsafety.exception.ImageSizeException;
import br.com.totalsafety.service.HomeService;
import br.com.totalsafety.util.ImageUtil;
import java.io.IOException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @Autowired
    private HomeService homeService;

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public ModelAndView home(ModelMap map) {
        return new ModelAndView("index", "home", homeService.find(Home.HOME_FIRST));
    }
    
    @RequestMapping(value = {"/search"}, method = RequestMethod.GET)
    public String search() {
        return "search";
    }

    @RequestMapping(value = "/cms/home/list", method = RequestMethod.GET)
    public String list(Model model) {
        Home home = homeService.find(Home.HOME_FIRST);
        model.addAttribute("home", home);
        model.addAttribute("listImages", home.getImages());
        model.addAttribute("linkSelected", "home");
        return "listHome";
    }

    @RequestMapping(value = "/cms/home/warn", method = RequestMethod.POST)
    public String insertWarning(@Valid Home home, BindingResult result,
            @RequestParam(value = "imageUpload", required = false) MultipartFile imageUpload, Model model) {
        try {
            Home h = homeService.find(home.getId()); 
            h.setWarn(home.getWarn());
            if (imageUpload != null && !imageUpload.isEmpty()) {
                try {
                    String imgBase64 = ImageUtil.multipartFileToBase64String(imageUpload);
                    h.setWarnImage(imgBase64);
                } catch (IOException | RuntimeException ex) {
                    model.addAttribute("home", home);
                    model.addAttribute("listImages", homeService.find(Home.HOME_FIRST).getImages());
                    result.reject("general.image.validation");
                    return "listHome";
                } catch (ImageSizeException ise){
                    model.addAttribute("home", home);
                    model.addAttribute("listImages", homeService.find(Home.HOME_FIRST).getImages());
                    result.reject("general.image.validation.size");
                    return "listHome";
                }
            } 
            homeService.update(h);
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("home", home);
            model.addAttribute("listImages", home.getImages());
            result.reject("general.error.unexpected");
            return "listHome";
        }
    }
}
