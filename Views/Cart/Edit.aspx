<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.cart>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%= Model.book.book_name  %></legend>

        <%: Html.HiddenFor(model => model.cart_id) %>
        <%: Html.HiddenFor(model => model.book_id) %>
        <%: Html.HiddenFor(model => model.UserId) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.book.book_name) %>
        </div>
        <div class="editor-field">
            <label><%=Model.book.book_name %></label>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.qty) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.qty) %>
            <%: Html.ValidationMessageFor(model => model.qty) %>
        </div>
        <p>
            <input type="submit" value="Save" /> | <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    </fieldset>
<% } %>

</asp:Content>
