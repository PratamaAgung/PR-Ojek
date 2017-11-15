package response;

import database.LoginManager;
import database.TokenManager;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.UUID;

public class validateHandler extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String status;
        String token = request.getParameter("token");
        TokenManager tokenManager = new TokenManager();
        String validation = tokenManager.validateToken(token);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        if (validation != null && validation == "success"){
            status = "success";
        } else {
            status = "failed";
        }

        JSONObject obj = new JSONObject();
        try {
            obj.put("status", status);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        out.println(obj.toString());
    }
}
