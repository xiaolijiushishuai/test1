package servlet;

import domian.users;
import text.textuser01;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Servletwei")
public class Servletwei extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        users us=new users();
        us.setUsername(username);
        us.setPassword(password);
        textuser01 text=new textuser01();
        users textuser = text.Textuser(us);
        if(textuser==null){
            request.getRequestDispatcher("/cuowu").forward(request,response);
        }
        else {
            request.getRequestDispatcher("/zhengque").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
