package br.com.totalsafety.controller;

import br.com.totalsafety.entity.Services;
import br.com.totalsafety.exception.ImageSizeException;
import br.com.totalsafety.service.ServicesService;
import br.com.totalsafety.util.ImageUtil;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ServicesController {

    @Autowired
    private ServicesService serviceService;

    @RequestMapping(value = {"/services/{id}"}, method = RequestMethod.GET)
    public String service(@PathVariable Integer id, Model model) {
        String type = (id == Services.CALIBRATION ? "Calibration" : "Manutention");
        List<Services> list = serviceService.findByType(type);
        model.addAttribute("serviceList", list);
        return ("service-" + type);
    }

    @RequestMapping(value = "/cms/service/list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("serviceList", serviceService.findAll());
        model.addAttribute("linkSelected", "services");
        model.addAttribute("maxSize", Services.MAX_SIZE);
        return "listService";
    }

    @RequestMapping(value = "/cms/service/new", method = RequestMethod.GET)
    public String new_(Model model) {
        model.addAttribute("services", new Services());
        model.addAttribute("linkSelected", "services");
        return "newService";
    }

    @RequestMapping(value = "/cms/service/new", method = RequestMethod.POST)
    public String new_(@Valid Services service, BindingResult result,
            @RequestParam(value = "imageUpload", required = false) MultipartFile imageUpload, HttpServletRequest request) {
        if (!result.hasErrors()) {
            if (imageUpload != null && !imageUpload.isEmpty()) {
                try {
                    String imgBase64 = ImageUtil.multipartFileToBase64String(imageUpload);
                    service.setImage(imgBase64);
                } catch (IOException | RuntimeException ex) {
                    result.reject("general.image.validation");
                    return "newService";
                } catch (ImageSizeException ise) {
                    result.reject("general.image.validation.size");
                    return "newService";
                }
            } else {
                result.reject("general.image.validation.empty");
                return "newService";
            }
            try {
                serviceService.insert(service);
                return "redirect:/cms/service/list";
            } catch (Exception ex) {
                result.reject("general.error.unexpected");
                return "newService";
            }
        } else {
            return "newService";
        }
    }

    @RequestMapping(value = "/cms/service/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable Integer id, Model model) {
        Services s = serviceService.find(id);
        if (s != null) {
            model.addAttribute("services", s);
            model.addAttribute("linkSelected", "services");
            return "editService";
        } else {
            model.addAttribute("services", new Services());
            model.addAttribute("linkSelected", "services");
            return "editService";
        }
    }

    @RequestMapping(value = "/cms/service/edit/{id}", method = RequestMethod.POST)
    public String edit(@Valid Services service, BindingResult result,
            @RequestParam(value = "imageUpload", required = false) MultipartFile imageUpload, HttpServletRequest request) {
        if (!result.hasErrors()) {
            if (imageUpload != null && !imageUpload.isEmpty()) {
                try {
                    String imgBase64 = ImageUtil.multipartFileToBase64String(imageUpload);
                    service.setImage(imgBase64);
                } catch (IOException | RuntimeException ex) {
                    result.reject("general.image.validation");
                    return "editService";
                } catch (ImageSizeException ise) {
                    result.reject("general.image.validation.size");
                    return "editService";
                }
            }
            try {
                serviceService.update(service);
                return "redirect:/cms/service/list";
            } catch (Exception ex) {
                ex.printStackTrace();
                result.reject("general.error.unexpected");
                return "editService";
            }
        } else {
            return "editService";
        }
    }

    @RequestMapping(value = "/cms/service/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable Integer id) {
        try {
            Services s = serviceService.find(id);
            serviceService.delete(s);
            return "redirect:/cms/service/list";
        } catch (Exception ex) {
            return "listService";
        }
    }

}
