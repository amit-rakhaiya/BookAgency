<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.category>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>category</legend>

    <div class="display-label">category_name</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.category_name) %>
    </div>

    <div class="display-label">display_order</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.display_order) %>
    </div>

    <div class="display-label">category_url_keyword</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.category_url_keyword) %>
    </div>

    <div class="display-label">meta_title</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.meta_title) %>
    </div>

    <div class="display-label">meta_keyword</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.meta_keyword) %>
    </div>

    <div class="display-label">meta_desc</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.meta_desc) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
