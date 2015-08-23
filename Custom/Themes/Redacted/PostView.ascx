<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<article class="post <% if (Location == BlogEngine.Core.ServingLocation.SinglePost) {%>post-single<%} %>" id="post<%=Index %>">
    <header class="post-header">
        <h2 class="post-title">
            <a href="<%=Post.RelativeOrAbsoluteLink %>"><%=Server.HtmlEncode(Post.Title) %></a>
        </h2>
        <div class="post-info text-uppercase">
            <span class="post-date"><i class="icon-date"></i><%=Post.DateCreated.ToString("d. MMMM yyyy") %></span>
            <span class="post-category"><i class="icon-category"></i><%=CategoryLinks(", ") %></span>
            <span><a rel="nofollow" class="post-comment-link" href="<%=Post.RelativeOrAbsoluteLink %>#comment"><i class="icon-comment"></i><%=Resources.labels.comment %> (<%=Post.ApprovedComments.Count %>)</a></span>
        </div>
    </header>
    <section class="post-body text">
        <asp:PlaceHolder ID="BodyContent" runat="server" />
    </section>
    <% if (Location == BlogEngine.Core.ServingLocation.SinglePost)
       {%>
    <footer class="post-footer">
        <div class="post-tags">
            <%=Resources.labels.tags %> : <%=TagLinks(", ") %>
        </div>
        <div class="post-rating">
            <%=Rating %>
        </div>
    </footer>
    <%} %>
    <%=AdminLinks %>
</article>
