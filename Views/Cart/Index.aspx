﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BookAgency.Models.cart>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Cart
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<style>
    table.display td {
        font-size:12px;
    }
</style>
<h2>Cart</h2>

<table border="1" class="display" id="example" bordercolor="#CEE6F4">
    <tr>
        <th>
            Preview
        </th>
        <th>
            Book Name
        </th>
        <th>
            Price
        </th>
        <th>
            Qty
        </th>
        <th>
            Amount
        </th>
        <th colspan="3">
            Action
        </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td align="center" style="width:65px; height:75px;">
            <img
                src="../../images/<%: Html.DisplayFor(modelItem => item.book.photo) %>"
                alt="<%: Html.DisplayFor(modelItem => item.book.photo) %>"
                style="box-shadow: 4px 4px 2px #888888; width: 60px; height: 70px;" />
        </td>
        <td>
            <a href="<%=Url.Action("Details","Books", new{id = item.book_id}) %>">
            <%: Html.DisplayFor(modelItem => item.book.book_name) %>
                </a>
        </td>
        <td align="right">
            ₹ <%: Html.DisplayFor(modelItem => item.book.price) %>
        </td>
        <td align="right">
            <%= (int)item.qty%>
        </td>
        <td align="right">
            ₹ <%=item.qty *  item.book.price %>
        </td>
        <td class="action" align="center">
            <%: Html.ActionLink("Edit", "Edit", new {id=item.cart_id}) %>
        </td>
        <td class="action" align="center">
            <%: Html.ActionLink("Delete", "Delete", new {id=item.cart_id}) %>
        </td>
    </tr>
<% } %>
    <tr>
        <td colspan="3" align="right">
            <strong>Total</strong>
        </td>
        <td align="right">
            <strong><%=Model.Sum(item => item.qty) %></strong>
        </td>
        <td align="right">
            <strong>₹ <%=Model.Sum(item => (item.qty * item.book.price)) %></strong>
        </td>
    </tr>
</table>

<p class="link-button">
    <a href="<%=Url.Action("UserOrder", "OrderMaster", new {userId = (Guid)Membership.GetUser().ProviderUserKey })%>">Confirm Order</a>
    <a href="<%=Url.Action("Search","Books") %>">Back to Shopping</a>
</p>

</asp:Content>
