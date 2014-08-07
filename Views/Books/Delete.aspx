<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: ((BookAgency.Models.page_mgmt)ViewData["pageDetails"]).page_title %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Delete</h2>

    <h3>Are you sure you want to delete this?</h3>
    <table border="0" class="table-book-details" cellspacing="15px;">
        <tr>
            <td>
                <img
                    src="../../images/<%: Html.DisplayFor(model => model.photo) %>"
                    alt="<%: Html.DisplayFor(model => model.book_name) %>"
                    style="box-shadow: 5px 5px 3px #888888; height:260px; width: 230px; margin-right: 15px" />
            </td>
            <td>
                <table>
                    <tr>
                        <th style="auto">
                            <label>Book Name</label>
                        </th>
                        <td>: <%: Html.DisplayFor(model => model.book_name) %>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label>Auther</label>
                        </th>
                        <td>: <%: Html.DisplayFor(model => model.author) %>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label>Category</label>
                        </th>
                        <td>: <%: Html.DisplayFor(model => model.category.category_name) %>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label>Publisher</label>
                        </th>
                        <td>: <%: Html.DisplayFor(model => model.publisher.publisher_name) %>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label>ISBN</label>
                        </th>
                        <td>: <%: Html.DisplayFor(model => model.book_isbn) %>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label>Price</label>
                        </th>
                        <td>: <%: Html.DisplayFor(model => model.price) %> INR
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%: Html.DisplayFor(model => model.small_desc) %>
                        </td>
                    </tr>
                    <tr>
                    </tr>

                </table>
            </td>
        </tr>
        <tr>
            <td></td>
            
            <td style="align-content: flex-end; vertical-align: bottom;">
                <% using (Html.BeginForm()) { %>
                <table border="0">
                    <tr>
                        <td>
                            <input type="submit" value="Delete" class="buttonblue"/>
                        </td>
                        <td>
                            <a href='<%: Url.Action("Index", "Books") %>' class="buttonblue" style="color:white; text-decoration:none;">
                            Back
                                </a>
                        </td>
                    </tr>
                </table>
				<% } %>
            </td>
        </tr>
    </table>
</asp:Content>
