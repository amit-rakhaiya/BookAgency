<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<BookAgency.Models.book>>" %>

<%@ Import Namespace="PagedList" %>
<%@ Import Namespace="PagedList.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Acty System
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="indexForm" runat="server">
        <div>
            <h3 style="border-bottom: solid 1px; border-top: solid 1px;">New Arrivals</h3>

            <table border="0" width="100%">

                <% 
                    int i = 0;
                    int cols = 4;
                    foreach (var item in Model)
                    {
                        if (i % cols == 0)
                        {
                            Response.Write("<tr>");
                        }
                        i++; %>
                <td>
                    <a href='<%: Url.Action("Details", "Books", new { id=item.id }) %>'>
                        <img src="../images/<%: Html.DisplayFor(modelItem => item.photo) %>" style="box-shadow: 5px 5px 3px #888888; width: 140px; height: 160px;" />
                    </a>
                </td>
                <%
                        if (i % cols == 0)
                        {
                            Response.Write("</tr>");
                            i = 0;
                        } %>

                <% } %>
            </table>
            <%:Html.PagedListPager(Model, Page => Url.Action("Index", new {Page}) ) %>
        </div>
    </form>
</asp:Content>
