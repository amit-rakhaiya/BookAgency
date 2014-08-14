<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.cart>" %>

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
        <legend>cart</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.cart_id) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.cart_id) %>
            <%: Html.ValidationMessageFor(model => model.cart_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.book_id, "book") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("book_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.book_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.qty) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.qty) %>
            <%: Html.ValidationMessageFor(model => model.qty) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.UserId, "UserInfo") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("UserId", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.UserId) %>
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
