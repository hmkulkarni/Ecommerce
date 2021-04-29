package com.mycompany.ecommerce.servlets;

import com.mycompany.ecommerce.dao.CategoryDao;
import com.mycompany.ecommerce.dao.ProductDao;
import com.mycompany.ecommerce.entities.Category;
import com.mycompany.ecommerce.entities.Product;
import com.mycompany.ecommerce.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            //Decide whether category or product
            String op = request.getParameter("operation");
            if (op.trim().equals("addCategory")) {
                // Fetching Category data
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDesc(description);

                //Save category data in database
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category added successfully");
                response.sendRedirect("admin.jsp");

            } else if (op.trim().equals("addProduct")) {
                //Fetching Product data  
                String prodTitle = request.getParameter("prodTitle");
                int prodPrice = Integer.parseInt(request.getParameter("prodPrice"));
                int prodDiscount = Integer.parseInt(request.getParameter("prodDiscount"));
                int prodQuantity = Integer.parseInt(request.getParameter("prodQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("prodImg");
                String prodDescription = request.getParameter("prodDescription");

                Product p = new Product();
                p.setProductTitle(prodTitle);
                p.setProductPrice(prodPrice);
                p.setProductDiscount(prodDiscount);
                p.setProductQty(prodQuantity);
                p.setProductDesc(prodDescription);
                p.setProductImg(part.getSubmittedFileName());

                // Get category by id
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);

                p.setCategory(category);

                // Save products in database
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);

                //pic upload
                //Find the path to upload photo
                String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();

                //Code for uploading
                try {
                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

                    // Reading data
                    byte[] data = new byte[is.available()];
                    is.read(data);

                    // Writing data
                    fos.write(data);
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Product added successfully");
                response.sendRedirect("admin.jsp");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void Category() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
