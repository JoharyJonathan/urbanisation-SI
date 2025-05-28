package com.monclub.infrastructure.security;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordEncoder {
    
    public String encode(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }
    
    public boolean matches(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}