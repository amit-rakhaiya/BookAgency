<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>book</legend>

    <div class="display-label">book_name</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.book_name) %>
    </div>

    <div class="display-label">book_isbn</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.book_isbn) %>
    </div>

    <div class="display-label">photo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.photo) %>
    </div>

    <div class="display-label">category_id</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.category_id) %>
    </div>

    <div class="display-label">publisher_id</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.publisher_id) %>
    </div>

    <div class="display-label">author</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.author) %>
    </div>

    <div class="display-label">small_desc</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.small_desc) %>
    </div>

    <div class="display-label">price</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.price) %>
    </div>

    <div class="display-label">new_arrival</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.new_arrival) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.id }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
