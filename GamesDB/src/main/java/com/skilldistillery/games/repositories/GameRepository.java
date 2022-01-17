package com.skilldistillery.games.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.games.entities.Game;

public interface GameRepository extends JpaRepository<Game, Integer> {

	List<Game> findByTitleLike(String keyword);
}
