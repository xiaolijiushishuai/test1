package servlet;

import domian.users;
import text.textuser01;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/servletdenglu")
public class Servletdenglu extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String chckedimg = request.getParameter("chckedimg");
        HttpSession session = request.getSession();
        String sssss = (String) session.getAttribute("sssss");
        session.removeAttribute("sssss");
        if (sssss!=null&&sssss.equalsIgnoreCase(chckedimg)) {
            if ("xiaoli".equals(username) && "123".equals(password)) {
                response.sendRedirect(request.getContextPath() + "/succc.jsp");
                session.setAttribute("user",username);
            } else {
                request.setAttribute("errorppp", "用户名或密码错误");
                request.getRequestDispatcher("/denglu.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "验证码错误");
            request.getRequestDispatcher("/denglu.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
