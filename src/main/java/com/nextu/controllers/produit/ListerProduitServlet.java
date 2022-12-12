package com.nextu.controllers.produit;

import java.io.IOException;
import java.util.List;
import com.nextu.entities.Produit;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListerProduitServlet
 */
@WebServlet("/")
public class ListerProduitServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   @PersistenceContext(unitName = "tp-final")
   private EntityManager em;

   /**
    * Default constructor.
    */
   public ListerProduitServlet() {
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      TypedQuery<Produit> query = em.createQuery("SELECT s FROM Produit s", Produit.class);
      List<Produit> produits = query.getResultList();
      request.setAttribute("produits", produits);
      this.getServletContext().getRequestDispatcher("/produits.jsp").forward(request, response);

   }

}