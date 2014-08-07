<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BookAgency.Models.book>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: ((BookAgency.Models.page_mgmt)ViewData["pageDetails"]).page_title %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .table-book-details {
            border-collapse: collapse;
            margin-top: 20px;
        }

            .table-book-details TH {
                text-align: right;
                color: green;
                vertical-align: top;
                font-size: 12px;
            }

            .table-book-details TD {
                text-align: left;
                vertical-align: top;
                font-size: 12px;
                margin-left: 10px;
            }
    </style>
    <% using (Html.BeginForm()) { %>
        <table class="table-book-details" width="100%" style="border-collapse: separate; border-spacing: 5px;">
            <tr>
                <th>Book Name/ISBN : </th>
                <td><%:Html.TextBox("SearchString", null, new {@Style="width:176px" })%></td>
            </tr>
            <tr>
                <th>Category : </th>
                <td><%:Html.DropDownList("categoryId", (List<SelectListItem>)ViewData["category_select_list"], "Select Category", new {@Style="width:180px" })%></td>
            </tr>
            <tr>
                <th>Publication : </th>
                <td><%:Html.DropDownList("publisherId", (List<SelectListItem>)ViewData["publisher_select_list"], "Select Publisher", new {@Style="width:180px" })%></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="Submit" value="Search" class="button grey" style="height:25px; width:auto;"/>
                    <input type="reset" value="Reset" class="button grey" style="height:25px; width:auto;"/>
                </td>
            </tr>
        </table>
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
