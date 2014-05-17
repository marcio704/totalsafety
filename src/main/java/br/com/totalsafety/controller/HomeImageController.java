package br.com.totalsafety.controller;

import br.com.totalsafety.entity.Home;
import br.com.totalsafety.entity.HomeImage;
import br.com.totalsafety.exception.ImageSizeException;
import br.com.totalsafety.service.HomeImageService;
import br.com.totalsafety.util.ImageUtil;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeImageController {

    @Autowired
    private HomeImageService imageService;

    @RequestMapping(value = "/cms/home/image/new", method = RequestMethod.GET)
    public ModelAndView new_() {
        return new ModelAndView("newHomeImage", "homeImage", new HomeImage());
    }

    @RequestMapping(value = "/cms/home/image/new", method = RequestMethod.POST)
    public String new_(@Valid HomeImage image, BindingResult result,
            @RequestParam(value = "imageUpload", required = true) MultipartFile imageUpload, HttpServletRequest request) {
        if (!result.hasErrors()) {
            Home home = new Home();
            home.setId(Home.HOME_FIRST);
            image.setHome(home);
            if (imageUpload != null && !imageUpload.isEmpty()) {
                try {
                    String imgBase64 = ImageUtil.multipartFileToBase64String(imageUpload);
                    image.setBase64(imgBase64);
                } catch (IOException | RuntimeException ex) {
                    result.reject("general.image.validation");
                    return "newHomeImage";
                } catch (ImageSizeException ise) {
                    result.reject("general.image.validation.size");
                    return "newHomeImage";
                }
            } else {
                if (image.getId() == null || image.getId() == 0) {
                    result.reject("general.image.validation.empty");
                    return "newHomeImage";
                }
            }
            try {
                if (image.getId() == null || image.getId() == 0) {
                    imageService.insert(image);
                } else {
                    imageService.update(image);
                }
                return "redirect:/cms/home/list";
            } catch (Exception ex) {
                ex.printStackTrace();
                result.reject("general.error.unexpected");
                return "newHomeImage";
            }
        } else {
            return "newHomeImage";
        }
    }

    @RequestMapping(value = "/cms/home/image/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable Integer id) {
        return new ModelAndView("newHomeImage", "homeImage", imageService.find(id));
    }

    @RequestMapping(value = "/cms/home/image/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable Integer id) {
        HomeImage hi = imageService.find(id);
        imageService.delete(hi);
        return "redirect:/cms/home/list";
    }
}
