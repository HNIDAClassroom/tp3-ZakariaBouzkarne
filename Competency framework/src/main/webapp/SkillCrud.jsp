<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Ajouter une competence</title>

 <link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <style>
 #successAlert {
 position: fixed; 
 top: 20%; 
 left: 50%; 
 transform: translateX(-50%); 
 z-index: 1050; 
 display: none; /* Cachée par défaut */
 }
 
 .container {
 margin-top: 20px;
 }
 </style>
</head>
<body>
 <div class="container">
 <div class="alert alert-success" role="alert" id="successAlert"
style="display: none;">
 <% if (request.getAttribute("message") != null) { %>
 <%= request.getAttribute("message") %>
 <% } %>
 </div>
 <h2>Ajouter une compétence</h2>

 <form action="SkillServlet" method="POST">
 <div class="form-group">
 <label for="name">Nom de la competence:</label>
 <input type="text" class="form-control" id="name" name="name"
required>
 </div>
 <div class="form-group">
 <label for="description">Description:</label>
 <textarea class="form-control" id="description" name="description"
rows="3" required></textarea>
 </div>
 <div class="form-group">
 <label for="domain">Domaine:</label>
  <input type="text" class="form-control" id="domain" name="domain"
required>
 </div>
 <div class="form-group">
 <label for="level">Niveau:</label>
 <select class="form-control" id="level" name="level" required>
 <option value="">Selectionnez un niveau</option>
 <option value="DÃ©butant">Debutant</option>
 <option value="IntermÃ©diaire">Intermediaire</option>
 <option value="AvancÃ©">Avance</option>
 </select>
 </div>
 <button type="submit" class="btn btn-primary">Ajouter</button>
 </form>
 </div>
  <div class="mt-5">
 <h3>Liste des compétences</h3>
 <table class="table">
 <thead class="thead-light">
 <tr>
 <th>Nom</th>
 <th>Description</th>
 <th>Domaine</th>
 <th>Niveau</th>
 <th>Actions</th>
 </tr>
 </thead>
 <tbody id="skillsTableBody">
 <tr>
 <td>Analyse de données</td>
 <td>Capacité à transformer les données en insights pour la prise de décision.</td>
 <td>Sciences de données</td>
 <td>Intermédiaire</td>
 <td>
 <div class="d-flex">
<a style=" margin-right: 10px; "href="votre_lien_cible.html" class="btn btn-primary btn-sm" role="button">
<i class="fas fa-edit"></i> Éditer
</a>
<a href="votre_lien_suppression.html" class="btn btn-danger btn-sm" role="button"><i class="fas fa-trash-alt"></i> Supprimer</a>
 </div>
 </td>
 </tr><tr>
 <td>Deep Learning</td>
<td>Application de réseaux de neurones profonds pour la modélisation de données complexes.</td>
 <td>Sciences de données</td>
 <td>Avancé</td>
 <td>
 <div class="d-flex">
 <a style=" margin-right: 10px; "href="votre_lien_cible.html" class="btn btn-primary btn-sm" role="button"><i class="fas fa-edit"></i> Éditer</a>
 <a href="votre_lien_suppression.html" class="btn btn-danger btn-sm" role="button"><i class="fas fa-trash-alt"></i> Supprimer</a>
 </div>
 </td>
 </tr>
 <tr>
 
 
 
 
 <td>Machine Learning</td>
<td>Conception et développement de modeles predictifs.</td>
 <td>Sciences de données</td>
 <td>Avancé</td>
 <td>
 <div class="d-flex">
 <a style=" margin-right: 10px; "href="votre_lien_cible.html" class="btn btn-primary btn-sm" role="button"><i class="fas fa-edit"></i> Éditer</a>
 <a href="votre_lien_suppression.html" class="btn btn-danger btn-sm" role="button"><i class="fas fa-trash-alt"></i> Supprimer</a>
 </div>
 </td>
 </tr>
 <tr>
  <td>Visualisation de donnees</td>
<td>Utilisation d'outils comme tableau ou powerBI pour representer graphiquement les donnees.</td>
 <td>Sciences de données</td>
 <td>Debutant</td>
 <td>
 <div class="d-flex">
 <a style=" margin-right: 10px; "href="votre_lien_cible.html" class="btn btn-primary btn-sm" role="button"><i class="fas fa-edit"></i> Éditer</a>
 <a href="votre_lien_suppression.html" class="btn btn-danger btn-sm" role="button"><i class="fas fa-trash-alt"></i> Supprimer</a>
 </div>
 </td>
 </tr>
 <tr>
 
 
 
 <td>Statistiques</td>
 <td>Compréhension et application de méthodes statistiques pour l'analyse de données.</td>
 <td>Sciences de données</td>
 <td>Intermédiaire</td>
 <td>
 <div class="d-flex">
 <a style=" margin-right: 10px; "href="votre_lien_cible.html"
class="btn btn-primary btn-sm" role="button"><i class="fas fa-edit"></i> Éditer</a>
 <a href="votre_lien_suppression.html" class="btn btn-danger btn-sm" role="button">
 <i class="fas fa-trash-alt"></i> Supprimer</a>
 </div>
 </td>
 </tr>
</tbody>
 </table>
</div>

<%@ page import="java.util.List" %>
<%@ page import="ma.ac.esi.referentielCompetences.model.Skill" %>

<table class="table">
 <thead class="thead-light">
<tbody id="skillsTableBody">
<%
    List<Skill> skills = (List<Skill>) request.getAttribute("skills");
    if (skills != null) {
        for (Skill skill : skills) {
%>
<tr>
    <td><%= skill.getName() %></td>
    <td><%= skill.getDescription() %></td>
    <td><%= skill.getDomain() %></td>
    <td><%= skill.getLevel() %></td>
    <td>
        <div class="d-flex">
            <a style=" margin-right: 10px; " href="votre_lien_cible.html" class="btn btn-primary btn-sm" role="button">
            <i class="fas fa-edit">
            </i> Éditer</a>
            <a href="votre_lien_suppression.html" class="btn btn-danger btn-sm" role="button">
            <i class="fas fa-trash-alt">
            </i> Supprimer</a>
        </div>
    </td>
</tr>
<%
        }
    }
%>
</thead>
</table>
</tbody>




 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <script>
 $(document).ready(function() {
 
 <% if (request.getAttribute("message") != null) { %>

 $('#successAlert').show();

 setTimeout(function() {
 $('#successAlert').fadeOut('slow');
 }, 2000); 
 <% } %>
 });
 </script>
</body>
</html>