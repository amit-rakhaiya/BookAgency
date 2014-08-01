<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="PagedList.IPagedList<BookAgency.Models.book>>" %>
<%@ Import namespace="PagedList" %>
<%@ Import namespace="PagedList.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>New Arrivals</h2>

<table border="0" width="100%">
    
<% int i = 0;
    foreach (var item in Model) 
    {
        if (i % 3 == 0)
        {
            Response.Write("<tr>");
        }
        i++; %>
        <td>
            <img src="../images/<%: Html.DisplayFor(modelItem => item.photo) %>"  width="140" height="160" />
        </td>
    <%
        if (i % 3 == 0)
        {
            Response.Write("</tr>");
            i = 0;
        } %>
    
<% } %>

</table>
<%:
    Html.PagedListPager(Model, page => Url.Action("Index", new { page }))
     %>

</asp:Content>
