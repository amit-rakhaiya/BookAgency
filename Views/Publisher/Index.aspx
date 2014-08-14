<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BookAgency.Models.publisher>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: ((BookAgency.Models.page_mgmt)ViewData["pageDetails"]).page_title %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: ((BookAgency.Models.page_mgmt)ViewData["pageDetails"]).page_title %></h2>

<p class="link-button">
    <%: Html.ActionLink("Create New", "Create") %>
</p>

<table cellpadding="0" cellspacing="0" border="1" class="display" id="example" bordercolor="#CEE6F4" >
    <tr>
        <th>Name
        </th>
        <th>Display Order
        </th>
        <th>Publisher Url Keyword
        </th>
        <th>Meta Title
        </th>
        <th>Meta-Keyword
        </th>
        <th>Meta Desc
        </th>
        <th colspan="2">
            Action
        </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.ActionLink(item.publisher_name, "Details", new { id = item.id })%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.display_order) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.publisher_url_keyword) %>
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
        <td class="action">
            <%: Html.ActionLink("Edit", "Edit", new { id=item.id }) %> 
        </td>
        <td class="action">
            <%: Html.ActionLink("Delete", "Delete", new { id=item.id }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
