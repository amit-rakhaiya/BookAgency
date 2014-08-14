<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.publisher>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: ((BookAgency.Models.page_mgmt)ViewData["pageDetails"]).page_title %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: ((BookAgency.Models.page_mgmt)ViewData["pageDetails"]).page_title %></h2>

<fieldset>
    <legend>publisher</legend>

    <div class="display-label">publisher_name</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.publisher_name) %>
    </div>

    <div class="display-label">display_order</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.display_order) %>
    </div>

    <div class="display-label">publisher_url_keyword</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.publisher_url_keyword) %>
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
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.id }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
