package br.com.totalsafety.service;

import br.com.totalsafety.dao.EmployeeDAO;
import br.com.totalsafety.entity.Employee;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class EmployeeService {

    @Autowired
    private EmployeeDAO employeeDAO;

    public Employee find(Integer id) {
        return employeeDAO.find(id);
    }

    public void insert(Employee employee) {
        employeeDAO.insert(employee);
    }

    public void update(Employee employee) {
        employeeDAO.update(employee);
    }

    public void delete(Employee employee) {
        employeeDAO.delete(employee);
    }

    public List<Employee> findAll() {
        return employeeDAO.findAll();
    }
}
