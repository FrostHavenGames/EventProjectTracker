package com.skilldistillery.games.services;

import java.util.List;
import java.util.Optional;

import com.skilldistillery.games.entities.Game;

public interface GameService {

	public List<Game> getAllGames();
	public List<Game> findByTitleLike(String keyword);
	public Optional<Game> findById(int gameId);
	public Game createGame(Game game);
	public Game updateGame(Game game);
	public void deleteGame(Integer id);
}
