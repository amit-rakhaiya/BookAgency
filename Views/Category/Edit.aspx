<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.category>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     <%: ((BookAgency.Models.page_mgmt)ViewData["pageDetails"]).page_title %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> <%: ((BookAgency.Models.page_mgmt)ViewData["pageDetails"]).page_title %></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>category</legend>

        <%: Html.HiddenFor(model => model.id) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.category_name) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.category_name) %>
            <%: Html.ValidationMessageFor(model => model.category_name) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.display_order) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.display_order) %>
            <%: Html.ValidationMessageFor(model => model.display_order) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.category_url_keyword) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.category_url_keyword) %>
            <%: Html.ValidationMessageFor(model => model.category_url_keyword) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.meta_title) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.meta_title) %>
            <%: Html.ValidationMessageFor(model => model.meta_title) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.meta_keyword) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.meta_keyword) %>
            <%: Html.ValidationMessageFor(model => model.meta_keyword) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.meta_desc) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.meta_desc) %>
            <%: Html.ValidationMessageFor(model => model.meta_desc) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
