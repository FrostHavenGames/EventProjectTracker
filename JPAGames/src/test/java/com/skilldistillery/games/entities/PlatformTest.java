package com.skilldistillery.games.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class PlatformTest {
	
	private static EntityManagerFactory emf;
	
	private EntityManager em;
	private Platform platform;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAGames");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		platform = em.find(Platform.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		platform = null;
	}

	@Test
	@DisplayName("Test Platform Mapping")
	void test() {
		assertNotNull(platform);
		assertEquals("PlayStation", platform.getTitle());
		
		assertEquals("The PlayStation (officially abbreviated as PS and commonly known as the PS1 or its codename PSX) "
				+ "is a home video game console developed and marketed by Sony Computer Entertainment. "
				+ "It was the first of the PlayStation lineup of video game consoles. As a fifth generation console, "
				+ "the PlayStation primarily competed with the Nintendo 64 and the Sega Saturn. The PlayStation was "
				+ "the first \"computer entertainment platform\" to ship over 100 million units, which it had reached "
				+ "nine years after its initial launch.", 
				platform.getDescription()); 
		
		LocalDate date = platform.getReleaseDate();
		assertEquals(1995, date.getYear());
		assertEquals(9, date.getMonth().getValue());
		assertEquals(9, date.getDayOfMonth());
		
		assertTrue(platform.getGames().size() > 0);
	}
}
