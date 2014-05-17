package br.com.totalsafety.dao;

import br.com.totalsafety.entity.Information;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class InformationDAO {
    
    @PersistenceContext
    private EntityManager entityManager;
    
    public Information find(Integer id) {
        return entityManager.find(Information.class, id);
    }

    public void insert(Information information) {
        entityManager.persist(information);
    }

    public void update(Information information) {
        entityManager.merge(information);
    }

    public void delete(Information information) {
        entityManager.remove(information);
    }
    
    @SuppressWarnings("unchecked")
    public List<Information> findAll() {
        return entityManager.createQuery("SELECT i FROM Information i ORDER BY i.type, i.title").getResultList();
    }

    public List<Information> findByType(String type) {
        return (List<Information>) entityManager.createNamedQuery("Information.findByType")
                .setParameter("type", type).getResultList();
    }
}
