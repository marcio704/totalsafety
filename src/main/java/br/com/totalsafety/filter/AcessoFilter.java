package br.com.totalsafety.filter;

import br.com.totalsafety.entity.User;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AcessoFilter implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain) throws IOException, ServletException {

        HttpSession session = ((HttpServletRequest) req).getSession();
        User usuario = (User) session.getAttribute("user");

        if (usuario == null) {
            HttpServletResponse response = (HttpServletResponse) res;
            response.sendRedirect(response.encodeRedirectURL(((HttpServletRequest) req).getContextPath() + "/login"));
        } else {
            chain.doFilter(req, res);
        }
    }

    @Override
    public void destroy() {
    }
}
