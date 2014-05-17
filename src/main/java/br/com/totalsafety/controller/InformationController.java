package br.com.totalsafety.controller;

import br.com.totalsafety.entity.Information;
import br.com.totalsafety.service.InformationService;
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

@Controller
public class InformationController {
    @Autowired
    private InformationService informationService;
    
    @RequestMapping(value = {"/information/{id}"}, method = RequestMethod.GET)
    public String information(@PathVariable Integer id, Model model) {
        String type = (id == Information.ARTICLE ? "ARTICLE" : "TECHNICAL");
        List<Information> listInformation = informationService.findByType(type);
        model.addAttribute("listInformation", listInformation);
        model.addAttribute("maxSize", Information.MAX_SIZE);
        return ("information-" + type);
    }
    
    @RequestMapping(value = "/cms/information/list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("listInformation", informationService.findAll());
        model.addAttribute("linkSelected", "information");
        return "listInformation";
    }

    @RequestMapping(value = "/cms/information/new", method = RequestMethod.GET)
    public String new_(Model model) {
        model.addAttribute("information", new Information());
        model.addAttribute("linkSelected", "information");
        return "newInformation";
    }
    
    @RequestMapping(value = "/cms/information/new", method = RequestMethod.POST)
    public String new_(@Valid Information information, BindingResult result, HttpServletRequest request) {
        if (!result.hasErrors()) {
            try {
                informationService.insert(information);
                return "redirect:/cms/information/list";
            } catch (Exception ex) {
                ex.printStackTrace();
                result.reject("general.error.unexpected");
                return "newInformation";
            }
        } else {
            return "newInformation";
        }
    }
    
    @RequestMapping(value = "/cms/information/edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable Integer id) {
        model.addAttribute("information", informationService.find(id));
        model.addAttribute("linkSelected", "information");
        return "editInformation";
    }
    
    @RequestMapping(value = "/cms/information/edit/{id}", method = RequestMethod.POST)
    public String edit(@Valid Information information, BindingResult result, HttpServletRequest request) {
        if (!result.hasErrors()) {
            try {
                informationService.update(information);
                return "redirect:/cms/information/list";
            } catch (Exception ex) {
                ex.printStackTrace();
                result.reject("general.error.unexpected");
                return "editInformation";
            }
        } else {
            return "editInformation";
        }
    }
    
    @RequestMapping(value = "/cms/information/delete/{id}", method = RequestMethod.GET)
    public String delete(Model model, @PathVariable Integer id) {
        try {
            Information info = informationService.find(id);
            informationService.delete(info);
            return "redirect:/cms/information/list";
        } catch (Exception ex) {
            ex.printStackTrace();
            return "listInformation";
        }
    }
}
