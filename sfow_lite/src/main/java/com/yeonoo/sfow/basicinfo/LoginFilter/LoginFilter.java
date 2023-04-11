package com.yeonoo.sfow.basicinfo.LoginFilter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginFilter implements Filter {
	 
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
 
        String uri = req.getRequestURI();
 
        if (uri.endsWith("/login")) { // 로그인 페이지 제외
            chain.doFilter(request, response);
            return;
        }
        
        if (uri.endsWith("/sessionLogout")) { // 로그인 페이지 제외
            chain.doFilter(request, response);
            return;
        }
        
        if (uri.endsWith("/sessionLogin")) { // 로그인 페이지 제외
            chain.doFilter(request, response);
            return;
        }
        
        HttpSession session = req.getSession(false);
 
        //세션 없어.
        if (session == null || session.getAttribute("AUTHUSER") == null) {
            String url = req.getRequestURI();
            
            // 서버 처음 실행 했을 때
            if(url.endsWith("/")) {
            	res.sendRedirect(req.getContextPath() + "/sessionLogin");
            } else {
            	res.sendRedirect(req.getContextPath() + "/sessionLogout");
            }
        } else {
            chain.doFilter(req, res);
        }
    }
    
    public void init(FilterConfig filterConfig) throws ServletException {
    }
 
    public void destroy() {
    }
}
