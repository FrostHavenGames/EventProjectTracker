package com.skilldistillery.games.services;

import java.util.List;

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
	public Game getGameById(int gameId) {
		// TODO Auto-generated method stub
		return null;
	}

}