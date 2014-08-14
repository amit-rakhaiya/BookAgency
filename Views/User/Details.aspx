<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.UserInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Personal Information</h2>

<fieldset>
    <legend>Account Information</legend>

    <div class="display-label"><%: Html.LabelFor(model => model.User.UserName) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.User.UserName) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.address) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.address) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.city) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.city) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.state) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.state) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.country) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.country) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.telephone) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.telephone) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.mobile) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.mobile) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.comments) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.comments) %>
    </div>
    <div>
        <br />
        <a href="<%=Url.Action("Edit","User", new { id = (Guid)Membership.GetUser().ProviderUserKey}) %>">Edit</a> |
        <% if (HttpContext.Current.User.IsInRole("admin") == true)
           { 
        %>
                <a href="<%=Url.Action("Index","User") %>">Back to Account</a>
        <% } else  {%>
                <a href="<%=Url.Action("UserIndex","User", new { id = (Guid)Membership.GetUser().ProviderUserKey}) %>">Back to Account</a>
        <% } %>
    </div>
</fieldset>

</asp:Content>
