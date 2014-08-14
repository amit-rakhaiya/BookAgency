<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.book>" %>
<%@ Import Namespace="PagedList" %>
<%@ Import Namespace="PagedList.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Html.DisplayFor(model => model.book_name) %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Html.DisplayFor(model => model.book_name) %></h2>
    <hr />
    <table border="0" width="100%" class="table-book-details" cellspacing="15px;">
        <tr>
            <td style="padding-left:2%;">
                <img
                    src="../../images/<%: Html.DisplayFor(model => model.photo) %>"
                    alt="<%: Html.DisplayFor(model => model.book_name) %>"
                    style="box-shadow: 5px 5px 3px #888888; width: 230px;" />
            </td>
            <td style="padding-right:20%;">
                <table>
                    <tr>
                        <th>
                            <label>Auther</label>
                        </th>
                        <td>: <%: Html.DisplayFor(model => model.author) %>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label>Category</label>
                        </th>
                        <td>: <%: Html.DisplayFor(model => model.category.category_name) %>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label>Publisher</label>
                        </th>
                        <td>: <%: Html.DisplayFor(model => model.publisher.publisher_name) %>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label>ISBN</label>
                        </th>
                        <td>: <%: Html.DisplayFor(model => model.book_isbn) %>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label>Price</label>
                        </th>
                        <td>: <%: Html.DisplayFor(model => model.price) %> INR
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%: Html.DisplayFor(model => model.small_desc) %>
                        </td>
                    </tr>
                    <tr>
                        <% using (Html.BeginForm("AddToCart", "Cart", new {bookId = Model.id}))
                           { %>
                            <th>Quantity</th>
                            <td>: <%:Html.TextBox("qty", null, new { @Style = "width:80px" })%></td>
                            <td><input type="Submit" value="Add to Cart" class="button grey" style="height:25px; width:auto;"/></td>
                        <% } %>
                    </tr>

                </table>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td style="align-content: flex-end; vertical-align: bottom;" align="right">
                <table border="0">
                    <tr>
                        <td class="link-button">
                            <%
                                if (User.IsInRole("Admin"))
                                { %>
                            <%:Html.ActionLink("Edit", "Edit", new { id = Model.id })%>
                            <%}
                            %> 
                        </td>
                        <td style="vertical-align: bottom;">
                            <a href="javascript:history.go(-1)">Back</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div>
        <h3 style="border-bottom: solid 1px; border-top: solid 1px;">Books with same category</h3>
        <table border="0" width="100%">
            <% 
                int i = 0;
                int cols = 4;
                foreach (var item in Model.category.books.ToList().ToPagedList(1, 12))
                {
                    if (i % cols == 0)
                    {
                        Response.Write("<tr>");
                    }
                    i++; %>
            <td>
                <a href='<%: Url.Action("Details", "Books", new { id=item.id }) %>'>
                    <img src="../../images/<%: Html.DisplayFor(modelItem => item.photo) %>" style="box-shadow: 5px 5px 3px #888888; width: 140px; height: 160px;" />
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
</asp:Content>
