package br.com.totalsafety.dao;

import br.com.totalsafety.entity.Employee;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public Employee find(Integer id) {
        return entityManager.find(Employee.class, id);
    }

    public void insert(Employee employee) {
        entityManager.persist(employee);
        entityManager.flush();
    }

    public void update(Employee employee) {
        entityManager.merge(employee);
        entityManager.flush();
    }

    public void delete(Employee employee) {
        entityManager.remove(employee);
        entityManager.flush();
    }

    public List<Employee> findAll() {
        return entityManager.createQuery("SELECT e FROM Employee e ORDER BY e.name").getResultList();
    }
}
