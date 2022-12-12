package com.nextu.controllers.produit;

import java.io.IOException;
import com.nextu.entities.Produit;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.UserTransaction;

/**
 * Servlet implementation class CreerProduitController
 */
public class CreerProduitController extends HttpServlet {
   private static final long serialVersionUID = 1L;
   @Resource
   private UserTransaction userTransaction;

   @PersistenceContext(unitName = "tp-final")
   private EntityManager em;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public CreerProduitController() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      String libelle = request.getParameter("libelle");
      String uriRedirect = """
            form-produit.jsp?errorMessage=%s
            """;
      String message = "";
      if (libelle == null || libelle.isEmpty() || libelle.isBlank()) {
         message = "Veuillez renseignez le libellé du produit";
         redirectWithErrorMessage(response, uriRedirect, message);

      } else {
         boolean transactionOk = false;
         try {
            userTransaction.begin();
            Produit produit = new Produit();
            produit.setLibelle(libelle);
            em.persist(produit);
            transactionOk = true;
         } catch (Exception e) {
            System.out.print("Une erreur est survennue lors de l'enregistrement");
         } finally {
            try {
               if (transactionOk) {
                  userTransaction.commit();
                  response.sendRedirect("");
               } else {
                  message =
                        "Une erreur est survenue lors de l'enregistrement veuillez contactez l'administrateur";
                  userTransaction.rollback();
                  String.format(uriRedirect, message);
                  response.sendRedirect(uriRedirect);

               }
            } catch (Exception e) {
               message =
                     "Une erreur est survenue lors de l'enregistrement veuillez contactez l'administrateur";
               String.format(uriRedirect, message);
               response.sendRedirect(uriRedirect);
            }
         }
      }


   }

   private void redirectWithErrorMessage(HttpServletResponse response, String uriRedirect,
         String message) throws IOException {
      String urlRediret = String.format(uriRedirect, message);
      response.sendRedirect(urlRediret);
   }
}