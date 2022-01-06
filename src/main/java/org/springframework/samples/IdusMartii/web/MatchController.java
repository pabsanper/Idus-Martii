package org.springframework.samples.IdusMartii.web;


import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.samples.IdusMartii.service.MatchService;
import org.springframework.samples.IdusMartii.service.UserService;
import org.springframework.samples.IdusMartii.service.PlayerService;
import org.springframework.samples.IdusMartii.service.AchievementUserService;
import org.springframework.samples.IdusMartii.service.AuthoritiesService;
import org.springframework.samples.IdusMartii.service.CurrentUserService;
import org.springframework.samples.IdusMartii.service.InvitationService;
import org.springframework.samples.IdusMartii.enumerates.Faction;
import org.springframework.samples.IdusMartii.enumerates.Plays;
import org.springframework.samples.IdusMartii.enumerates.Role;
import org.springframework.samples.IdusMartii.enumerates.Vote;
import org.springframework.samples.IdusMartii.model.Invitation;
import org.springframework.samples.IdusMartii.model.Match;
import org.springframework.samples.IdusMartii.model.Player;
import org.springframework.samples.IdusMartii.model.User;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/matches")
public class MatchController {
	
	@Autowired
	private MatchService matchService;
	@Autowired
	private CurrentUserService currentUserService;
	@Autowired
	private UserService userService;
	@Autowired
	private PlayerService playerService;
	@Autowired
	private InvitationService invitationService;
	@Autowired
    AchievementUserService achievementUserService;
	

	
	@GetMapping()
	public String matchesList(ModelMap modelMap) {
		String vista = "matches/matchesList";
		User user = userService.findUser(currentUserService.showCurrentUser()).get();
		List<Match> matches = matchService.matches(user);
		modelMap.addAttribute("admin", matchService.isAdmin(user));
		modelMap.addAttribute("matches", matches);
		return vista;
	}
	
	@GetMapping(path="/new")
	public String crearPartida(ModelMap modelMap) {
		String vista = "matches/crearPartida";
		modelMap.addAttribute("match", new Match());
		return vista;
	}
	
	@PostMapping(path="/save")
	public String guardarPartida(@Valid Match match, BindingResult result, ModelMap modelMap) {
			match.setRound(0);
			match.setTurn(0);
			match.setVotesInFavor(0);
			match.setVotesAgainst(0);
			match.setPlays(Plays.EDIL);
			Player host = new Player();
			host.setUser(userService.findUser(currentUserService.showCurrentUser()).get());
			host.setName("host");
			host.setRole(Role.CONSUL);
			host.setMatch(match);
			matchService.saveMatch(match);
			playerService.savePlayer(host);
			modelMap.addAttribute("message", "¡Jugador guardado correctamente!");
			return "redirect:/matches/" + match.getId() + "/new";
	}
	
	@PostMapping(path="/{id_match}/{id_invt}/aceptar")
	public String aceptarPartida(ModelMap modelMap, @PathVariable("id_match") int id_match, @PathVariable("id_invt") int id_invt) {
			Match match = matchService.findById(id_match);
			Invitation invitation = invitationService.findById(id_invt);
			invitationService.deleteInvitation(invitation);
			Player player = new Player();
			player.setUser(userService.findUser(currentUserService.showCurrentUser()).get());
			player.setMatch(match);
			player.setAsigned(Boolean.FALSE);
			matchService.saveMatch(match);
			playerService.savePlayer(player);
			return "redirect:/matches/" + match.getId() + "/new";
	}
 

	@GetMapping(path="/{id}/new")
	public String editarPartida(ModelMap modelMap, @PathVariable("id") int id) {
		String vista = "matches/editarPartida";
		Match match = this.matchService.findById(id);
		User user = new User();
		String currentuser = currentUserService.showCurrentUser();
		modelMap.addAttribute("current", currentuser);
		modelMap.addAttribute("match", match);
		modelMap.addAttribute("user", user);
		modelMap.addAttribute("startMatch", matchService.startMatch(match));
		return vista;
	}

	@GetMapping(path="/{id}/match")
	public String comenzarPartida(ModelMap modelMap, @PathVariable("id") int id, HttpServletResponse response) {
		
		String vista = "matches/partidaEnCurso";
		//response.addHeader("Refresh","5"); //Hacerlo con una llamada al servidor (ResController viene en teoría)
		Match match = this.matchService.findById(id);
		String currentuser = currentUserService.showCurrentUser();
		User usuario = userService.findUser(currentUserService.showCurrentUser()).get();
		Player player_actual = playerService.findByMatchAndUser(match, usuario);
		List<Vote> votos = new ArrayList<>();
		votos.add(Vote.GREEN); votos.add(Vote.RED);
		if (match.getRound() == 1) {
			votos.add(Vote.YELLOW);
		}
		List<Player> jugadores = match.getPlayers();
		for (Player j: jugadores) {
			if (j.getVote() != null) {
				modelMap.addAttribute("usuario_votado", j.getUser().getUsername());

			}
		} 
	
		modelMap.addAttribute("playerY", playerService.playerYellow(match));

		modelMap.addAttribute("mostrarCartas", playerService.showCards(player_actual));
		modelMap.addAttribute("votar", playerService.canVote(player_actual, match));
		modelMap.addAttribute("revisarVoto", playerService.checkVote(player_actual, match));
		modelMap.addAttribute("elegirFaccion", playerService.chooseFaction(player_actual, match));
		modelMap.addAttribute("contarVotos", playerService.countVotes(player_actual, match));
		modelMap.addAttribute("ronda1", matchService.roundI(match));
		modelMap.addAttribute("ronda2", matchService.roundII(match));
		modelMap.addAttribute("elegirRol", playerService.chooseRol(player_actual, match));
		modelMap.addAttribute("jugadoresSinRolConsul", matchService.playersWithNoConsulRole(match));
		modelMap.addAttribute("edilesSinAsignar", matchService.edilNotAsigned(match));
		modelMap.addAttribute("pretorSinAsignar", matchService.pretorNotAsigned(match));
		modelMap.addAttribute("votoAmarilloRevisado", match.getPlays() == Plays.YELLOWEDIL);
		modelMap.addAttribute("edilAmarilloRevisado", player_actual == playerService.playerYellow(match));
		modelMap.addAttribute("current", currentuser);
		modelMap.addAttribute("match", match);
		modelMap.addAttribute("votos", votos);
		modelMap.addAttribute("ediles", playerService.findByRole(match, Role.EDIL));
		return vista;
		
	}
	
	@GetMapping(path="/{id}/rolesAsignados")
	public String rolesAsignados(ModelMap modelMap, @PathVariable("id") int id) {
		Match match = matchService.findById(id);
		playerService.rolesAsigned(match);
		match.setPlays(Plays.EDIL);
		matchService.saveMatch(match);
		return "redirect:/matches/" + id + "/match";
	}
	
	@GetMapping(path="/{id}/ganador") 
	public String ganador(ModelMap modelMap, @PathVariable("id") int id, HttpServletResponse response) {
		String vista = "matches/ganador";
		Match match = this.matchService.findById(id);
		User usuario = userService.findUser(currentUserService.showCurrentUser()).get();
		Player player_actual = playerService.findByMatchAndUser(match, usuario);
		modelMap.addAttribute("faccionGanadora", matchService.sufragium(match));
		modelMap.addAttribute("ganadorLoyal", playerService.winnerLoyal(player_actual, matchService.sufragium(match)));
		modelMap.addAttribute("ganadorTraitor", playerService.winnerTraitor(player_actual, matchService.sufragium(match)));
		modelMap.addAttribute("ganadorMerchant", playerService.winnerMerchant(player_actual, matchService.sufragium(match)));
		modelMap.addAttribute("votosAFavor", match.getVotesInFavor());
		modelMap.addAttribute("votosEnContra", match.getVotesAgainst());
		match.setFinished(true);
		match.setWinner(matchService.sufragium(match));
		return vista;
	}
		
	
	@GetMapping(path="/{id}/save")
	public String guardarJugador2(@PathVariable("id") int id, ModelMap modelMap) {
		String vista = "matches/listadoPartida";
	
		Match match = this.matchService.findById(id);
		modelMap.addAttribute(match);
		
		return vista;
	}

	@GetMapping(path="/{id}/game")
	public String empezarPartida(ModelMap modelMap, @PathVariable("id") int id) {
		String vista = "matches/listadoPartida";
		Match match = this.matchService.findById(id);

		modelMap.addAttribute("match", match);
		return vista;
	}
	
	@PostMapping(path="/{id}/game/save")
	public String guardarPartidaEmpezada(ModelMap modelMap, @PathVariable("id") int id) {



	
			// String vista = "matches/listadoPartida";
 
		
			//match.setId(id);
			// Match match = this.matchService.findById(id);
			// match.setTurn(match.getTurn()+1);
			// match.setVotoaFavor(match.getVotoaFavor()+1);

			// if (match.getTurn() == 5) {
			// 	match.setTurn(0);
			// 	match.setRound(match.getRound()+1);

			// }
			// if(match.getRound() == 2) {
			// 	if(match.getVotoaFavor()==((match.getVotoenContra()-1) )) {
			// 		return "matches/victoriaF" ;}
			// 	else if(match.getVotoaFavor()==((match.getVotoenContra()-2) )) {
			// 		return "matches/victoriaF" ;}
			// 	else if(match.getVotoaFavor()-1==((match.getVotoenContra()) )) {
			// 		return "matches/victoriaC" ;}	
			// 	else if(match.getVotoaFavor()-2==((match.getVotoenContra()) )) {
			// 			return "matches/victoriaC" ;}
			// 	else {
			// 		return "matches/victoriaM" ;
			// 	}

			// }
			// if(match.getVotoaFavor()==5) {
			// 	return "matches/victoriaF" ;

			// }else if(match.getVotoenContra()==5) {
			// 	return "matches/victoriaC" ;

			// }
			// 	this.matchService.saveMatch(match);

		
		Match match = this.matchService.findById(id);
		List<Player> g = playerService.jugadoresPartida(match);
		
		for (int i = 0; i<g.size();i++) {
			User u = g.get(i).getUser();
			if (achievementUserService.checkAchievement1(u)) {
				achievementUserService.saveAchievementUser(u.getUsername(), 1);
				
			}
			
		}
		
		
		List<Faction> lista = new ArrayList<>();
		for (int i = 0; i<g.size()-1;i++) {
			lista.add(Faction.LOYAL);
			lista.add(Faction.TRAITOR);
		}
		lista.add(Faction.MERCHANT);
		lista.add(Faction.MERCHANT);
		
		for (int i = 0; i<g.size();i++) {
			Integer r = (int) Math.floor(Math.random()*(lista.size()-1));
			g.get(i).setCard1(lista.get(r));
			lista.remove(lista.get(r));
			r = (int) Math.floor(Math.random()*(lista.size()-1));
			g.get(i).setCard2(lista.get(r));
			lista.remove(lista.get(r));
			
		}
		for (int i = 0; i< g.size(); i++) {
			if (i == 0) {
				g.get(i).setRole(Role.CONSUL);
			}
			else if (i == 1) {
				g.get(i).setRole(Role.PRETOR);
			}
			else if (i == 2) {
				g.get(i).setRole(Role.EDIL);
			}
			else if (i == 3) {
				g.get(i).setRole(Role.EDIL);
			}
			else {
				g.get(i).setRole(Role.NO_ROL);
			}
		}
		g.forEach(p-> playerService.savePlayer(p));
				
				return  "redirect:/matches/" + id + "/match";
 
			
		
	
		}
}