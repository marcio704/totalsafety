package br.com.totalsafety.dao;

import br.com.totalsafety.entity.Contact;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class ContactDAO {
    
    @PersistenceContext
    private EntityManager entityManager;
    
    public Contact find(Integer id) {
        return entityManager.find(Contact.class, id);
    }
    
    public void insert(Contact contact) {
        entityManager.persist(contact);
    }
    
    public void update(Contact contact) {
        entityManager.merge(contact);
    }
    
    public void delete(Contact contact) {
        entityManager.remove(contact);
    }
}
