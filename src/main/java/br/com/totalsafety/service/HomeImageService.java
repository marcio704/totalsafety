package br.com.totalsafety.service;

import br.com.totalsafety.dao.HomeImageDAO;
import br.com.totalsafety.entity.HomeImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HomeImageService {

    @Autowired
    private HomeImageDAO imageDAO;

    public HomeImage find(Integer id) {
        return imageDAO.find(id);
    }

    public void insert(HomeImage image) {
        imageDAO.insert(image);
    }

    public void update(HomeImage image) {
        imageDAO.update(image);
    }

    public void delete(HomeImage image) {
        imageDAO.delete(image);
    }

}
