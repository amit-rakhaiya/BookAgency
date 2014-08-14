<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BookAgency.Models.OrderMaster>>" %>

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
            order_id
        </th>
        <th>
            order_item_id
        </th>
        <th>
            order_date
        </th>
        <th>
            UserInfo
        </th>
        <th>
            status
        </th>
        <th>
            total
        </th>
        <th>
            delivery_charge
        </th>
        <th>
            payment_status
        </th>
        <th>
            payment_amount
        </th>
        <th>
            payment_currency
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.order_id) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.order_item_id) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.order_date) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.UserInfo.address) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.status) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.total) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.delivery_charge) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.payment_status) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.payment_amount) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.payment_currency) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
