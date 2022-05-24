<%-- 
    Document   : AllFlightDetails
    Created on : May 20, 2022, 10:10:10 AM
    Author     : dell
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Flight Details</title>
    </head>
    <body>
        <h1>All Flight Details</h1>
        <h1>Search Flight Details</h1>
        <div>
            <form method="post" action="SearchFlightInfoServlet">
                Select option to Search data  
                <input type="date" name="takeoff_date" value="" />
                take off <select name="takeoff_airport">
                    <option value="AAL">AAL</option>
                    <option value="CMB">CMB</option>
                </select>
                landing <select name="landing_airport">
                    <option value="ABV">ABV</option>
                    <option value="CWL">CWL</option>
                </select>
                <input type="submit" name="Search"/>
                <input type="reset" name="Cancel"/>
            </form>
        </div>

        <table border="1">
            <thead>
            <th>ID</th>
            <th>Takeoff Airport</th>
            <th>Takeoff Time</th>
            <th>Takeoff Date</th>
            <th>Landing Airport</th>
            <th>Landing Time</th>
            <th>Landing Date</th>
            <th>Gate</th>
            <th>Cost</th>
            <th>Aircraft</th>
            <th>Action</th>
        </thead>
        <tbody>
            <%
                if ((request.getAttribute("result") != null)) {
                    List data = new ArrayList();
                    data = (List) request.getAttribute("result");
                    Iterator itr = data.iterator();
                    while (itr.hasNext()) {
            %>
            <tr>
        <form action="CreateTicketServlet" method="POST">
                <td><input type="hidden" name="flightId" value="<%=itr.next()%>"/></td>
                <td><%=itr.next()%></td>
                <td><%=itr.next()%></td>
                <td><%=itr.next()%></td>
                <td><%=itr.next()%></td>
                <td><%=itr.next()%></td>
                <td><%=itr.next()%></td>
                <td><%=itr.next()%></td>
                <td><%=itr.next()%></td>
                <td><%=itr.next()%></td>
                <td><input type="submit" value="Book Reservation" /></td>
        </form>

                
            </tr>
            <%}
                }%>
        </tbody>
    </table>

    <form action="CreateTicketServlet" method="POST">
        <table border="1">
            <%
                if ((request.getAttribute("selectedResult") != null)) {
                    List data = new ArrayList();
                    data = (List) request.getAttribute("selectedResult");
                    Iterator itr = data.iterator();
                    while (itr.hasNext()) {
            %>
            <tbody>
                <tr>
                    <td>TO</td>
                    <td><%=itr.next()%></td>
                </tr>
                <tr>
                    <td>Air Time</td>
                    <td><%=itr.next()%></td>
                </tr>
                <tr>
                    <td>Takeoff Date</td>
                    <td><%=itr.next()%></td>
                </tr>
                <tr>
                    <td>From</td>
                    <td><%=itr.next()%></td>
                </tr>
                <tr>
                    <td>Land Time</td>
                    <td><%=itr.next()%></td>
                </tr>
                <tr>
                    <td>Land Date</td>
                    <td><%=itr.next()%></td>
                </tr>
                <tr>
                    <td>Gate</td>
                    <td><%=itr.next()%></td>
                </tr>
                <tr>
                    <td>Cost</td>
                    <td><%=itr.next()%></td>
                </tr>
                <tr>
                    <td>Aircraft</td>
                    <td><%=itr.next()%></td>
                </tr>
                <tr>
                    <td>Class</td>
                    <td><select name="class" required>
                            <option value="101">1st class</option>
                            <option value="102">Business</option>
                            <option value="103">Economy</option>
                        </select></td>
                </tr>
                <tr>
                    <td>Seat</td>
                    <td><select name="seatNumber" required>
                            <option value="1">1A</option>
                            <option value="2">B1</option>
                            <option value="3">C1</option>
                        </select></td>
                </tr>
                <tr>
                    <td>Number of seats</td>
                    <td><input type="number" name="seats" value="" size="3" /></td>
                </tr>
                <tr>
                    <td><input type="reset" value="Cancel" /></td>
                    <td><input type="submit" value="Book Reservation" /></td>
                </tr>
            </tbody>
            <%}
                }%>
        </table>
    </form>
</body>
</html>
