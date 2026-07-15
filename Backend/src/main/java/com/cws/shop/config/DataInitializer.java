package com.cws.shop.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cws.shop.model.Role;
import com.cws.shop.model.User;
import com.cws.shop.repository.UserRepository;

@Component
public class DataInitializer implements CommandLineRunner{

	private static final Logger logger = LoggerFactory.getLogger(DataInitializer.class);

	private final UserRepository userRepository;
	private final PasswordEncoder passwordEncoder;

	public DataInitializer(UserRepository userRepository,PasswordEncoder passwordEncoder){
		this.userRepository=userRepository;
		this.passwordEncoder=passwordEncoder;
	}

	@Override
	public void run(String... args) {
		try {
			if(!userRepository.existsByEmail("admin@shop.com")){
				User admin = new User();
				admin.setName("Admin User");
				admin.setEmail("admin@shop.com");
				admin.setMobileNumber("9999999999");
				admin.setPassword(passwordEncoder.encode("Admin@123"));
				admin.setRole(Role.ADMIN);

				userRepository.save(admin);
				logger.info("Admin user created");
			}
		} catch (Exception e) {
			// If schema isn't ready (e.g. running with a fresh in-memory DB), skip initialization.
			logger.warn("Skipping data initialization due to error (DB may not be ready): {}", e.getMessage());
		}

	}
}