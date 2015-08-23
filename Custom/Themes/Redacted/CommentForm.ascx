<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.CommentFormBase" %>
<%@ Import Namespace="BlogEngine.Core" %>
<div class="comment-form well-global">
    <div class="well-global-title clearfix">
        <h3 class="pull-left" id="addcomment"><%=Resources.labels.addComment %></h3>
        <% if (BlogSettings.Instance.ShowLivePreview)
           { %>
        <div id="commentMenu" class="btn-group pull-right comment-menu">
            <a class="btn-1 btn btn-default btn-sm active">
                <span style="display: block; height: 100%;" id="compose" class="selected" onclick="return BlogEngine.composeComment()"><%=Resources.labels.comment%></span>
            </a>
            <a class="btn-2 btn btn-default btn-sm">
                <span style="display: block; height: 100%;" id="preview" onclick="return BlogEngine.showCommentPreview()"><%=Resources.labels.livePreview%></span>
            </a>
        </div>
        <% } %>
    </div>
    <div class="form-group">
        <label for="txtName" class="control-label"><%=Resources.labels.name %> *</label>
        <input type="text" class="form-control" name="txtName" id="txtName" />

    </div>
    <div class="form-group">
        <label for="txtEmail" class="control-label"><%=Resources.labels.email %> *</label>
        <input type="text" class="form-control" id="txtEmail" />
        <span id="gravatarmsg"></span>
    </div>
    <% if (BlogSettings.Instance.EnableWebsiteInComments)
       { %>
    <div class="form-group">
        <label for="txtWebsite" class="control-label"><%=Resources.labels.website%></label>
        <input type="text" class="form-control" id="txtWebsite" />
    </div>
    <% } %>
    <div class="form-group" id="commentCompose">
        <label for="txtContent" class="control-label"><%=Resources.labels.comment%> *</label>
        <textarea class="form-control" id="txtContent" cols="50" rows="6" name="txtContent"></textarea>
    </div>
    <% if (BlogSettings.Instance.ShowLivePreview)
       { %>
    <div class="form-group preview-box">
        <label class="control-label" style="height: auto;"><%=Resources.labels.previewComment %></label>
        <div id="commentPreview" class="form-control comment-preview">
            <img src="<%=Utils.RelativeWebRoot %>pics/ajax-loader.gif" style="display: none" alt="Loading" />
        </div>
    </div>
    <script>
        // :)
        $(".preview-box").hide();
        $(".btn-1").click(function () {
            $(".btn-2").removeClass("active");
            $(this).addClass("active");
            $(".preview-box").hide();
        });
        $(".btn-2").click(function () {
            $(".btn-1").removeClass("active");
            $(this).addClass("active");
            $(".preview-box").show();
        });
    </script>
    <% } %>
    <div class="clearfix">
        <label class="pull-left">
            <input type="checkbox" id="cbNotify" class="cmnt-frm-notify" />
            <%=Resources.labels.notifyOnNewComments %></label>
        <input type="button" id="btnSaveAjax" value="<%=Resources.labels.saveComment %>" class="btn btn-primary pull-right" onclick="return BlogEngine.validateAndSubmitCommentForm()" />
    </div>
</div>
