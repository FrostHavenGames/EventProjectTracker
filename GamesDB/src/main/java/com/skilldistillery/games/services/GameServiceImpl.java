package com.skilldistillery.games.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.games.entities.Game;
import com.skilldistillery.games.repositories.GameRepository;

@Service
public class GameServiceImpl implements GameService {

	@Autowired
	private GameRepository gameRepo;

	@Override
	public List<Game> getAllGames() {
		return gameRepo.findAll();
	}

	@Override
	public Optional<Game> findById(int gameId) {
		return gameRepo.findById(gameId);
	}

	@Override
	public Game createGame(Game game) {
		try {
			Game newGame = gameRepo.save(game);
			return newGame;
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
			System.err.println("Error creating new Game. Invalid JSON.");
			return null;
		}
	}

	@Override
	public Game updateGame(Game game) {
		return gameRepo.save(game);
	}

	@Override
	public void deleteGame(Game game) {
		gameRepo.delete(game);
	}
}