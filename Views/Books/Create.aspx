<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>book</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.book_name) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.book_name) %>
            <%: Html.ValidationMessageFor(model => model.book_name) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.book_isbn) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.book_isbn) %>
            <%: Html.ValidationMessageFor(model => model.book_isbn) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.photo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.photo) %>
            <%: Html.ValidationMessageFor(model => model.photo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.category_id) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.category_id) %>
            <%: Html.ValidationMessageFor(model => model.category_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.publisher_id) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.publisher_id) %>
            <%: Html.ValidationMessageFor(model => model.publisher_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.author) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.author) %>
            <%: Html.ValidationMessageFor(model => model.author) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.small_desc) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.small_desc) %>
            <%: Html.ValidationMessageFor(model => model.small_desc) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.price) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.price) %>
            <%: Html.ValidationMessageFor(model => model.price) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.new_arrival) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.new_arrival) %>
            <%: Html.ValidationMessageFor(model => model.new_arrival) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
