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

class GameTest {
	
	private static EntityManagerFactory emf;
	
	private EntityManager em;
	private Game game;

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
		game = em.find(Game.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		game = null;
	}

	@Test
	@DisplayName("Test Game Mapping")
	void test() {
		assertNotNull(game);
		assertEquals("Chrono Trigger", game.getTitle());
		
		assertEquals("In this turn-based Japanese RPG, young Crono must travel through time "
				+ "through a misfunctioning teleporter to rescue his misfortunate companion "
				+ "and take part in an intricate web of past and present perils. The adventure that "
				+ "ensues soon unveils an evil force set to destroy the world, triggering Crono's "
				+ "race against time to change the course of history and bring about a brighter future.", 
				game.getDescription()); 
		
		LocalDate date = game.getReleaseDate();
		assertEquals(1995, date.getYear());
		assertEquals(9, date.getMonth().getValue());
		assertEquals(11, date.getDayOfMonth());
		
		assertEquals("https://images.igdb.com/igdb/image/upload/t_cover_big/co3plw.png", game.getBoxArtURL());
		
		assertTrue(game.getPlatforms().size() > 0);
	}
}
