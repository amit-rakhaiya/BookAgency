<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<BookAgency.Models.UserInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    User Account
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .UserAccoutTable {
        color: #888;
        text-shadow: 1px 1px 1px #FFF;
        margin-bottom: 15px;
    }

    .UserAccoutTable a {
        vertical-align: bottom;
        font-size: 12px;
        text-align: right;
        font-weight: bold;
    }
</style>
<h2>Welcome <%=HttpContext.Current.User.Identity.Name %></h2>

<table class="UserAccoutTable" border="0">
    <tr>
        <td style="padding-left:6px;"><img src="../../images/UserInfo.png" width="50" height="55"/></td>
        <td>
            <a href="<%=Url.Action("Details","User", new { id = (Guid)Membership.GetUser().ProviderUserKey}) %>">
                Personal Information
            </a>
        </td>
    </tr>
    <tr>
        <td><img src="../../images/order.png" width="60" height="60"/></td>
        <td>
            <a href="<%=Url.Action("Details","User", new { id = (Guid)Membership.GetUser().ProviderUserKey}) %>">
                Transaction Histroy 
            </a>
        </td>
    </tr>
    <tr>
        <td><img src="../../images/cart.jpg" width="60" height="60"/></td>
        <td>
            <a href="<%=Url.Action("Index","Cart") %>">
                Shopping Cart
            </a>
        </td>
    </tr>
    <tr>
        <td><img src="../../images/password.png" width="60" height="60"/></td>
        <td>
           <a href="<%=Url.Action("ChangePassword","Account", new { id = (Guid)Membership.GetUser().ProviderUserKey}) %>">
                Change Password
            </a>
        </td>
    </tr>
    <tr>
        <td><img src="../../images/delete_icon.png" width="60" height="50"/></td>
        <td>
           <a href="<%=Url.Action("Delete","User", new { id = (Guid)Membership.GetUser().ProviderUserKey}) %>">
                Remove Account
            </a>
        </td>
    </tr>
</table>

</asp:Content>
