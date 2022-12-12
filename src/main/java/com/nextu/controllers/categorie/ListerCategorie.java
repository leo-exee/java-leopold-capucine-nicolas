package com.nextu.controllers.categorie;

import java.io.IOException;
import java.util.List;
import com.nextu.entities.Categorie;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListerCategorie
 */
@WebServlet("/categories")
public class ListerCategorie extends HttpServlet {
   private static final long serialVersionUID = 1L;
   @PersistenceContext(unitName = "tp-final")
   private EntityManager em;

   /**
    * Default constructor.
    */
   public ListerCategorie() {
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      TypedQuery<Categorie> query = em.createQuery("SELECT d FROM Categorie d", Categorie.class);
      List<Categorie> categories = query.getResultList();
      request.setAttribute("categories", categories);
      this.getServletContext().getRequestDispatcher("/categories.jsp").forward(request, response);
   }

}