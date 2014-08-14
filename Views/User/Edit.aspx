<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.UserInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%=HttpContext.Current.User.Identity.Name %></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>UserInfo</legend>
        <%: Html.HiddenFor(model => model.UserId) %>
        <%: Html.HiddenFor(model => model.User.UserId) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.UserId, "User Name") %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.User.UserName) %>
            <%: Html.ValidationMessageFor(model => model.UserId) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.address) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.address) %>
            <%: Html.ValidationMessageFor(model => model.address) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.city) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.city) %>
            <%: Html.ValidationMessageFor(model => model.city) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.state) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.state) %>
            <%: Html.ValidationMessageFor(model => model.state) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.country) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.country) %>
            <%: Html.ValidationMessageFor(model => model.country) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.telephone) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.telephone) %>
            <%: Html.ValidationMessageFor(model => model.telephone) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.mobile) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.mobile) %>
            <%: Html.ValidationMessageFor(model => model.mobile) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.comments) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.comments) %>
            <%: Html.ValidationMessageFor(model => model.comments) %>
        </div>

        <p>
            <input type="submit" value="Save" /> | <%: Html.ActionLink("Back", "Index") %>
        </p>
    </fieldset>
<% } %>

</asp:Content>
