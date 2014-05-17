package br.com.totalsafety.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import br.com.totalsafety.entity.Services;

@Repository
public class ServicesDAO {
    
    @PersistenceContext
    private EntityManager entityManager;

    public Services find(Integer id) {
        return entityManager.find(Services.class, id);
    }

    public void insert(Services service) {
        entityManager.persist(service);
        entityManager.flush();
    }

    public void update(Services service) {
        entityManager.merge(service);
        entityManager.flush();
    }

    public void delete(Services service) {
        entityManager.remove(service);
        entityManager.flush();
    }

    @SuppressWarnings("unchecked")
    public List<Services> findAll() {
        return entityManager.createQuery("SELECT s FROM Services s ORDER BY s.type, s.title").getResultList();
    }

    public List<Services> findByType(String type) {
        return (List<Services>) entityManager.createNamedQuery("Services.findByType")
                .setParameter("type", type).getResultList();
    }
    
}
