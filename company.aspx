<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Information Retriever</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Company Information Retriever</h1>
        <div class="container2">
            <form id="companyForm" method="post">
                <div class="options">
                    <div class="city-businessline">
                        <div class="form-group">
                            <label for="city"><h2>City</h2></label>
                            <select id="city" name="city" required>
                                <option value="" selected disabled>-- Select City --</option>
                                <option value="Kuopio">Kuopio</option>
                                <option value="Rovaniemi">Rovaniemi</option>
                                <option value="Espoo">Espoo</option>
                                <option value="Porvoo">Porvoo</option>
                                <option value="Pori">Pori</option>
                                <option value="Hämeenlina">Hämeenlina</option>
                                <option value="Mikkeli">Mikkeli</option>
                                <option value="Lahti">Lahti</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="businessLine"><h2>Business Line</h2></label>
                            <select id="businessLine" name="businessLine" required>
                                <option value="" selected disabled>-- Select Business Line --</option>
                                <option value="55">Accommodation</option>
                                <option value="56">Banking and Finance</option>
                                <option value="57">Restaurants</option>
                                <option value="58">Wood Production</option>
                                <option value="59">Investments</option>
                                <option value="60">Hairdressing</option>
                                <option value="61">Police Department</option>
                            </select>
                        </div>
                    </div>

                    <div class="timeStart-End">
                        <div class="form-group">
                            <label for="timeStart"><h2>Time Start</h2></label>
                            <input type="date" id="timeStart" name="timeStart" required/>
                        </div>
                        <div class="form-group">
                            <label for="timeEnd"><h2>Time End</h2></label>
                            <input type="date" id="timeEnd" name="timeEnd" required/>
                        </div>
                        <div class="form-group">
                            <label for="maxResults"><h2>Max Results</h2></label>
                            <input type="number" id="maxResults" name="maxResults" required/>
                        </div>
                    </div>
                </div>

                <div class="button-container">
                    <button type="submit" id="fetchBtn" name="fetch">Fetch</button>
                </div>
            </form>
            
            <div class="table-inside">
                <table>
                    <thead>
                        <tr>
                            <th>Business ID</th>
                            <th>Company Name</th>
                            <th>Address</th>
                        </tr>
                    </thead>
                    <tbody id="companyData">
                        <% 
                            if (Request.Form["fetch"] != null)
                            {
                                // Sample data
                                string[,] companies = {
                                    { "3449121-5", "TahkoLuxuryVillas Oy", "Ronantie 70100 KUOPIO" },
                                    { "3463763-2", "Sporttiolo Oy", "Rautokannantie 70840 KUOPIO" },
                                    { "3464188-5", "Tiimihenki Oy", "Kauppakatu 70100 KUOPIO" }
                                };

                                int maxResults = !string.IsNullOrEmpty(Request.Form["maxResults"]) ? int.Parse(Request.Form["maxResults"]) : 3;

                                for (int i = 0; i < Math.Min(maxResults, companies.GetLength(0)); i++)
                                {
                                    Response.Write("<tr>");
                                    Response.Write("<td>" + companies[i, 0] + "</td>");
                                    Response.Write("<td>" + companies[i, 1] + "</td>");
                                    Response.Write("<td>" + companies[i, 2] + "</td>");
                                    Response.Write("</tr>");
                                }
                            }
                            else
                            {
                                Response.Write("<tr><td colspan='3'>No results available. Please enter your search criteria and fetch results.</td></tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
