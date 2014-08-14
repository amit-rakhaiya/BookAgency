<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BookAgency.Models.UserInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Welcome <%=HttpContext.Current.User.Identity.Name %></h2>

<table cellpadding="0" cellspacing="0" border="1" class="display" id="example" bordercolor="#CEE6F4">
    <tr>
        <th>
            User
        </th>
        <th>
            City
        </th>
        <th>
            Telephone
        </th>
        <th>
            Mobile
        </th>
        <th>
            Comments
        </th>
        <% if (HttpContext.Current.User.IsInRole("Admin") == true) { %>
            <th colspan="2">Action</th>
        <%} %>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.ActionLink(item.User.UserName, "Details", new { id = item.UserId })%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.city) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.telephone) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.mobile) %>
        </td>
        <td style="width:30%">
            <%: Html.DisplayFor(modelItem => item.comments) %>
        </td>
        
        <% if (HttpContext.Current.User.IsInRole("Admin") == true) { %>
        <td class="action">
            <%: Html.ActionLink("Edit", "Edit", new { id=item.UserId }) %> 
        </td>
        <td class="action">
            <%: Html.ActionLink("Delete", "Delete", new { id=item.UserId }) %>
        </td>
        <%} %>

    </tr>
<% } %>
    
</table>

</asp:Content>
