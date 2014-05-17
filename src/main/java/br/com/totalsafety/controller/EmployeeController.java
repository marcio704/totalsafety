package br.com.totalsafety.controller;

import br.com.totalsafety.entity.Employee;
import br.com.totalsafety.exception.ImageSizeException;
import br.com.totalsafety.service.EmployeeService;
import br.com.totalsafety.util.ImageUtil;
import java.io.IOException;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/cms/employee/new", method = RequestMethod.GET)
    public String new_(Model model) {
        model.addAttribute("employee",  new Employee());
        model.addAttribute("linkSelected", "about");
        return "editEmployee";
    }

    @RequestMapping(value = "/cms/employee/new", method = RequestMethod.POST)
    public String new_(@Valid Employee employee, BindingResult result,
            @RequestParam(value = "imageUpload", required = true) MultipartFile imageUpload, HttpServletRequest request) {
        if (!result.hasErrors()) {
            if (imageUpload != null && !imageUpload.isEmpty()) {
                try {
                    String imgBase64 = ImageUtil.multipartFileToBase64String(imageUpload);
                    employee.setImage(imgBase64);
                } catch (IOException | RuntimeException ex) {
                    result.reject("general.image.validation");
                    return "editEmployee";
                } catch (ImageSizeException ise) {
                    result.reject("general.image.validation.size");
                    return "editEmployee";
                }
            } else {
                if (employee.getId() == null || employee.getId() == 0) {
                    result.reject("general.image.validation.empty");
                    return "editEmployee";
                }
            }
            try {
                if (employee.getId() == null || employee.getId() == 0) {
                    employeeService.insert(employee);
                } else {
                    employeeService.update(employee);
                }
                return "redirect:/cms/about";
            } catch (Exception ex) {
                ex.printStackTrace();
                result.reject("general.error.unexpected");
                return "editEmployee";
            }
        } else {
            return "editEmployee";
        }
    }

    @RequestMapping(value = "/cms/employee/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable Integer id, Model model) {
        model.addAttribute("employee",  employeeService.find(id));
        model.addAttribute("linkSelected", "about");
        return "editEmployee";
    }

    @RequestMapping(value = "/cms/employee/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable Integer id) {
        Employee e = employeeService.find(id);
        employeeService.delete(e);
        return "redirect:/cms/about";
    }
}
