
CREATE TABLE [be_BlogRollItems] (
  [BlogRollRowId] int NOT NULL  IDENTITY (7,1)
, [BlogId] uniqueidentifier NOT NULL
, [BlogRollId] uniqueidentifier NOT NULL
, [Title] nvarchar(255) NOT NULL DEFAULT ''
, [Description] nvarchar(255) NULL DEFAULT ''
, [BlogUrl] nvarchar(255) NOT NULL DEFAULT ''
, [FeedUrl] nvarchar(255) NULL DEFAULT ''
, [Xfn] nvarchar(255) NULL DEFAULT ''
, [SortIndex] int NOT NULL
);
GO
CREATE TABLE [be_Blogs] (
  [BlogRowId] int NOT NULL  IDENTITY (2,1)
, [BlogId] uniqueidentifier NOT NULL
, [BlogName] nvarchar(255) NOT NULL
, [Hostname] nvarchar(255) NOT NULL
, [IsAnyTextBeforeHostnameAccepted] bit NOT NULL
, [StorageContainerName] nvarchar(255) NOT NULL
, [VirtualPath] nvarchar(255) NOT NULL
, [IsPrimary] bit NOT NULL
, [IsActive] bit NOT NULL
);
GO
CREATE TABLE [be_Categories] (
  [CategoryRowID] int NOT NULL  IDENTITY (2,1)
, [BlogID] uniqueidentifier NOT NULL
, [CategoryID] uniqueidentifier NOT NULL DEFAULT newid()
, [CategoryName] nvarchar(50) NULL DEFAULT ''
, [Description] nvarchar(200) NULL DEFAULT ''
, [ParentID] uniqueidentifier NULL
);
GO
CREATE TABLE [be_DataStoreSettings] (
  [DataStoreSettingRowId] int NOT NULL  IDENTITY (2,1)
, [BlogId] uniqueidentifier NOT NULL
, [ExtensionType] nvarchar(50) NOT NULL DEFAULT ''
, [ExtensionId] nvarchar(100) NOT NULL DEFAULT ''
, [Settings] ntext NOT NULL DEFAULT ''
);
GO
CREATE TABLE [be_Pages] (
  [PageRowID] int NOT NULL  IDENTITY (1,1)
, [BlogID] uniqueidentifier NOT NULL
, [PageID] uniqueidentifier NOT NULL DEFAULT newid()
, [Title] nvarchar(255) NULL DEFAULT ''
, [Description] ntext NULL DEFAULT ''
, [PageContent] ntext NULL DEFAULT ''
, [Keywords] ntext NULL DEFAULT ''
, [DateCreated] datetime NULL
, [DateModified] datetime NULL
, [IsPublished] bit NULL
, [IsFrontPage] bit NULL
, [Parent] uniqueidentifier NULL
, [ShowInList] bit NULL
, [Slug] nvarchar(255) NULL DEFAULT ''
, [IsDeleted] bit NOT NULL DEFAULT 0
);
GO
CREATE TABLE [be_PingService] (
  [PingServiceID] int NOT NULL  IDENTITY (9,1)
, [BlogID] uniqueidentifier NOT NULL
, [Link] nvarchar(255) NULL DEFAULT ''
);
GO
CREATE TABLE [be_PostCategory] (
  [PostCategoryID] int NOT NULL  IDENTITY (2,1)
, [BlogID] uniqueidentifier NOT NULL
, [PostID] uniqueidentifier NOT NULL
, [CategoryID] uniqueidentifier NOT NULL
);
GO
CREATE TABLE [be_PostComment] (
  [PostCommentRowID] int NOT NULL  IDENTITY (1,1)
, [BlogID] uniqueidentifier NOT NULL
, [PostCommentID] uniqueidentifier NOT NULL DEFAULT newid()
, [PostID] uniqueidentifier NOT NULL
, [ParentCommentID] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000'
, [CommentDate] datetime NOT NULL
, [Author] nvarchar(255) NULL DEFAULT ''
, [Email] nvarchar(255) NULL DEFAULT ''
, [Website] nvarchar(255) NULL DEFAULT ''
, [Comment] ntext NULL DEFAULT ''
, [Country] nvarchar(255) NULL DEFAULT ''
, [Ip] nvarchar(50) NULL DEFAULT ''
, [IsApproved] bit NULL
, [ModeratedBy] nvarchar(100) NULL DEFAULT ''
, [Avatar] nvarchar(255) NULL DEFAULT ''
, [IsSpam] bit NOT NULL DEFAULT 0
, [IsDeleted] bit NOT NULL DEFAULT 0
);
GO
CREATE TABLE [be_PostNotify] (
  [PostNotifyID] int NOT NULL  IDENTITY (1,1)
, [BlogID] uniqueidentifier NOT NULL
, [PostID] uniqueidentifier NOT NULL
, [NotifyAddress] nvarchar(255) NULL DEFAULT ''
);
GO
CREATE TABLE [be_Posts] (
  [PostRowID] int NOT NULL  IDENTITY (2,1)
, [BlogID] uniqueidentifier NOT NULL
, [PostID] uniqueidentifier NOT NULL DEFAULT newid()
, [Title] nvarchar(255) NULL DEFAULT ''
, [Description] ntext NULL DEFAULT ''
, [PostContent] ntext NULL DEFAULT ''
, [DateCreated] datetime NULL
, [DateModified] datetime NULL
, [Author] nvarchar(50) NULL DEFAULT ''
, [IsPublished] bit NULL
, [IsCommentEnabled] bit NULL
, [Raters] int NULL
, [Rating] real NULL
, [Slug] nvarchar(255) NULL DEFAULT ''
, [IsDeleted] bit NOT NULL DEFAULT 0
);
GO
CREATE TABLE [be_PostTag] (
  [PostTagID] int NOT NULL  IDENTITY (3,1)
, [BlogID] uniqueidentifier NOT NULL
, [PostID] uniqueidentifier NOT NULL
, [Tag] nvarchar(50) NULL DEFAULT ''
);
GO
CREATE TABLE [be_Profiles] (
  [ProfileID] int NOT NULL  IDENTITY (1,1)
, [BlogID] uniqueidentifier NOT NULL
, [UserName] nvarchar(100) NULL DEFAULT ''
, [SettingName] nvarchar(200) NULL DEFAULT ''
, [SettingValue] ntext NULL DEFAULT ''
);
GO
CREATE TABLE [be_Referrers] (
  [ReferrerRowId] int NOT NULL  IDENTITY (1,1)
, [BlogId] uniqueidentifier NOT NULL
, [ReferrerId] uniqueidentifier NOT NULL
, [ReferralDay] datetime NOT NULL DEFAULT getdate()
, [ReferrerUrl] nvarchar(255) NOT NULL DEFAULT ''
, [ReferralCount] int NOT NULL
, [Url] nvarchar(255) NULL DEFAULT ''
, [IsSpam] bit NULL
);
GO
CREATE TABLE [be_RightRoles] (
  [RightRoleRowId] int NOT NULL  IDENTITY (1,1)
, [BlogId] uniqueidentifier NOT NULL
, [RightName] nvarchar(100) NOT NULL DEFAULT ''
, [Role] nvarchar(100) NOT NULL DEFAULT ''
);
GO
CREATE TABLE [be_Rights] (
  [RightRowId] int NOT NULL  IDENTITY (1,1)
, [BlogId] uniqueidentifier NOT NULL
, [RightName] nvarchar(100) NOT NULL DEFAULT ''
);
GO
CREATE TABLE [be_Roles] (
  [RoleID] int NOT NULL  IDENTITY (3,1)
, [BlogID] uniqueidentifier NOT NULL
, [Role] nvarchar(100) NOT NULL DEFAULT ''
);
GO
CREATE TABLE [be_Settings] (
  [SettingRowId] int NOT NULL  IDENTITY (63,1)
, [BlogId] uniqueidentifier NOT NULL
, [SettingName] nvarchar(50) NOT NULL DEFAULT ''
, [SettingValue] ntext NULL DEFAULT ''
);
GO
CREATE TABLE [be_StopWords] (
  [StopWordRowId] int NOT NULL  IDENTITY (109,1)
, [BlogId] uniqueidentifier NOT NULL
, [StopWord] nvarchar(50) NOT NULL DEFAULT ''
);
GO
CREATE TABLE [be_UserRoles] (
  [UserRoleID] int NOT NULL  IDENTITY (2,1)
, [BlogID] uniqueidentifier NOT NULL
, [UserName] nvarchar(100) NOT NULL
, [Role] nvarchar(100) NOT NULL
);
GO
CREATE TABLE [be_Users] (
  [UserID] int NOT NULL  IDENTITY (2,1)
, [BlogID] uniqueidentifier NOT NULL
, [UserName] nvarchar(100) NOT NULL DEFAULT ''
, [Password] nvarchar(255) NOT NULL DEFAULT ''
, [LastLoginTime] datetime NULL
, [EmailAddress] nvarchar(100) NULL DEFAULT ''
);
GO
SET IDENTITY_INSERT [be_BlogRollItems] ON;
GO
INSERT INTO [be_BlogRollItems] ([BlogRollRowId],[BlogId],[BlogRollId],[Title],[Description],[BlogUrl],[FeedUrl],[Xfn],[SortIndex]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c','25e4d8da-3278-4e58-b0bf-932496dabc96',N'Mads Kristensen',N'Full featured simplicity in ASP.NET and C#',N'http://madskristensen.net',N'http://feeds.feedburner.com/netslave',N'contact',0);
GO
INSERT INTO [be_BlogRollItems] ([BlogRollRowId],[BlogId],[BlogRollId],[Title],[Description],[BlogUrl],[FeedUrl],[Xfn],[SortIndex]) VALUES (2,'27604f05-86ad-47ef-9e05-950bb762570c','ccc817ef-e760-482b-b82f-a6854663110f',N'Al Nyveldt',N'Adventures in Code and Other Stories',N'http://www.nyveldt.com/blog/',N'http://feeds.feedburner.com/razorant',N'contact',1);
GO
INSERT INTO [be_BlogRollItems] ([BlogRollRowId],[BlogId],[BlogRollId],[Title],[Description],[BlogUrl],[FeedUrl],[Xfn],[SortIndex]) VALUES (3,'27604f05-86ad-47ef-9e05-950bb762570c','dcdaa78b-0b77-4691-99f0-1bb6418945a1',N'Ruslan Tur',N'.NET and Open Source: better together',N'http://rtur.net/blog/',N'http://feeds.feedburner.com/rtur',N'contact',2);
GO
INSERT INTO [be_BlogRollItems] ([BlogRollRowId],[BlogId],[BlogRollId],[Title],[Description],[BlogUrl],[FeedUrl],[Xfn],[SortIndex]) VALUES (4,'27604f05-86ad-47ef-9e05-950bb762570c','8a846489-b69e-4fde-b2b2-53bc6104a6fa',N'John Dyer',N'Technology and web development in ASP.NET, Flash, and JavaScript',N'http://johndyer.name/',N'http://johndyer.name/syndication.axd',N'contact',3);
GO
INSERT INTO [be_BlogRollItems] ([BlogRollRowId],[BlogId],[BlogRollId],[Title],[Description],[BlogUrl],[FeedUrl],[Xfn],[SortIndex]) VALUES (5,'27604f05-86ad-47ef-9e05-950bb762570c','7f906880-4316-47f1-a934-1a912fc02f8b',N'Russell van der Walt',N'an adventure in web technologies',N'http://blog.ruski.co.za/',N'http://feeds.feedburner.com/rusvdw',N'contact',4);
GO
INSERT INTO [be_BlogRollItems] ([BlogRollRowId],[BlogId],[BlogRollId],[Title],[Description],[BlogUrl],[FeedUrl],[Xfn],[SortIndex]) VALUES (6,'27604f05-86ad-47ef-9e05-950bb762570c','890f00e5-3a86-4cba-b85b-104063964a87',N'Ben Amada',N'adventures in application development',N'http://allben.net/',N'http://feeds.feedburner.com/allben',N'contact',5);
GO
SET IDENTITY_INSERT [be_BlogRollItems] OFF;
GO
SET IDENTITY_INSERT [be_Blogs] ON;
GO
INSERT INTO [be_Blogs] ([BlogRowId],[BlogId],[BlogName],[Hostname],[IsAnyTextBeforeHostnameAccepted],[StorageContainerName],[VirtualPath],[IsPrimary],[IsActive]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c',N'Primary',N'',0,N'',N'~/',1,1);
GO
SET IDENTITY_INSERT [be_Blogs] OFF;
GO
SET IDENTITY_INSERT [be_Categories] ON;
GO
INSERT INTO [be_Categories] ([CategoryRowID],[BlogID],[CategoryID],[CategoryName],[Description],[ParentID]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c','05366547-5c8e-4643-ad94-377d3f809ab8',N'General',N'',null);
GO
SET IDENTITY_INSERT [be_Categories] OFF;
GO
SET IDENTITY_INSERT [be_DataStoreSettings] ON;
GO
INSERT INTO [be_DataStoreSettings] ([DataStoreSettingRowId],[BlogId],[ExtensionType],[ExtensionId],[Settings]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c',N'1',N'be_WIDGET_ZONE',N'<?xml version="1.0" encoding="utf-16"?>
<WidgetData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Settings>&lt;widgets&gt;&lt;widget id="d9ada63d-3462-4c72-908e-9d35f0acce40" title="TextBox" showTitle="True"&gt;TextBox&lt;/widget&gt;&lt;widget id="19baa5f6-49d4-4828-8f7f-018535c35f94" title="Administration" showTitle="True"&gt;Administration&lt;/widget&gt;&lt;widget id="d81c5ae3-e57e-4374-a539-5cdee45e639f" title="Search" showTitle="True"&gt;Search&lt;/widget&gt;&lt;widget id="77142800-6dff-4016-99ca-69b5c5ebac93" title="Tag cloud" showTitle="True"&gt;Tag cloud&lt;/widget&gt;&lt;widget id="4ce68ae7-c0c8-4bf8-b50f-a67b582b0d2e" title="RecentPosts" showTitle="True"&gt;RecentPosts&lt;/widget&gt;&lt;/widgets&gt;</Settings>
</WidgetData>');
GO
SET IDENTITY_INSERT [be_DataStoreSettings] OFF;
GO
SET IDENTITY_INSERT [be_PingService] ON;
GO
INSERT INTO [be_PingService] ([PingServiceID],[BlogID],[Link]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c',N'http://rpc.technorati.com/rpc/ping');
GO
INSERT INTO [be_PingService] ([PingServiceID],[BlogID],[Link]) VALUES (2,'27604f05-86ad-47ef-9e05-950bb762570c',N'http://rpc.pingomatic.com/rpc2');
GO
INSERT INTO [be_PingService] ([PingServiceID],[BlogID],[Link]) VALUES (3,'27604f05-86ad-47ef-9e05-950bb762570c',N'http://ping.feedburner.com');
GO
INSERT INTO [be_PingService] ([PingServiceID],[BlogID],[Link]) VALUES (4,'27604f05-86ad-47ef-9e05-950bb762570c',N'http://www.bloglines.com/ping');
GO
INSERT INTO [be_PingService] ([PingServiceID],[BlogID],[Link]) VALUES (5,'27604f05-86ad-47ef-9e05-950bb762570c',N'http://services.newsgator.com/ngws/xmlrpcping.aspx');
GO
INSERT INTO [be_PingService] ([PingServiceID],[BlogID],[Link]) VALUES (6,'27604f05-86ad-47ef-9e05-950bb762570c',N'http://api.my.yahoo.com/rpc2 ');
GO
INSERT INTO [be_PingService] ([PingServiceID],[BlogID],[Link]) VALUES (7,'27604f05-86ad-47ef-9e05-950bb762570c',N'http://blogsearch.google.com/ping/RPC2');
GO
INSERT INTO [be_PingService] ([PingServiceID],[BlogID],[Link]) VALUES (8,'27604f05-86ad-47ef-9e05-950bb762570c',N'http://rpc.pingthesemanticweb.com/');
GO
SET IDENTITY_INSERT [be_PingService] OFF;
GO
SET IDENTITY_INSERT [be_PostCategory] ON;
GO
INSERT INTO [be_PostCategory] ([PostCategoryID],[BlogID],[PostID],[CategoryID]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c','10ecdf6f-2cf7-447c-8ff7-223833550716','05366547-5c8e-4643-ad94-377d3f809ab8');
GO
SET IDENTITY_INSERT [be_PostCategory] OFF;
GO
SET IDENTITY_INSERT [be_Posts] ON;
GO
INSERT INTO [be_Posts] ([PostRowID],[BlogID],[PostID],[Title],[Description],[PostContent],[DateCreated],[DateModified],[Author],[IsPublished],[IsCommentEnabled],[Raters],[Rating],[Slug],[IsDeleted]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c','10ecdf6f-2cf7-447c-8ff7-223833550716',N'Welcome to BlogEngine.NET 2.5 using Microsoft SQL CE',N'The description is used as the meta description as well as shown in the related posts. It is recommended that you write a description, but not mandatory',N'<p>If you see this post it means that BlogEngine.NET 2.5 is running and the hard part of creating your own blog is done. There is only a few things left to do.</p>
<h2>Write Permissions</h2>
<p>To be able to log in to the blog and writing posts, you need to enable write permissions on the App_Data folder. If you&rsquo;re blog is hosted at a hosting provider, you can either log into your account&rsquo;s admin page or call the support. You need write permissions on the App_Data folder because all posts, comments, and blog attachments are saved as XML files and placed in the App_Data folder.&nbsp;</p>
<p>If you wish to use a database to to store your blog data, we still encourage you to enable this write access for an images you may wish to store for your blog posts.&nbsp; If you are interested in using Microsoft SQL Server, MySQL, SQL CE, or other databases, please see the <a href="http://blogengine.codeplex.com/documentation">BlogEngine wiki</a> to get started.</p>
<h2>Security</h2>
<p>When you''ve got write permissions to the App_Data folder, you need to change the username and password. Find the sign-in link located either at the bottom or top of the page depending on your current theme and click it. Now enter "admin" in both the username and password fields and click the button. You will now see an admin menu appear. It has a link to the "Users" admin page. From there you can change the username and password.&nbsp; Passwords are hashed by default so if you lose your password, please see the <a href="http://blogengine.codeplex.com/documentation">BlogEngine wiki</a> for information on recovery.</p>
<h2>Configuration and Profile</h2>
<p>Now that you have your blog secured, take a look through the settings and give your new blog a title.&nbsp; BlogEngine.NET 2.5 is set up to take full advantage of of many semantic formats and technologies such as FOAF, SIOC and APML. It means that the content stored in your BlogEngine.NET installation will be fully portable and auto-discoverable.&nbsp; Be sure to fill in your author profile to take better advantage of this.</p>
<h2>Themes, Widgets &amp; Extensions</h2>
<p>One last thing to consider is customizing the look of your blog.&nbsp; We have a few themes available right out of the box including two fully setup to use our new widget framework.&nbsp; The widget framework allows drop and drag placement on your side bar as well as editing and configuration right in the widget while you are logged in.&nbsp; Extensions allow you to extend and customize the behaivor of your blog.&nbsp; Be sure to check the <a href="http://dnbegallery.org/">BlogEngine.NET Gallery</a> at <a href="http://dnbegallery.org/">dnbegallery.org</a> as the go-to location for downloading widgets, themes and extensions.</p>
<h2>On the web</h2>
<p>You can find BlogEngine.NET on the <a href="http://www.dotnetblogengine.net">official website</a>. Here you''ll find tutorials, documentation, tips and tricks and much more. The ongoing development of BlogEngine.NET can be followed at <a href="http://blogengine.codeplex.com/">CodePlex</a> where the daily builds will be published for anyone to download.&nbsp; Again, new themes, widgets and extensions can be downloaded at the <a href="http://dnbegallery.org/">BlogEngine.NET gallery</a>.</p>
<p>Good luck and happy writing.</p>
<p>The BlogEngine.NET team</p>',{ts '2011-06-11 10:00:00.000'},null,N'admin',1,1,null,null,N'',0);
GO
SET IDENTITY_INSERT [be_Posts] OFF;
GO
SET IDENTITY_INSERT [be_PostTag] ON;
GO
INSERT INTO [be_PostTag] ([PostTagID],[BlogID],[PostID],[Tag]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c','10ecdf6f-2cf7-447c-8ff7-223833550716',N'blog');
GO
INSERT INTO [be_PostTag] ([PostTagID],[BlogID],[PostID],[Tag]) VALUES (2,'27604f05-86ad-47ef-9e05-950bb762570c','10ecdf6f-2cf7-447c-8ff7-223833550716',N'welcome');
GO
SET IDENTITY_INSERT [be_PostTag] OFF;
GO
SET IDENTITY_INSERT [be_Roles] ON;
GO
INSERT INTO [be_Roles] ([RoleID],[BlogID],[Role]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c',N'Administrators');
GO
INSERT INTO [be_Roles] ([RoleID],[BlogID],[Role]) VALUES (2,'27604f05-86ad-47ef-9e05-950bb762570c',N'Editors');
GO
SET IDENTITY_INSERT [be_Roles] OFF;
GO
SET IDENTITY_INSERT [be_Settings] ON;
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c',N'administratorrole',N'Administrators');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (2,'27604f05-86ad-47ef-9e05-950bb762570c',N'alternatefeedurl',N'');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (3,'27604f05-86ad-47ef-9e05-950bb762570c',N'authorname',N'My name');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (4,'27604f05-86ad-47ef-9e05-950bb762570c',N'avatar',N'combine');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (5,'27604f05-86ad-47ef-9e05-950bb762570c',N'blogrollmaxlength',N'23');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (6,'27604f05-86ad-47ef-9e05-950bb762570c',N'blogrollupdateminutes',N'60');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (7,'27604f05-86ad-47ef-9e05-950bb762570c',N'blogrollvisibleposts',N'3');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (8,'27604f05-86ad-47ef-9e05-950bb762570c',N'contactformmessage',N'<p>I will answer the mail as soon as I can.</p>');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (9,'27604f05-86ad-47ef-9e05-950bb762570c',N'contactthankmessage',N'<h1>Thank you</h1><p>The message was sent.</p>');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (10,'27604f05-86ad-47ef-9e05-950bb762570c',N'culture',N'Auto');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (11,'27604f05-86ad-47ef-9e05-950bb762570c',N'dayscommentsareenabled',N'0');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (12,'27604f05-86ad-47ef-9e05-950bb762570c',N'description',N'Short description of the blog');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (13,'27604f05-86ad-47ef-9e05-950bb762570c',N'displaycommentsonrecentposts',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (14,'27604f05-86ad-47ef-9e05-950bb762570c',N'displayratingsonrecentposts',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (15,'27604f05-86ad-47ef-9e05-950bb762570c',N'email',N'user@example.com');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (16,'27604f05-86ad-47ef-9e05-950bb762570c',N'emailsubjectprefix',N'Weblog');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (17,'27604f05-86ad-47ef-9e05-950bb762570c',N'enablecommentsearch',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (18,'27604f05-86ad-47ef-9e05-950bb762570c',N'enablecommentsmoderation',N'False');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (19,'27604f05-86ad-47ef-9e05-950bb762570c',N'enablecontactattachments',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (20,'27604f05-86ad-47ef-9e05-950bb762570c',N'enablecountryincomments',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (21,'27604f05-86ad-47ef-9e05-950bb762570c',N'enablehttpcompression',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (22,'27604f05-86ad-47ef-9e05-950bb762570c',N'enableopensearch',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (23,'27604f05-86ad-47ef-9e05-950bb762570c',N'enablepingbackreceive',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (24,'27604f05-86ad-47ef-9e05-950bb762570c',N'enablepingbacksend',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (25,'27604f05-86ad-47ef-9e05-950bb762570c',N'enablerating',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (26,'27604f05-86ad-47ef-9e05-950bb762570c',N'enablereferrertracking',N'False');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (27,'27604f05-86ad-47ef-9e05-950bb762570c',N'enablerelatedposts',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (28,'27604f05-86ad-47ef-9e05-950bb762570c',N'enablessl',N'False');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (29,'27604f05-86ad-47ef-9e05-950bb762570c',N'enabletrackbackreceive',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (30,'27604f05-86ad-47ef-9e05-950bb762570c',N'enabletrackbacksend',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (31,'27604f05-86ad-47ef-9e05-950bb762570c',N'endorsement',N'http://www.dotnetblogengine.net/syndication.axd');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (32,'27604f05-86ad-47ef-9e05-950bb762570c',N'fileextension',N'.aspx');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (33,'27604f05-86ad-47ef-9e05-950bb762570c',N'geocodinglatitude',N'0');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (34,'27604f05-86ad-47ef-9e05-950bb762570c',N'geocodinglongitude',N'0');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (35,'27604f05-86ad-47ef-9e05-950bb762570c',N'handlewwwsubdomain',N'');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (36,'27604f05-86ad-47ef-9e05-950bb762570c',N'iscocommentenabled',N'False');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (37,'27604f05-86ad-47ef-9e05-950bb762570c',N'iscommentsenabled',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (38,'27604f05-86ad-47ef-9e05-950bb762570c',N'language',N'en-GB');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (39,'27604f05-86ad-47ef-9e05-950bb762570c',N'mobiletheme',N'Mobile');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (40,'27604f05-86ad-47ef-9e05-950bb762570c',N'name',N'[REDACTED] GAMES');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (41,'27604f05-86ad-47ef-9e05-950bb762570c',N'numberofrecentcomments',N'10');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (42,'27604f05-86ad-47ef-9e05-950bb762570c',N'numberofrecentposts',N'10');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (43,'27604f05-86ad-47ef-9e05-950bb762570c',N'postsperfeed',N'10');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (44,'27604f05-86ad-47ef-9e05-950bb762570c',N'postsperpage',N'10');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (45,'27604f05-86ad-47ef-9e05-950bb762570c',N'removewhitespaceinstylesheets',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (46,'27604f05-86ad-47ef-9e05-950bb762570c',N'searchbuttontext',N'Search');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (47,'27604f05-86ad-47ef-9e05-950bb762570c',N'searchcommentlabeltext',N'Include comments in search');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (48,'27604f05-86ad-47ef-9e05-950bb762570c',N'searchdefaulttext',N'Enter search term');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (49,'27604f05-86ad-47ef-9e05-950bb762570c',N'sendmailoncomment',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (50,'27604f05-86ad-47ef-9e05-950bb762570c',N'showdescriptioninpostlist',N'False');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (51,'27604f05-86ad-47ef-9e05-950bb762570c',N'showlivepreview',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (52,'27604f05-86ad-47ef-9e05-950bb762570c',N'showpostnavigation',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (53,'27604f05-86ad-47ef-9e05-950bb762570c',N'smtppassword',N'password');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (54,'27604f05-86ad-47ef-9e05-950bb762570c',N'smtpserver',N'mail.example.dk');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (55,'27604f05-86ad-47ef-9e05-950bb762570c',N'smtpserverport',N'25');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (56,'27604f05-86ad-47ef-9e05-950bb762570c',N'smtpusername',N'user@example.com');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (57,'27604f05-86ad-47ef-9e05-950bb762570c',N'storagelocation',N'~/App_Data/');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (58,'27604f05-86ad-47ef-9e05-950bb762570c',N'syndicationformat',N'Rss');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (59,'27604f05-86ad-47ef-9e05-950bb762570c',N'theme',N'Standard');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (60,'27604f05-86ad-47ef-9e05-950bb762570c',N'timestamppostlinks',N'True');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (61,'27604f05-86ad-47ef-9e05-950bb762570c',N'timezone',N'-5');
GO
INSERT INTO [be_Settings] ([SettingRowId],[BlogId],[SettingName],[SettingValue]) VALUES (62,'27604f05-86ad-47ef-9e05-950bb762570c',N'trackingscript',N'');
GO
SET IDENTITY_INSERT [be_Settings] OFF;
GO
SET IDENTITY_INSERT [be_StopWords] ON;
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c',N'a');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (2,'27604f05-86ad-47ef-9e05-950bb762570c',N'about');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (3,'27604f05-86ad-47ef-9e05-950bb762570c',N'actually');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (4,'27604f05-86ad-47ef-9e05-950bb762570c',N'add');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (5,'27604f05-86ad-47ef-9e05-950bb762570c',N'after');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (6,'27604f05-86ad-47ef-9e05-950bb762570c',N'all');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (7,'27604f05-86ad-47ef-9e05-950bb762570c',N'almost');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (8,'27604f05-86ad-47ef-9e05-950bb762570c',N'along');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (9,'27604f05-86ad-47ef-9e05-950bb762570c',N'also');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (10,'27604f05-86ad-47ef-9e05-950bb762570c',N'an');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (11,'27604f05-86ad-47ef-9e05-950bb762570c',N'and');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (12,'27604f05-86ad-47ef-9e05-950bb762570c',N'any');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (13,'27604f05-86ad-47ef-9e05-950bb762570c',N'are');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (14,'27604f05-86ad-47ef-9e05-950bb762570c',N'as');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (15,'27604f05-86ad-47ef-9e05-950bb762570c',N'at');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (16,'27604f05-86ad-47ef-9e05-950bb762570c',N'be');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (17,'27604f05-86ad-47ef-9e05-950bb762570c',N'both');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (18,'27604f05-86ad-47ef-9e05-950bb762570c',N'but');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (19,'27604f05-86ad-47ef-9e05-950bb762570c',N'by');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (20,'27604f05-86ad-47ef-9e05-950bb762570c',N'can');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (21,'27604f05-86ad-47ef-9e05-950bb762570c',N'cannot');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (22,'27604f05-86ad-47ef-9e05-950bb762570c',N'com');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (23,'27604f05-86ad-47ef-9e05-950bb762570c',N'could');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (24,'27604f05-86ad-47ef-9e05-950bb762570c',N'de');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (25,'27604f05-86ad-47ef-9e05-950bb762570c',N'do');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (26,'27604f05-86ad-47ef-9e05-950bb762570c',N'down');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (27,'27604f05-86ad-47ef-9e05-950bb762570c',N'each');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (28,'27604f05-86ad-47ef-9e05-950bb762570c',N'either');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (29,'27604f05-86ad-47ef-9e05-950bb762570c',N'en');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (30,'27604f05-86ad-47ef-9e05-950bb762570c',N'for');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (31,'27604f05-86ad-47ef-9e05-950bb762570c',N'from');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (32,'27604f05-86ad-47ef-9e05-950bb762570c',N'good');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (33,'27604f05-86ad-47ef-9e05-950bb762570c',N'has');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (34,'27604f05-86ad-47ef-9e05-950bb762570c',N'have');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (35,'27604f05-86ad-47ef-9e05-950bb762570c',N'he');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (36,'27604f05-86ad-47ef-9e05-950bb762570c',N'her');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (37,'27604f05-86ad-47ef-9e05-950bb762570c',N'here');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (38,'27604f05-86ad-47ef-9e05-950bb762570c',N'hers');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (39,'27604f05-86ad-47ef-9e05-950bb762570c',N'his');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (40,'27604f05-86ad-47ef-9e05-950bb762570c',N'how');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (41,'27604f05-86ad-47ef-9e05-950bb762570c',N'i');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (42,'27604f05-86ad-47ef-9e05-950bb762570c',N'if');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (43,'27604f05-86ad-47ef-9e05-950bb762570c',N'in');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (44,'27604f05-86ad-47ef-9e05-950bb762570c',N'into');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (45,'27604f05-86ad-47ef-9e05-950bb762570c',N'is');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (46,'27604f05-86ad-47ef-9e05-950bb762570c',N'it');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (47,'27604f05-86ad-47ef-9e05-950bb762570c',N'its');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (48,'27604f05-86ad-47ef-9e05-950bb762570c',N'just');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (49,'27604f05-86ad-47ef-9e05-950bb762570c',N'la');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (50,'27604f05-86ad-47ef-9e05-950bb762570c',N'like');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (51,'27604f05-86ad-47ef-9e05-950bb762570c',N'long');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (52,'27604f05-86ad-47ef-9e05-950bb762570c',N'make');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (53,'27604f05-86ad-47ef-9e05-950bb762570c',N'me');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (54,'27604f05-86ad-47ef-9e05-950bb762570c',N'more');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (55,'27604f05-86ad-47ef-9e05-950bb762570c',N'much');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (56,'27604f05-86ad-47ef-9e05-950bb762570c',N'my');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (57,'27604f05-86ad-47ef-9e05-950bb762570c',N'need');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (58,'27604f05-86ad-47ef-9e05-950bb762570c',N'new');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (59,'27604f05-86ad-47ef-9e05-950bb762570c',N'now');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (60,'27604f05-86ad-47ef-9e05-950bb762570c',N'of');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (61,'27604f05-86ad-47ef-9e05-950bb762570c',N'off');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (62,'27604f05-86ad-47ef-9e05-950bb762570c',N'on');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (63,'27604f05-86ad-47ef-9e05-950bb762570c',N'once');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (64,'27604f05-86ad-47ef-9e05-950bb762570c',N'one');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (65,'27604f05-86ad-47ef-9e05-950bb762570c',N'ones');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (66,'27604f05-86ad-47ef-9e05-950bb762570c',N'only');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (67,'27604f05-86ad-47ef-9e05-950bb762570c',N'or');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (68,'27604f05-86ad-47ef-9e05-950bb762570c',N'our');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (69,'27604f05-86ad-47ef-9e05-950bb762570c',N'out');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (70,'27604f05-86ad-47ef-9e05-950bb762570c',N'over');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (71,'27604f05-86ad-47ef-9e05-950bb762570c',N'own');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (72,'27604f05-86ad-47ef-9e05-950bb762570c',N'really');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (73,'27604f05-86ad-47ef-9e05-950bb762570c',N'right');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (74,'27604f05-86ad-47ef-9e05-950bb762570c',N'same');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (75,'27604f05-86ad-47ef-9e05-950bb762570c',N'see');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (76,'27604f05-86ad-47ef-9e05-950bb762570c',N'she');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (77,'27604f05-86ad-47ef-9e05-950bb762570c',N'so');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (78,'27604f05-86ad-47ef-9e05-950bb762570c',N'some');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (79,'27604f05-86ad-47ef-9e05-950bb762570c',N'such');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (80,'27604f05-86ad-47ef-9e05-950bb762570c',N'take');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (81,'27604f05-86ad-47ef-9e05-950bb762570c',N'takes');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (82,'27604f05-86ad-47ef-9e05-950bb762570c',N'that');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (83,'27604f05-86ad-47ef-9e05-950bb762570c',N'the');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (84,'27604f05-86ad-47ef-9e05-950bb762570c',N'their');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (85,'27604f05-86ad-47ef-9e05-950bb762570c',N'these');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (86,'27604f05-86ad-47ef-9e05-950bb762570c',N'thing');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (87,'27604f05-86ad-47ef-9e05-950bb762570c',N'this');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (88,'27604f05-86ad-47ef-9e05-950bb762570c',N'to');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (89,'27604f05-86ad-47ef-9e05-950bb762570c',N'too');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (90,'27604f05-86ad-47ef-9e05-950bb762570c',N'took');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (91,'27604f05-86ad-47ef-9e05-950bb762570c',N'und');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (92,'27604f05-86ad-47ef-9e05-950bb762570c',N'up');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (93,'27604f05-86ad-47ef-9e05-950bb762570c',N'use');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (94,'27604f05-86ad-47ef-9e05-950bb762570c',N'used');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (95,'27604f05-86ad-47ef-9e05-950bb762570c',N'using');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (96,'27604f05-86ad-47ef-9e05-950bb762570c',N'very');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (97,'27604f05-86ad-47ef-9e05-950bb762570c',N'was');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (98,'27604f05-86ad-47ef-9e05-950bb762570c',N'we');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (99,'27604f05-86ad-47ef-9e05-950bb762570c',N'well');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (100,'27604f05-86ad-47ef-9e05-950bb762570c',N'what');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (101,'27604f05-86ad-47ef-9e05-950bb762570c',N'when');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (102,'27604f05-86ad-47ef-9e05-950bb762570c',N'where');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (103,'27604f05-86ad-47ef-9e05-950bb762570c',N'who');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (104,'27604f05-86ad-47ef-9e05-950bb762570c',N'will');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (105,'27604f05-86ad-47ef-9e05-950bb762570c',N'with');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (106,'27604f05-86ad-47ef-9e05-950bb762570c',N'www');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (107,'27604f05-86ad-47ef-9e05-950bb762570c',N'you');
GO
INSERT INTO [be_StopWords] ([StopWordRowId],[BlogId],[StopWord]) VALUES (108,'27604f05-86ad-47ef-9e05-950bb762570c',N'your');
GO
SET IDENTITY_INSERT [be_StopWords] OFF;
GO
SET IDENTITY_INSERT [be_UserRoles] ON;
GO
INSERT INTO [be_UserRoles] ([UserRoleID],[BlogID],[UserName],[Role]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c',N'Admin',N'Administrators');
GO
SET IDENTITY_INSERT [be_UserRoles] OFF;
GO
SET IDENTITY_INSERT [be_Users] ON;
GO
INSERT INTO [be_Users] ([UserID],[BlogID],[UserName],[Password],[LastLoginTime],[EmailAddress]) VALUES (1,'27604f05-86ad-47ef-9e05-950bb762570c',N'Admin',N'',{ts '2010-10-11 17:44:31.990'},N'email@example.com');
GO
SET IDENTITY_INSERT [be_Users] OFF;
GO
ALTER TABLE [be_BlogRollItems] ADD CONSTRAINT [PK_be_BlogRollItems_BlogRollRowId] PRIMARY KEY ([BlogRollRowId]);
GO
ALTER TABLE [be_Blogs] ADD CONSTRAINT [PK_be_Blogs_BlogRowId] PRIMARY KEY ([BlogRowId]);
GO
ALTER TABLE [be_Categories] ADD CONSTRAINT [PK_be_Categories_CategoryRowID] PRIMARY KEY ([CategoryRowID]);
GO
ALTER TABLE [be_DataStoreSettings] ADD CONSTRAINT [PK_be_DataStoreSettings_DataStoreSettingRowId] PRIMARY KEY ([DataStoreSettingRowId]);
GO
ALTER TABLE [be_Pages] ADD CONSTRAINT [PK_be_Pages_PageRowID] PRIMARY KEY ([PageRowID]);
GO
ALTER TABLE [be_PingService] ADD CONSTRAINT [PK_be_PingService_PingServiceID] PRIMARY KEY ([PingServiceID]);
GO
ALTER TABLE [be_PostCategory] ADD CONSTRAINT [PK_be_PostCategory_PostCategoryID] PRIMARY KEY ([PostCategoryID]);
GO
ALTER TABLE [be_PostComment] ADD CONSTRAINT [PK_be_PostComment_PostCommentRowID] PRIMARY KEY ([PostCommentRowID]);
GO
ALTER TABLE [be_PostNotify] ADD CONSTRAINT [PK_be_PostNotify_PostNotifyID] PRIMARY KEY ([PostNotifyID]);
GO
ALTER TABLE [be_Posts] ADD CONSTRAINT [PK_be_Posts_PostRowID] PRIMARY KEY ([PostRowID]);
GO
ALTER TABLE [be_PostTag] ADD CONSTRAINT [PK_be_PostTag_PostTagID] PRIMARY KEY ([PostTagID]);
GO
ALTER TABLE [be_Profiles] ADD CONSTRAINT [PK_be_Profiles_ProfileID] PRIMARY KEY ([ProfileID]);
GO
ALTER TABLE [be_Referrers] ADD CONSTRAINT [PK_be_Referrers_ReferrerRowId] PRIMARY KEY ([ReferrerRowId]);
GO
ALTER TABLE [be_RightRoles] ADD CONSTRAINT [PK_be_RightRoles_RightRoleRowId] PRIMARY KEY ([RightRoleRowId]);
GO
ALTER TABLE [be_Rights] ADD CONSTRAINT [PK_be_Rights_RightRowId] PRIMARY KEY ([RightRowId]);
GO
ALTER TABLE [be_Roles] ADD CONSTRAINT [PK_be_Roles_RoleID] PRIMARY KEY ([RoleID]);
GO
ALTER TABLE [be_Settings] ADD CONSTRAINT [PK_be_Settings_SettingRowId] PRIMARY KEY ([SettingRowId]);
GO
ALTER TABLE [be_StopWords] ADD CONSTRAINT [PK_be_StopWords_StopWordRowId] PRIMARY KEY ([StopWordRowId]);
GO
ALTER TABLE [be_UserRoles] ADD CONSTRAINT [PK_be_UserRoles_UserRoleID] PRIMARY KEY ([UserRoleID]);
GO
ALTER TABLE [be_Users] ADD CONSTRAINT [PK_be_Users_UserID] PRIMARY KEY ([UserID]);
GO
CREATE INDEX [idx_be_BlogRollItems_BlogId] ON [be_BlogRollItems] ([BlogId] ASC);
GO
CREATE UNIQUE INDEX [idx_be_Categories_BlogID_CategoryID] ON [be_Categories] ([BlogID] ASC,[CategoryID] ASC);
GO
CREATE INDEX [idx_be_DataStoreSettings_BlogId_ExtensionType_TypeID] ON [be_DataStoreSettings] ([BlogId] ASC,[ExtensionType] ASC,[ExtensionId] ASC);
GO
CREATE INDEX [idx_Pages_BlogId_PageId] ON [be_Pages] ([BlogID] ASC,[PageID] ASC);
GO
CREATE INDEX [idx_be_PingService_BlogId] ON [be_PingService] ([BlogID] ASC);
GO
CREATE INDEX [idx_be_PostCategory_BlogId_CategoryId] ON [be_PostCategory] ([BlogID] ASC,[CategoryID] ASC);
GO
CREATE INDEX [idx_be_PostCategory_BlogId_PostId] ON [be_PostCategory] ([BlogID] ASC,[PostID] ASC);
GO
CREATE INDEX [idx_be_PostComment_BlogId_PostId] ON [be_PostComment] ([BlogID] ASC,[PostID] ASC);
GO
CREATE INDEX [FK_PostID] ON [be_PostNotify] ([BlogID] ASC,[PostID] ASC);
GO
CREATE UNIQUE INDEX [be_Posts_BlogID_PostID] ON [be_Posts] ([BlogID] ASC,[PostID] ASC);
GO
CREATE INDEX [idx_be_PostTag_BlogId_PostId] ON [be_PostTag] ([BlogID] ASC,[PostID] ASC);
GO
CREATE INDEX [idx_be_Profiles_BlogId_UserName] ON [be_Profiles] ([BlogID] ASC,[UserName] ASC);
GO
CREATE INDEX [idx_be_Referrers_BlogId] ON [be_Referrers] ([BlogId] ASC);
GO
CREATE INDEX [idx_be_RightRoles_BlogId] ON [be_RightRoles] ([BlogId] ASC);
GO
CREATE INDEX [idx_be_Rights_BlogId] ON [be_Rights] ([BlogId] ASC);
GO
CREATE UNIQUE INDEX [idx_be_Roles_BlogID_Role] ON [be_Roles] ([BlogID] ASC,[Role] ASC);
GO
CREATE INDEX [idx_be_Settings_BlogId] ON [be_Settings] ([BlogId] ASC);
GO
CREATE INDEX [idx_be_StopWords_BlogId] ON [be_StopWords] ([BlogId] ASC);
GO
CREATE INDEX [idx_be_UserRoles_BlogId] ON [be_UserRoles] ([BlogID] ASC);
GO
CREATE INDEX [idx_be_Users_BlogId_UserName] ON [be_Users] ([BlogID] ASC,[UserName] ASC);
GO

