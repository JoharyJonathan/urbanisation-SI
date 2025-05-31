package com.monclub.presentation.filters;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class SecurityFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        
        // Define URIs
        String loginURI = contextPath + "/connexion";
        String registerURI = contextPath + "/inscription";
        String adminURI = contextPath + "/admin";
        String accueilURI = contextPath + "/accueil";
        
        // Check authentication
        HttpSession session = httpRequest.getSession(false);
        boolean loggedIn = session != null && session.getAttribute("utilisateurRole") != null;
        boolean isAdmin = loggedIn && "admin".equals(session.getAttribute("utilisateurRole"));
        
        // Check request types
        boolean loginRequest = requestURI.equals(loginURI);
        boolean registerRequest = requestURI.equals(registerURI);
        boolean adminRequest = requestURI.equals(adminURI);
        
        // Allow static resources
        if (isStaticResource(requestURI)) {
            chain.doFilter(request, response);
            return;
        }
        
        if (loggedIn) {
            if (adminRequest && !isAdmin) {
                // Non-admin trying to access admin area
                httpResponse.sendRedirect(accueilURI);
            } else {
                // User is logged in and has proper permissions
                chain.doFilter(request, response);
            }
        } else if (loginRequest || registerRequest) {
            // Allow access to login/register pages
            chain.doFilter(request, response);
        } else {
            // Redirect to login if not authenticated
            httpResponse.sendRedirect(loginURI);
        }
    }
    
    private boolean isStaticResource(String requestURI) {
        return requestURI.contains("/css/") || 
               requestURI.contains("/js/") || 
               requestURI.contains("/images/") ||
               requestURI.endsWith(".css") ||
               requestURI.endsWith(".js") ||
               requestURI.endsWith(".png") ||
               requestURI.endsWith(".jpg") ||
               requestURI.endsWith(".gif");
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {}

    @Override
    public void destroy() {}
}