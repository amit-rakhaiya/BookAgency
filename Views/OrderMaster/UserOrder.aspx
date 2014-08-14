<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.OrderMaster>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    UserOrder
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Order Details</h2>

<fieldset>
    <legend>Bill Summery</legend>

    <table border="0">
        <tr>
            <td>
                <div class="display-label"><%: Html.LabelFor(model => model.UserInfo.User.UserName) %></div>
            </td>
            <td>
                <div class="display-field">
                    : <%: Html.DisplayFor(model => model.UserInfo.User.UserName) %>
                </div>
            </td>
            <td  width="60%"></td>
        </tr>
        <tr>
            <td>
                <div class="display-label"><label>Email</label></div>
            </td>
            <td>
                <div class="display-field">
                : <%=Membership.GetUser().Email %>
            </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="display-label"><%: Html.LabelFor(model => model.UserInfo.address) %></div>
            </td>
            <td>
                <div class="display-field">
                : <%: Html.DisplayFor(model => model.UserInfo.address) %>
            </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="display-label"><%: Html.LabelFor(model => model.UserInfo.city) %></div>
            </td>
            <td>
                <div class="display-field">
                : <%: Html.DisplayFor(model => model.UserInfo.city) %>
            </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="display-label"><%: Html.LabelFor(model => model.UserInfo.state) %></div>
            </td>
            <td>
                <div class="display-field">
                : <%: Html.DisplayFor(model => model.UserInfo.state) %>
            </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="display-label"><%: Html.LabelFor(model => model.UserInfo.telephone) %></div>
            </td>
            <td>
                <div class="display-field">
                : <%: Html.DisplayFor(model => model.UserInfo.telephone) %>
            </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="display-label"><%: Html.LabelFor(model => model.UserInfo.mobile) %></div>
            </td>
            <td>
                <div class="display-field">
                : <%: Html.DisplayFor(model => model.UserInfo.mobile) %>
            </div>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="color:black;">
                <table border="1" class="display" id="example" bordercolor="#CEE6F4">
                    <tr>
                        <th>Item</th>
                        <th>Preview</th>
                        <th>Book Name</th>
                        <th>Auther</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>Amount</th>
                    </tr>
                    <% foreach (var item in Model.OrderDetails) { %>
                    <tr>
                        <td width="3%"><%= item.order_item_id %></td>
                        <td align="center" style="width:65px; height:75px;">
                            <img
                                src="../../images/<%: Html.DisplayFor(modelItem => item.book.photo) %>"
                                alt="<%: Html.DisplayFor(modelItem => item.book.photo) %>"
                                style="box-shadow: 4px 4px 2px #888888; width: 60px; height: 70px;" />
                        </td>
                        <td width="30%">
                            <a href="<%=Url.Action("Details","Books", new{id = item.book_id}) %>">
                            <%: Html.DisplayFor(modelItem => item.book.book_name) %>
                                </a>
                        </td>
                        <td width="20%">
                            <%: Html.DisplayFor(modelItem => item.book.author) %>
                        </td>
                        <td align="right">
                            ₹ <%: Html.DisplayFor(modelItem => item.book.price) %>
                        </td>
                        <td align="right">
                            <%= (int)item.qty%>
                        </td>
                        <td align="right" width="15%">
                            ₹ <%=item.subtotal %>
                        </td>
                    </tr>
                <% } %>
                    <tr>
                        <td colspan="5" align="right">
                            <strong>Total</strong>
                        </td>
                        <td align="right">
                            <strong><%=Model.OrderDetails.Sum(item => item.qty) %></strong>
                        </td>
                        <td align="right">
                            <strong>₹ <%=Model.total %></strong>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3">
                By clicking on 'Order' you are confirming that you have read, understood, and accept the Terms of Use and the Privacy Policy.
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                
                <%: Html.ActionLink("OrderMaster","PlaceOrder", Model %>
                <a href="<%=Url.Action("Index","Cart") %>">Back to Cart</a>
            </td>
        </tr>
    </table>
</fieldset>

</asp:Content>
