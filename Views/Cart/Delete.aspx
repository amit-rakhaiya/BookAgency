<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.cart>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>Remove all <%= Model.book.book_name  %> ?</legend>

    <div>
        <img
            src="../../images/<%: Model.book.photo %>"
            alt="<%: Model.book.book_name %>"
            style="box-shadow: 4px 4px 2px #888888; width: 140px; height: 160px;" />
    </div>
    <div class="display-label"><%: Html.LabelFor(model => model.book.book_name) %></div>
    <div class="display-field"><%: Html.DisplayFor(model => model.book.book_name) %></div>
    <div class="display-label"><%: Html.LabelFor(model => model.qty) %></div>
    <div class="display-field"><%: Html.DisplayFor(model => model.qty) %></div>

    <% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> | <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>
</fieldset>


</asp:Content>
