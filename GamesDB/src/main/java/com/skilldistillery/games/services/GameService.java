package com.skilldistillery.games.services;

import java.util.List;

import com.skilldistillery.games.entities.Game;

public interface GameService {

	List<Game> getAllGames();
	Game getGameById(int gameId);
}
