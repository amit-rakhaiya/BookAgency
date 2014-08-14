<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.cart>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>cart</legend>

    <div class="display-label">cart_id</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.cart_id) %>
    </div>

    <div class="display-label">book</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.book.book_name) %>
    </div>

    <div class="display-label">qty</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.qty) %>
    </div>

    <div class="display-label">UserInfo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.UserInfo.address) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
