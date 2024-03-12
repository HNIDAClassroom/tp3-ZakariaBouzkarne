package ma.ac.esi.referentielCompetences.controleur;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.ac.esi.referentielCompetences.model.Skill;
import ma.ac.esi.referentielCompetences.model.SkillDAO;


import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class SkillCRUD
 */
public class SkillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SkillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String name = request.getParameter("name");
	    String description = request.getParameter("description");
	    String domain = request.getParameter("domain");
	    String level = request.getParameter("level");

	    Skill skill = new Skill(name, description, domain, level);
	    SkillDAO skillDAO = new SkillDAO();

	    boolean success = skillDAO.addSkill(skill);

	    if (success) {
	        // Récupérer la liste des compétences mise à jour depuis la base de données
	        List<Skill> skills = skillDAO.getAllSkills();
	        
	        // Mettre la liste des compétences dans l'attribut de requête
	        request.setAttribute("skills", skills);

	        request.setAttribute("message", "La compétence a été ajoutée avec succès.");
	    } else {
	        request.setAttribute("erreur", "Erreur lors de l'ajout de la compétence.");
	    }

	    // Rediriger vers SkillCrud.jsp
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/SkillCrud.jsp");
	    dispatcher.forward(request, response);
	}


}