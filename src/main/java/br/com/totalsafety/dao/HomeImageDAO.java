package br.com.totalsafety.dao;

import br.com.totalsafety.entity.HomeImage;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class HomeImageDAO {
    
    @PersistenceContext
    private EntityManager entityManager;
    
    public HomeImage find(Integer id) {
        return entityManager.find(HomeImage.class, id);
    }

    public void insert(HomeImage image) {
        entityManager.persist(image);
    }

    public void update(HomeImage image) {
        entityManager.merge(image);
    }

    public void delete(HomeImage image) {
        entityManager.remove(image);
    }
    
}
