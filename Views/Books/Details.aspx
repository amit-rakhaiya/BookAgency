<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.book>" %>
<%@ Import Namespace="PagedList" %>
<%@ Import Namespace="PagedList.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Book Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .table-book-details {
            border-collapse: collapse;
            margin-top: 20px;
        }

            .table-book-details TH {
                text-align: left;
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

    <h3 style="margin-bottom: 0px;"><%: Html.DisplayFor(model => model.book_name) %></h3>
    <hr />
    <table border="0" class="table-book-details" cellspacing="15px;">
        <tr>
            <td>
                <img
                    src="../../images/<%: Html.DisplayFor(model => model.photo) %>"
                    alt="<%: Html.DisplayFor(model => model.book_name) %>"
                    style="box-shadow: 5px 5px 3px #888888; width: 230px; margin-right: 15px" />
            </td>
            <td>
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
                    </tr>

                </table>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td style="align-content: flex-end; vertical-align: bottom;">
                <table border="0">
                    <tr>
                        <td>
                            <%
                                if (User.IsInRole("Admin"))
                                { %>
                            <%:Html.ActionLink("Edit", "Edit", new { id = Model.id }, new { @class = "button grey" })%>
                            <%}
                            %> 
                        </td>
                        <td style="vertical-align: bottom;">
                            <a href="javascript:history.go(-1)" class="button grey">Back</a>
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
