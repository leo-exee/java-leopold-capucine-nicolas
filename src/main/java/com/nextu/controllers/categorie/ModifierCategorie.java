package com.nextu.controllers.categorie;

import java.io.IOException;
import java.util.List;
import com.nextu.entities.Categorie;
import com.nextu.entities.Produit;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.UserTransaction;

/**
 * Servlet implementation class ModifierCategorie
 */
@WebServlet("/modifierCategorie")
public class ModifierCategorie extends HttpServlet {
   private static final long serialVersionUID = 1L;
   @PersistenceContext(unitName = "tp-final")
   private EntityManager em;
   @Resource
   private UserTransaction userTransaction;

   /**
    * Default constructor.
    */
   public ModifierCategorie() {
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      Long codeCategorie = Long.valueOf(Long.parseLong(request.getParameter("codeCategorie")));
      Categorie categorie = em.find(Categorie.class, codeCategorie);
      request.setAttribute("categorie", categorie);
      String errorMessage = request.getParameter("errorMessage");
      request.setAttribute("errorMessage", errorMessage);
      TypedQuery<Produit> query = em.createQuery("SELECT s FROM Produit s", Produit.class);
      List<Produit> produits = query.getResultList();
      request.setAttribute("produits", produits);
      this.getServletContext().getRequestDispatcher("/modifier-categorie.jsp").forward(request,
            response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      String message;
      String uriRedirect = "modifierCategorie?codeCategorie="
            + request.getParameter("codeCategorie") + "error=%s";
      Long codeCategorie = Long.valueOf(Long.parseLong(request.getParameter("codeCategorie")));
      Categorie categorie = em.find(Categorie.class, codeCategorie);
      Produit produit;
      categorie = getCategorie(request);
      produit = getProduit(request);
      if (categorie == null) {
         message = "Aucune categorie trouvé";
         redirectWithErrorMessage(response, uriRedirect, message);
      }
      if (produit == null) {
         message = "Aucune produit trouvé";
         redirectWithErrorMessage(response, uriRedirect, message);
      }
      String libelle = request.getParameter("libelle");

      if (libelle == null || libelle.isEmpty() || libelle.isBlank()) {
         message = "Veuillez renseignez le libellé de la categorie";
         redirectWithErrorMessage(response, uriRedirect, message);

      } else {
         boolean transactionOk = false;
         try {
            userTransaction.begin();
            categorie.setLibelle(libelle);
            categorie.setProduit(em.merge(produit));
            em.merge(categorie);
            transactionOk = true;
         } catch (Exception e) {
            System.out.print("Une erreur est survennue lors de l'enregistrement");
         } finally {
            try {
               if (transactionOk) {
                  userTransaction.commit();
                  response.sendRedirect("categories");
               } else {
                  message =
                        "Une erreur est survenue lors de l'enregistrement veuillez contactez l'administrateur";
                  userTransaction.rollback();
                  redirectWithErrorMessage(response, uriRedirect, message);

               }
            } catch (Exception e) {
               message =
                     "Une erreur est survenue lors de l'enregistrement veuillez contactez l'administrateur";
               redirectWithErrorMessage(response, uriRedirect, message);
            }
         }
      }
   }

   private Categorie getCategorie(HttpServletRequest request) {
      Categorie categorie = null;
      try {
         Long codeCategorie = Long.valueOf(request.getParameter("codeCategorie"));
         categorie = em.find(Categorie.class, codeCategorie);
      } catch (EntityNotFoundException ex) {

      }
      return categorie;
   }

   private Produit getProduit(HttpServletRequest request) {
      Produit produit = null;
      try {
         Long codeProduit = Long.valueOf(request.getParameter("codeProduit"));
         produit = em.find(Produit.class, codeProduit);
      } catch (EntityNotFoundException ex) {

      }
      return produit;
   }

   private void redirectWithErrorMessage(HttpServletResponse response, String uriRedirect,
         String message) throws IOException {
      String urlRediret = String.format(uriRedirect, message);
      response.sendRedirect(urlRediret);
   }
}