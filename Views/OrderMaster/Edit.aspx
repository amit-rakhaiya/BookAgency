<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.OrderMaster>" %>

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
        <legend>OrderMaster</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.order_id) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.order_id) %>
            <%: Html.ValidationMessageFor(model => model.order_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.order_item_id) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.order_item_id) %>
            <%: Html.ValidationMessageFor(model => model.order_item_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.order_date) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.order_date) %>
            <%: Html.ValidationMessageFor(model => model.order_date) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.UserId, "UserInfo") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("UserId", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.UserId) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.status) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.status) %>
            <%: Html.ValidationMessageFor(model => model.status) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.total) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.total) %>
            <%: Html.ValidationMessageFor(model => model.total) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.delivery_charge) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.delivery_charge) %>
            <%: Html.ValidationMessageFor(model => model.delivery_charge) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.payment_status) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.payment_status) %>
            <%: Html.ValidationMessageFor(model => model.payment_status) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.payment_amount) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.payment_amount) %>
            <%: Html.ValidationMessageFor(model => model.payment_amount) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.payment_currency) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.payment_currency) %>
            <%: Html.ValidationMessageFor(model => model.payment_currency) %>
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
