<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<BookAgency.Models.book>>" %>

<%@ Import Namespace="PagedList" %>
<%@ Import Namespace="PagedList.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: ((BookAgency.Models.page_mgmt)ViewData["pageDetails"]).page_title %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2><%: ((BookAgency.Models.page_mgmt)ViewData["pageDetails"]).page_title %></h2>
    <p class="link-button">
        <%: Html.ActionLink("Create New", "Create")%>
    </p>
    <div id="box">

        <table cellpadding="0" cellspacing="0" border="1" class="display" id="example" bordercolor="#CEE6F4">
            <tr>
                <th>Name
                </th>
                <th>ISBN
                </th>
                <th>Category
                </th>
                <th>Publisher
                </th>
                <th>Author
                </th>
                <th>New
                </th>
                <th colspan="2">Actions
                </th>
            </tr>

            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: Html.ActionLink(item.book_name, "Details", new { id = item.id })%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.book_isbn) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.category_id) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.publisher_id) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.author) %>
                </td>
                <td>
                    <%
                               if (item.new_arrival == 1) Response.Write("Yes");
                               else Response.Write("No");
                    %>
                </td>
                <td class="action">
                    <%: Html.ActionLink("Edit", "Edit", new { id=item.id }) %> 
                </td>
                <td class="action">
                    <%: Html.ActionLink("Delete", "Delete", new { id=item.id }) %>
                </td>
            </tr>
            <% } %>
        </table>
        <%:Html.PagedListPager(Model, Page => Url.Action("Index", new {Page}) ) %>
    </div>

</asp:Content>
