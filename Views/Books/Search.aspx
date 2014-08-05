<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BookAgency.Models.book>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Acty-Search
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm()) { %>
        <p>
            Find by name: <%:Html.TextBox("SearchString")%> <br />
            
            <input type="submit" value="Search" class="button grey"/>
        </p>
    <%}%>

    <form id="indexForm" runat="server">
        <div>
            <h3 style="border-bottom: solid 1px; border-top: solid 1px;">Search</h3>

            <table border="0" width="100%">

                <% 
                    int i = 0;
                    int cols = 4;
                    foreach (var item in Model)
                    {
                        if (i % cols == 0)
                        {
                            Response.Write("<tr>");
                        }
                        i++; %>
                <td>
                    <a href='<%: Url.Action("Details", "Books", new { id=item.id }) %>'>
                        <img src="../images/<%: Html.DisplayFor(modelItem => item.photo) %>" style="box-shadow: 5px 5px 3px #888888; width: 140px; height: 160px;" />
                    </a>
                </td>
                <%
                        if (i % cols == 0)
                        {
                            Response.Write("</tr>");
                            i = 0;
                        } %>

                <% } %>
            </table>
        </div>
    </form>
</asp:Content>
