<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.OrderMaster>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>OrderMaster</legend>

    <div class="display-label">order_id</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.order_id) %>
    </div>

    <div class="display-label">order_item_id</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.order_item_id) %>
    </div>

    <div class="display-label">order_date</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.order_date) %>
    </div>

    <div class="display-label">UserInfo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.UserInfo.address) %>
    </div>

    <div class="display-label">status</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.status) %>
    </div>

    <div class="display-label">total</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.total) %>
    </div>

    <div class="display-label">delivery_charge</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.delivery_charge) %>
    </div>

    <div class="display-label">payment_status</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.payment_status) %>
    </div>

    <div class="display-label">payment_amount</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.payment_amount) %>
    </div>

    <div class="display-label">payment_currency</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.payment_currency) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
