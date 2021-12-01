package org.springframework.samples.IdusMartii.repository;

import org.springframework.samples.IdusMartii.enumerates.Role;
import org.springframework.samples.IdusMartii.model.Match;
import org.springframework.samples.IdusMartii.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import org.springframework.data.repository.CrudRepository;
import org.springframework.samples.IdusMartii.model.Player;
import java.util.List;


public interface PlayerRepository extends CrudRepository<Player, Integer>{
    @Query("SELECT p FROM Player p where p.match = :match AND p.user = :user")
    public Player findByMatchAndUsername(@Param("match") Match match, @Param("user") User user);

}
