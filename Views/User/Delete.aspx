<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.UserInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>UserInfo</legend>

    <div class="display-label">User</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.User.UserName) %>
    </div>

    <div class="display-label">address</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.address) %>
    </div>

    <div class="display-label">city</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.city) %>
    </div>

    <div class="display-label">state</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.state) %>
    </div>

    <div class="display-label">country</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.country) %>
    </div>

    <div class="display-label">telephone</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.telephone) %>
    </div>

    <div class="display-label">mobile</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.mobile) %>
    </div>

    <div class="display-label">comments</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.comments) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
