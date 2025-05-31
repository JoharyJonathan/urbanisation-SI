package com.monclub.presentation.controllers;

public class HomeController {
    
    public String getWelcomeMessage(String userRole) {
        if ("admin".equalsIgnoreCase(userRole)) {
            return "Bienvenue, Administrateur !";
        } else {
            return "Bienvenue au Club de Sport !";
        }
    }
}