package br.com.totalsafety.controller;

import br.com.totalsafety.entity.Information;
import br.com.totalsafety.entity.Portfolio;
import br.com.totalsafety.exception.ImageSizeException;
import br.com.totalsafety.service.PortfolioService;
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
public class PortfolioController {

    @Autowired
    private PortfolioService portfolioService;

    @RequestMapping(value = {"/portfolio/{id}"}, method = RequestMethod.GET)
    public String portfolio(@PathVariable Integer id, Model model) {
        String type = (id == Portfolio.RBC ? "RBC" : "RBLE");
        List<Portfolio> listPortfolio = portfolioService.findByType(type);
        model.addAttribute("listPortfolio", listPortfolio);
        return ("portfolio-" + type);
    }

    @RequestMapping(value = "/cms/portfolio/list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("listPortfolio", portfolioService.findAll());
        model.addAttribute("linkSelected", "portfolio");
        model.addAttribute("maxSize", Portfolio.MAX_SIZE);
        return "listPortfolio";
    }

    @RequestMapping(value = "/cms/portfolio/new", method = RequestMethod.GET)
    public String new_(Model model) {
        model.addAttribute("linkSelected", "portfolio");
        model.addAttribute("portfolio", new Portfolio());
        return "newPortfolio";
    }

    @RequestMapping(value = "/cms/portfolio/new", method = RequestMethod.POST)
    public String new_(@Valid Portfolio portfolio, BindingResult result,
            @RequestParam(value = "imageUpload", required = false) MultipartFile imageUpload, HttpServletRequest request) {
        if (!result.hasErrors()) {
            if (imageUpload != null && !imageUpload.isEmpty()) {
                try {
                    String imgBase64 = ImageUtil.multipartFileToBase64String(imageUpload);
                    portfolio.setImage(imgBase64);
                } catch (IOException | RuntimeException ex) {
                    result.reject("general.image.validation");
                    return "newPortfolio";
                } catch (ImageSizeException ise) {
                    result.reject("general.image.validation.size");
                    return "newPortfolio";
                }
            } else {
                result.reject("general.image.validation.empty");
                return "newPortfolio";
            }
            try {
                portfolioService.insert(portfolio);
                return "redirect:/cms/portfolio/list";
            } catch (Exception ex) {
                ex.printStackTrace();
                result.reject("general.error.unexpected");
                return "newPortfolio";
            }
        } else {
            return "newPortfolio";
        }
    }

    @RequestMapping(value = "/cms/portfolio/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable Integer id, Model model) {
        Portfolio p = portfolioService.find(id);
        if (p != null) {
            model.addAttribute("linkSelected", "portfolio");
            model.addAttribute("portfolio", p);
            return "editPortfolio";
        } else {
            model.addAttribute("linkSelected", "portfolio");
            model.addAttribute("portfolio", new Portfolio());
            return "editPortfolio";
        }
    }

    @RequestMapping(value = "/cms/portfolio/edit/{id}", method = RequestMethod.POST)
    public String edit(@Valid Portfolio portfolio, BindingResult result,
            @RequestParam(value = "imageUpload", required = false) MultipartFile imageUpload, HttpServletRequest request) {
        if (!result.hasErrors()) {
            if (imageUpload != null && !imageUpload.isEmpty()) {
                try {
                    String imgBase64 = ImageUtil.multipartFileToBase64String(imageUpload);
                    portfolio.setImage(imgBase64);
                } catch (IOException | RuntimeException ex) {
                    result.reject("general.image.validation");
                    return "editPortfolio";
                } catch (ImageSizeException ise) {
                    result.reject("general.image.validation.size");
                    return "editPortfolio";
                }
            }
            try {
                portfolioService.update(portfolio);
                return "redirect:/cms/portfolio/list";
            } catch (Exception ex) {
                ex.printStackTrace();
                result.reject("general.error.unexpected");
                return "editPortfolio";
            }
        } else {
            return "editPortfolio";
        }
    }

    @RequestMapping(value = "/cms/portfolio/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable Integer id) {
        try {
            Portfolio p = portfolioService.find(id);
            portfolioService.delete(p);
            return "redirect:/cms/portfolio/list";
        } catch (Exception ex) {
            ex.printStackTrace();
            return "listPortfolio";
        }
    }
}
