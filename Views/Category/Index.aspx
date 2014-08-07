<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BookAgency.Models.category>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>


    <table cellpadding="0" cellspacing="0" border="1" class="display" id="example" bordercolor="#CEE6F4" >
        <tr>
            <th>category_name
            </th>
            <th>display_order
            </th>
            <th>category_url_keyword
            </th>
            <th>meta_title
            </th>
            <th>meta_keyword
            </th>
            <th>meta_desc
            </th>
            <th></th>
        </tr>

        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.category_name) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.display_order) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.category_url_keyword) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.meta_title) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.meta_keyword) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.meta_desc) %>
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
