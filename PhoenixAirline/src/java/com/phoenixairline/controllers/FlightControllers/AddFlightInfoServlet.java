package com.phoenixairline.controllers.FlightControllers;

import com.phoenixairline.models.Flight;
import com.phoenixairline.models.FlightAccess;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddFlightInfoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("UP");
        response.setContentType("text/html");
        String FlightId = request.getParameter("flightId");
        System.out.println("Dwon");
        String Takeoff_airport = request.getParameter("takeoff_airport");
        String Takeoff_time = request.getParameter("takeoff_time");
        String Takeoff_date = request.getParameter("takeoff_date");
        String Landing_airport = request.getParameter("landing_airport");
        String Landing_time = request.getParameter("landing_time");
        String Landing_date = request.getParameter("landing_date");
        String Gate = request.getParameter("gate");
        String cost = request.getParameter("cost");
        String aircraftId = request.getParameter("aircraft_id");
        System.out.println(aircraftId + "Im here in servlet");

        Flight flightBean = new Flight(FlightId, Takeoff_airport, Takeoff_time, Takeoff_date, Landing_airport, Landing_time, Landing_date, Gate, cost, aircraftId);
        FlightAccess flightAccess = new FlightAccess();

        String result = flightAccess.InsertFlightDetails(flightBean);
        PrintWriter out = response.getWriter();
        out.println(result);

        /*String result = registerAccess.Registerindb(registerBean);
             if (result.equals("User is registered")) {
             RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
             dispatcher.include(request, response);
             } else {
             request.setAttribute("errMessage", result);
             RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
             dispatcher.include(request, response);
             }*/
    }
}
