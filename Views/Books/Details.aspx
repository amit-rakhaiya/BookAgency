<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Book Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .table-book-details {
            border-collapse:collapse;
            margin-top:20px;
        }
        .table-book-details TH {
            text-align:right;
            color:green;
            vertical-align:top;
            font-size:12px;
        }
        .table-book-details TD {
            text-align:left;
            vertical-align:top;
            font-size:12px;
            margin-left:10px;
        }
    </style>

<h3 style="margin-bottom:0px;"><%: Html.DisplayFor(model => model.book_name) %></h3>
<hr />
<table border="0" class="table-book-details" cellspacing="15px;">
    <tr>
        <td rowspan="10">
            <img 
                src="../../images/<%: Html.DisplayFor(model => model.photo) %>"
                alt="<%: Html.DisplayFor(model => model.book_name) %>"
                style="box-shadow: 5px 5px 3px #888888;  width: 230px; margin-right:15px" />            
        </td>
    </tr>
    <tr>
        <th>
            <label>Auther</label>
        </th>
        <td>
            <%: Html.DisplayFor(model => model.author) %>
        </td>
    </tr>
    <tr>
        <th>
            <label>Category</label>
        </th>
        <td>
            <%: Html.DisplayFor(model => model.category_id) %>
        </td>
    </tr>
    <tr>
        <th>
            <label>Publisher</label>
        </th>
        <td>
            <%: Html.DisplayFor(model => model.publisher_id) %>
        </td>
    </tr>
    <tr>
        <th>
            <label>ISBN</label>
        </th>
        <td>
            <%: Html.DisplayFor(model => model.book_isbn) %>
        </td>
    </tr>
    <tr>
        <th>
            <label>Price</label>
        </th>
        <td>
            <%: Html.DisplayFor(model => model.price) %>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <%: Html.DisplayFor(model => model.small_desc) %>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <%: Html.DisplayFor(model => model.new_arrival) %>
        </td>
    </tr>
    <tr>
        <th>
            <%: Html.ActionLink("Edit", "Edit", new { id=Model.id }) %> 
        </th>
        <td>
            <%: Html.ActionLink("Back to List", "Index") %>
        </td>
    </tr>
</table>

</asp:Content>
