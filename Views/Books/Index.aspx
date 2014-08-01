<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BookAgency.Models.book>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            book_name
        </th>
        <th>
            book_isbn
        </th>
        <th>
            photo
        </th>
        <th>
            category_id
        </th>
        <th>
            publisher_id
        </th>
        <th>
            author
        </th>
        <th>
            small_desc
        </th>
        <th>
            price
        </th>
        <th>
            new_arrival
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.book_name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.book_isbn) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.photo) %>
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
            <%: Html.DisplayFor(modelItem => item.small_desc) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.price) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.new_arrival) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.id }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.id }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.id }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
