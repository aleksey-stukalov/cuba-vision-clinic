USE [VisionClinic]
GO
/****** Object:  Table [dbo].[SEC_CONSTRAINT]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_CONSTRAINT](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[CODE] [varchar](255) NULL,
	[CHECK_TYPE] [varchar](50) NULL,
	[OPERATION_TYPE] [varchar](50) NULL,
	[ENTITY_NAME] [varchar](255) NOT NULL,
	[JOIN_CLAUSE] [varchar](500) NULL,
	[WHERE_CLAUSE] [varchar](1000) NULL,
	[GROOVY_SCRIPT] [varchar](1000) NULL,
	[FILTER_XML] [varchar](1000) NULL,
	[IS_ACTIVE] [tinyint] NULL,
	[GROUP_ID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_ENTITY_LOG]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_ENTITY_LOG](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[EVENT_TS] [datetime] NULL,
	[USER_ID] [uniqueidentifier] NULL,
	[CHANGE_TYPE] [char](1) NULL,
	[ENTITY] [varchar](100) NULL,
	[ENTITY_ID] [uniqueidentifier] NULL,
	[CHANGES] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_ENTITY_LOG_ATTR]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_ENTITY_LOG_ATTR](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[ITEM_ID] [uniqueidentifier] NULL,
	[NAME] [varchar](50) NULL,
	[VALUE] [varchar](1500) NULL,
	[VALUE_ID] [uniqueidentifier] NULL,
	[MESSAGES_PACK] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_FILTER]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_FILTER](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[COMPONENT] [varchar](200) NULL,
	[NAME] [varchar](255) NULL,
	[CODE] [varchar](200) NULL,
	[XML] [varchar](max) NULL,
	[USER_ID] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_GROUP]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_GROUP](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[NAME] [varchar](255) NOT NULL,
	[PARENT_ID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_GROUP_HIERARCHY]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_GROUP_HIERARCHY](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[GROUP_ID] [uniqueidentifier] NULL,
	[PARENT_ID] [uniqueidentifier] NULL,
	[HIERARCHY_LEVEL] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_LOGGED_ATTR]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_LOGGED_ATTR](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[ENTITY_ID] [uniqueidentifier] NULL,
	[NAME] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_LOGGED_ENTITY]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_LOGGED_ENTITY](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[NAME] [varchar](100) NULL,
	[AUTO] [tinyint] NULL,
	[MANUAL] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_PERMISSION]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_PERMISSION](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[PERMISSION_TYPE] [int] NULL,
	[TARGET] [varchar](100) NULL,
	[VALUE] [int] NULL,
	[ROLE_ID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_PRESENTATION]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_PRESENTATION](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[COMPONENT] [varchar](200) NULL,
	[NAME] [varchar](255) NULL,
	[XML] [varchar](7000) NULL,
	[USER_ID] [uniqueidentifier] NULL,
	[IS_AUTO_SAVE] [tinyint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_REMEMBER_ME]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_REMEMBER_ME](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[USER_ID] [uniqueidentifier] NOT NULL,
	[TOKEN] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_ROLE]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_ROLE](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[NAME] [varchar](255) NOT NULL,
	[LOC_NAME] [varchar](255) NULL,
	[DESCRIPTION] [varchar](1000) NULL,
	[IS_DEFAULT_ROLE] [tinyint] NULL,
	[ROLE_TYPE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_SCREEN_HISTORY]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_SCREEN_HISTORY](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[USER_ID] [uniqueidentifier] NULL,
	[CAPTION] [varchar](255) NULL,
	[URL] [varchar](max) NULL,
	[ENTITY_ID] [uniqueidentifier] NULL,
	[SUBSTITUTED_USER_ID] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_SEARCH_FOLDER]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_SEARCH_FOLDER](
	[FOLDER_ID] [uniqueidentifier] NOT NULL,
	[FILTER_COMPONENT] [varchar](200) NULL,
	[FILTER_XML] [varchar](7000) NULL,
	[USER_ID] [uniqueidentifier] NULL,
	[PRESENTATION_ID] [uniqueidentifier] NULL,
	[APPLY_DEFAULT] [tinyint] NULL,
	[IS_SET] [tinyint] NULL,
	[ENTITY_TYPE] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FOLDER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_SESSION_ATTR]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_SESSION_ATTR](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[NAME] [varchar](50) NULL,
	[STR_VALUE] [varchar](1000) NULL,
	[DATATYPE] [varchar](20) NULL,
	[GROUP_ID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_USER]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_USER](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[LOGIN] [varchar](50) NOT NULL,
	[LOGIN_LC] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](255) NULL,
	[NAME] [varchar](255) NULL,
	[FIRST_NAME] [varchar](255) NULL,
	[LAST_NAME] [varchar](255) NULL,
	[MIDDLE_NAME] [varchar](255) NULL,
	[POSITION_] [varchar](255) NULL,
	[EMAIL] [varchar](100) NULL,
	[LANGUAGE_] [varchar](20) NULL,
	[TIME_ZONE] [varchar](50) NULL,
	[TIME_ZONE_AUTO] [tinyint] NULL,
	[ACTIVE] [tinyint] NULL,
	[GROUP_ID] [uniqueidentifier] NOT NULL,
	[IP_MASK] [varchar](200) NULL,
	[CHANGE_PASSWORD_AT_LOGON] [tinyint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_USER_ROLE]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_USER_ROLE](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[USER_ID] [uniqueidentifier] NULL,
	[ROLE_ID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_USER_SETTING]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_USER_SETTING](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[USER_ID] [uniqueidentifier] NULL,
	[CLIENT_TYPE] [char](1) NULL,
	[NAME] [varchar](255) NULL,
	[VALUE] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_USER_SUBSTITUTION]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_USER_SUBSTITUTION](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[USER_ID] [uniqueidentifier] NOT NULL,
	[SUBSTITUTED_USER_ID] [uniqueidentifier] NOT NULL,
	[START_DATE] [datetime] NULL,
	[END_DATE] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_APP_FOLDER]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_APP_FOLDER](
	[FOLDER_ID] [uniqueidentifier] NOT NULL,
	[FILTER_COMPONENT] [varchar](200) NULL,
	[FILTER_XML] [varchar](7000) NULL,
	[VISIBILITY_SCRIPT] [varchar](max) NULL,
	[QUANTITY_SCRIPT] [varchar](max) NULL,
	[APPLY_DEFAULT] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[FOLDER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_ATTR_VALUE]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_ATTR_VALUE](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[CATEGORY_ATTR_ID] [uniqueidentifier] NOT NULL,
	[ENTITY_ID] [uniqueidentifier] NULL,
	[STRING_VALUE] [varchar](max) NULL,
	[INTEGER_VALUE] [int] NULL,
	[DOUBLE_VALUE] [numeric](18, 0) NULL,
	[DATE_VALUE] [datetime] NULL,
	[BOOLEAN_VALUE] [tinyint] NULL,
	[ENTITY_VALUE] [uniqueidentifier] NULL,
	[CODE] [varchar](100) NULL,
	[PARENT_ID] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_CATEGORY]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_CATEGORY](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[NAME] [varchar](255) NOT NULL,
	[SPECIAL] [varchar](50) NULL,
	[ENTITY_TYPE] [varchar](30) NOT NULL,
	[IS_DEFAULT] [tinyint] NULL,
	[DISCRIMINATOR] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_CATEGORY_ATTR]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_CATEGORY_ATTR](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[CATEGORY_ENTITY_TYPE] [varchar](4000) NULL,
	[NAME] [varchar](255) NULL,
	[CODE] [varchar](100) NOT NULL,
	[CATEGORY_ID] [uniqueidentifier] NOT NULL,
	[ENTITY_CLASS] [varchar](500) NULL,
	[DATA_TYPE] [varchar](200) NULL,
	[DEFAULT_STRING] [varchar](max) NULL,
	[DEFAULT_INT] [int] NULL,
	[DEFAULT_DOUBLE] [numeric](18, 0) NULL,
	[DEFAULT_DATE] [datetime] NULL,
	[DEFAULT_DATE_IS_CURRENT] [tinyint] NULL,
	[DEFAULT_BOOLEAN] [tinyint] NULL,
	[DEFAULT_ENTITY_VALUE] [uniqueidentifier] NULL,
	[ENUMERATION] [varchar](500) NULL,
	[ORDER_NO] [int] NULL,
	[SCREEN] [varchar](255) NULL,
	[REQUIRED] [tinyint] NULL,
	[LOOKUP] [tinyint] NULL,
	[TARGET_SCREENS] [varchar](4000) NULL,
	[WIDTH] [varchar](20) NULL,
	[ROWS_COUNT] [int] NULL,
	[IS_COLLECTION] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_CONFIG]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_CONFIG](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[NAME] [varchar](255) NULL,
	[VALUE] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_DB_CHANGELOG]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_DB_CHANGELOG](
	[SCRIPT_NAME] [varchar](300) NOT NULL,
	[CREATE_TS] [datetime] NULL DEFAULT (getdate()),
	[IS_INIT] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[SCRIPT_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_ENTITY_SNAPSHOT]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_ENTITY_SNAPSHOT](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[ENTITY_META_CLASS] [varchar](50) NOT NULL,
	[ENTITY_ID] [uniqueidentifier] NOT NULL,
	[AUTHOR_ID] [uniqueidentifier] NOT NULL,
	[VIEW_XML] [varchar](max) NOT NULL,
	[SNAPSHOT_XML] [varchar](max) NOT NULL,
	[SNAPSHOT_DATE] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_ENTITY_STATISTICS]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_ENTITY_STATISTICS](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[NAME] [varchar](50) NULL,
	[INSTANCE_COUNT] [bigint] NULL,
	[FETCH_UI] [int] NULL,
	[MAX_FETCH_UI] [int] NULL,
	[LAZY_COLLECTION_THRESHOLD] [int] NULL,
	[LOOKUP_SCREEN_THRESHOLD] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_FILE]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_FILE](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[NAME] [varchar](500) NOT NULL,
	[EXT] [varchar](20) NULL,
	[FILE_SIZE] [bigint] NULL,
	[CREATE_DATE] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_FOLDER]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_FOLDER](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[FOLDER_TYPE] [char](1) NULL,
	[PARENT_ID] [uniqueidentifier] NULL,
	[NAME] [varchar](100) NULL,
	[TAB_NAME] [varchar](100) NULL,
	[SORT_ORDER] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_FTS_QUEUE]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_FTS_QUEUE](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[ENTITY_ID] [uniqueidentifier] NULL,
	[STRING_ENTITY_ID] [varchar](255) NULL,
	[INT_ENTITY_ID] [int] NULL,
	[LONG_ENTITY_ID] [bigint] NULL,
	[ENTITY_NAME] [varchar](200) NULL,
	[CHANGE_TYPE] [char](1) NULL,
	[SOURCE_HOST] [varchar](255) NULL,
	[INDEXING_HOST] [varchar](255) NULL,
	[FAKE] [tinyint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_JMX_INSTANCE]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_JMX_INSTANCE](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[NODE_NAME] [varchar](255) NULL,
	[ADDRESS] [varchar](500) NOT NULL,
	[LOGIN] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_LOCK_CONFIG]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_LOCK_CONFIG](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[NAME] [varchar](100) NULL,
	[TIMEOUT_SEC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_QUERY_RESULT]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_QUERY_RESULT](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SESSION_ID] [uniqueidentifier] NOT NULL,
	[QUERY_KEY] [int] NOT NULL,
	[ENTITY_ID] [uniqueidentifier] NULL,
	[STRING_ENTITY_ID] [varchar](255) NULL,
	[INT_ENTITY_ID] [int] NULL,
	[LONG_ENTITY_ID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_SCHEDULED_EXECUTION]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_SCHEDULED_EXECUTION](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[TASK_ID] [uniqueidentifier] NULL,
	[SERVER] [varchar](512) NULL,
	[START_TIME] [datetime] NULL,
	[FINISH_TIME] [datetime] NULL,
	[RESULT] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_SCHEDULED_TASK]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_SCHEDULED_TASK](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[DEFINED_BY] [varchar](1) NULL,
	[CLASS_NAME] [varchar](500) NULL,
	[SCRIPT_NAME] [varchar](500) NULL,
	[BEAN_NAME] [varchar](50) NULL,
	[METHOD_NAME] [varchar](50) NULL,
	[METHOD_PARAMS] [varchar](1000) NULL,
	[USER_NAME] [varchar](50) NULL,
	[IS_SINGLETON] [tinyint] NULL,
	[IS_ACTIVE] [tinyint] NULL,
	[PERIOD] [int] NULL,
	[TIMEOUT] [int] NULL,
	[START_DATE] [datetime] NULL,
	[TIME_FRAME] [int] NULL,
	[START_DELAY] [int] NULL,
	[PERMITTED_SERVERS] [varchar](4096) NULL,
	[LOG_START] [tinyint] NULL,
	[LOG_FINISH] [tinyint] NULL,
	[LAST_START_TIME] [datetime] NULL,
	[LAST_START_SERVER] [varchar](512) NULL,
	[DESCRIPTION] [varchar](1000) NULL,
	[CRON] [varchar](100) NULL,
	[SCHEDULING_TYPE] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_SENDING_ATTACHMENT]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_SENDING_ATTACHMENT](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[MESSAGE_ID] [uniqueidentifier] NULL,
	[CONTENT] [image] NULL,
	[CONTENT_FILE_ID] [uniqueidentifier] NULL,
	[CONTENT_ID] [varchar](50) NULL,
	[NAME] [varchar](500) NULL,
	[DISPOSITION] [varchar](50) NULL,
	[TEXT_ENCODING] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_SENDING_MESSAGE]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_SENDING_MESSAGE](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[VERSION] [int] NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[DELETE_TS] [datetime] NULL,
	[DELETED_BY] [varchar](50) NULL,
	[ADDRESS_TO] [varchar](max) NULL,
	[ADDRESS_FROM] [varchar](100) NULL,
	[CAPTION] [varchar](500) NULL,
	[EMAIL_HEADERS] [varchar](500) NULL,
	[CONTENT_TEXT] [varchar](max) NULL,
	[CONTENT_TEXT_FILE_ID] [uniqueidentifier] NULL,
	[DEADLINE] [datetime] NULL,
	[STATUS] [int] NULL,
	[DATE_SENT] [datetime] NULL,
	[ATTEMPTS_COUNT] [int] NULL,
	[ATTEMPTS_MADE] [int] NULL,
	[ATTACHMENTS_NAME] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_SERVER]    Script Date: 21.11.2016 18:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_SERVER](
	[ID] [uniqueidentifier] NOT NULL,
	[CREATE_TS] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[UPDATE_TS] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[NAME] [varchar](255) NULL,
	[IS_RUNNING] [tinyint] NULL,
	[DATA] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO


INSERT [dbo].[SEC_FILTER] ([ID], [CREATE_TS], [CREATED_BY], [VERSION], [UPDATE_TS], [UPDATED_BY], [DELETE_TS], [DELETED_BY], [COMPONENT], [NAME], [CODE], [XML], [USER_ID]) VALUES (N'b61d18cb-e79a-46f3-b16d-eaf4aebb10dd', CAST(N'2010-03-01 11:14:06.830' AS DateTime), N'admin', 2, CAST(N'2010-03-01 11:52:53.170' AS DateTime), N'admin', NULL, NULL, N'[sec$User.browse].genericFilter', N'Search by role', NULL, N'<?xml version="1.0" encoding="UTF-8"?>
<filter>
  <and>
    <c name="UrMxpkfMGn" class="com.haulmont.cuba.security.entity.Role" type="CUSTOM" locCaption="Role" entityAlias="u" join="join u.userRoles ur">ur.role.id = :component$genericFilter.UrMxpkfMGn32565
      <param name="component$genericFilter.UrMxpkfMGn32565">NULL</param>
    </c>
  </and>
</filter>', N'60885987-1b61-4247-94c7-dff348347f93')
GO
INSERT [dbo].[SEC_GROUP] ([ID], [CREATE_TS], [CREATED_BY], [VERSION], [UPDATE_TS], [UPDATED_BY], [DELETE_TS], [DELETED_BY], [NAME], [PARENT_ID]) VALUES (N'0fa2b1a5-1d68-4d69-9fbd-dff348347f93', CAST(N'2016-11-21T18:45:00.693' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL, N'Company', NULL)
GO
INSERT [dbo].[SEC_ROLE] ([ID], [CREATE_TS], [CREATED_BY], [VERSION], [UPDATE_TS], [UPDATED_BY], [DELETE_TS], [DELETED_BY], [NAME], [LOC_NAME], [DESCRIPTION], [IS_DEFAULT_ROLE], [ROLE_TYPE]) VALUES (N'0c018061-b26f-4de2-a5be-dff348347f93', CAST(N'2016-11-21T18:45:00.700' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL, N'Administrators', NULL, NULL, NULL, 10)
GO
INSERT [dbo].[SEC_USER] ([ID], [CREATE_TS], [CREATED_BY], [VERSION], [UPDATE_TS], [UPDATED_BY], [DELETE_TS], [DELETED_BY], [LOGIN], [LOGIN_LC], [PASSWORD], [NAME], [FIRST_NAME], [LAST_NAME], [MIDDLE_NAME], [POSITION_], [EMAIL], [LANGUAGE_], [TIME_ZONE], [TIME_ZONE_AUTO], [ACTIVE], [GROUP_ID], [IP_MASK], [CHANGE_PASSWORD_AT_LOGON]) VALUES (N'60885987-1b61-4247-94c7-dff348347f93', CAST(N'2016-11-21T18:45:00.697' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL, N'admin', N'admin', N'cc2229d1b8a052423d9e1c9ef0113b850086586a', N'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'0fa2b1a5-1d68-4d69-9fbd-dff348347f93', NULL, NULL)
GO
INSERT [dbo].[SEC_USER] ([ID], [CREATE_TS], [CREATED_BY], [VERSION], [UPDATE_TS], [UPDATED_BY], [DELETE_TS], [DELETED_BY], [LOGIN], [LOGIN_LC], [PASSWORD], [NAME], [FIRST_NAME], [LAST_NAME], [MIDDLE_NAME], [POSITION_], [EMAIL], [LANGUAGE_], [TIME_ZONE], [TIME_ZONE_AUTO], [ACTIVE], [GROUP_ID], [IP_MASK], [CHANGE_PASSWORD_AT_LOGON]) VALUES (N'a405db59-e674-4f63-8afe-269dda788fe8', CAST(N'2016-11-21T18:45:00.700' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL, N'anonymous', N'anonymous', NULL, N'Anonymous', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'0fa2b1a5-1d68-4d69-9fbd-dff348347f93', NULL, NULL)
GO
INSERT [dbo].[SEC_USER_ROLE] ([ID], [CREATE_TS], [CREATED_BY], [VERSION], [UPDATE_TS], [UPDATED_BY], [DELETE_TS], [DELETED_BY], [USER_ID], [ROLE_ID]) VALUES (N'c838be0a-96d0-4ef4-a7c0-dff348347f93', CAST(N'2016-11-21T18:45:00.703' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL, N'60885987-1b61-4247-94c7-dff348347f93', N'0c018061-b26f-4de2-a5be-dff348347f93')
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/init/mssql/create-db.sql', CAST(N'2016-11-21T18:45:00.717' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/02/02-100-entitySnapshotAuthor.sql', CAST(N'2016-11-21T18:45:00.770' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/02/02-110-addUserDescriminator.sql', CAST(N'2016-11-21T18:45:00.787' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/02/02-130-queryResults.sql', CAST(N'2016-11-21T18:45:00.790' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/02/02-140-entityLogChanges.sql', CAST(N'2016-11-21T18:45:00.807' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/02/02-150-alterSysScheduledTask.sql', CAST(N'2016-11-21T18:45:00.887' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/12/121002-updateScreenPermissions.sql', CAST(N'2016-11-21T18:45:00.917' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/12/121003-addCodeToCategoryAttribute.sql', CAST(N'2016-11-21T18:45:00.920' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/12/121004-addFieldsToScheduledTasks.sql', CAST(N'2016-11-21T18:45:00.920' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/12/121020-addLoginConstraintsForUser.sql', CAST(N'2016-11-21T18:45:00.927' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/12/121024-addEncryptionParamsToUser.sql', CAST(N'2016-11-21T18:45:00.930' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/12/121031-dropPasswordColumnFromScheduledTask.sql', CAST(N'2016-11-21T18:45:00.930' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/12/121102-dropSaltColumn.sql', CAST(N'2016-11-21T18:45:00.933' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/12/121114-addDescriptionToScheduledTask.sql', CAST(N'2016-11-21T18:45:00.937' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/12/121228-addJmxInstance.sql', CAST(N'2016-11-21T18:45:00.937' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/13/130110-removeJmxInstanceDescription.sql', CAST(N'2016-11-21T18:45:00.940' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/13/130311-renameColumnsForOracle.sql', CAST(N'2016-11-21T18:45:00.940' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/13/130731-changeServerEntity.sql', CAST(N'2016-11-21T18:45:00.940' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/13/130918-email-attachment-options.sql', CAST(N'2016-11-21T18:45:00.943' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/13/130920-email-file-storage.sql', CAST(N'2016-11-21T18:45:00.943' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/13/130923-permissionsToRenamedScreens.sql', CAST(N'2016-11-21T18:45:00.943' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/13/131112-scheduled-task-cron.sql', CAST(N'2016-11-21T18:45:00.947' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/14/140313-ftsQueueIndexingHost.sql', CAST(N'2016-11-21T18:45:00.947' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/14/140405-changeTypeForSysConfigValue.sql', CAST(N'2016-11-21T18:45:00.950' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/14/140708-addRememberMeTable.sql', CAST(N'2016-11-21T18:45:00.950' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/14/140716-changeSysFileSizeType.sql', CAST(N'2016-11-21T18:45:00.950' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/14/141203-setNotNullSysFileName.sql', CAST(N'2016-11-21T18:45:00.987' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/150203-sendingMessageEmailHeaders.sql', CAST(N'2016-11-21T18:45:00.987' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/150203-userTimeZone.sql', CAST(N'2016-11-21T18:45:00.990' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/150205-addSubstituteUserInScreenHistory.sql', CAST(N'2016-11-21T18:45:00.990' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/150226-addIndexInScreenHistory.sql', CAST(N'2016-11-21T18:45:00.990' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/150310-alterFilterXml.sql', CAST(N'2016-11-21T18:45:00.990' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/150417-runtimePropertiesChanges.sql', CAST(N'2016-11-21T18:45:00.990' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/150514-categoryEntityTypeInAttribute.sql', CAST(N'2016-11-21T18:45:00.990' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/150630-entityClassToCategoryAttribute.sql', CAST(N'2016-11-21T18:45:00.990' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/150805-fakeFtsQueue.sql', CAST(N'2016-11-21T18:45:00.993' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/151106-extendScheduledTaskFields.sql', CAST(N'2016-11-21T18:45:00.993' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/151116-rowLevelSecurity.sql', CAST(N'2016-11-21T18:45:00.993' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/1512282-addIsActiveToConstraint.sql', CAST(N'2016-11-21T18:45:00.997' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/15/151228-sendingMessagesExtendFields.sql', CAST(N'2016-11-21T18:45:00.993' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/16/160322-dropUniqSysScheduledTaskBeanMethodConstraint.sql', CAST(N'2016-11-21T18:45:00.997' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/16/160405-createUniqSysCategory.sql', CAST(N'2016-11-21T18:45:00.997' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/16/160420-createUpdateTsIndexOnSysSendingMessage.sql', CAST(N'2016-11-21T18:45:01.000' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/16/160616-addSizeCategoryAttribute.sql', CAST(N'2016-11-21T18:45:01.000' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/16/160626-createIndexOnFinishTimeScheduledExecution.sql', CAST(N'2016-11-21T18:45:01.000' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/16/160725-anonymousLogin.sql', CAST(N'2016-11-21T18:45:01.000' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/16/160916-addEntityIdToFtsQueue.sql', CAST(N'2016-11-21T18:45:01.000' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/16/161024-collectionDynamicAttributes.sql', CAST(N'2016-11-21T18:45:01.003' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/16/161025-sysAttrValueParentConstraint.sql', CAST(N'2016-11-21T18:45:01.003' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/16/161102-setIsCollectionForExistingCategoryAttrs.sql', CAST(N'2016-11-21T18:45:01.003' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'10-cuba/update/mssql/16/270916-addEntityIdToQueryResult.sql', CAST(N'2016-11-21T18:45:01.003' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'50-cuba-vision-clinic/init/mssql/10.create-db.sql', CAST(N'2016-11-21T18:45:00.717' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'50-cuba-vision-clinic/init/mssql/20.create-db.sql', CAST(N'2016-11-21T18:45:00.730' AS DateTime), 1)
GO
INSERT [dbo].[SYS_DB_CHANGELOG] ([SCRIPT_NAME], [CREATE_TS], [IS_INIT]) VALUES (N'50-cuba-vision-clinic/init/mssql/30.create-db.sql', CAST(N'2016-11-21T18:45:00.733' AS DateTime), 1)
GO
INSERT [dbo].[SYS_SERVER] ([ID], [CREATE_TS], [CREATED_BY], [UPDATE_TS], [UPDATED_BY], [NAME], [IS_RUNNING], [DATA]) VALUES (N'1f40db1e-ce5d-fb49-fa46-e57f987cf193', CAST(N'2016-11-21T18:46:21.140' AS DateTime), NULL, CAST(N'2016-11-21T18:47:21.143' AS DateTime), NULL, N'localhost:8080/app-core', 1, NULL)
GO
/****** Object:  Index [PK__SEC_CONS__3214EC26F8014BD1]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_CONSTRAINT] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_ENTI__3214EC263B705A1F]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_ENTITY_LOG] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_ENTI__3214EC26895614BC]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_ENTITY_LOG_ATTR] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_FILT__3214EC26937F49C9]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_FILTER] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_GROU__3214EC260BDD22DB]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_GROUP_HIERARCHY] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_LOGG__3214EC268B6E1108]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_LOGGED_ATTR] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [SEC_LOGGED_ATTR_UNIQ_NAME]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_LOGGED_ATTR] ADD  CONSTRAINT [SEC_LOGGED_ATTR_UNIQ_NAME] UNIQUE NONCLUSTERED 
(
	[ENTITY_ID] ASC,
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [SEC_LOGGED_ENTITY_UNIQ_NAME]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_LOGGED_ENTITY] ADD  CONSTRAINT [SEC_LOGGED_ENTITY_UNIQ_NAME] UNIQUE NONCLUSTERED 
(
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_PERM__3214EC2696927132]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_PERMISSION] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_PRES__3214EC26C7C00787]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_PRESENTATION] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_SCRE__3214EC26999D82A9]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_SCREEN_HISTORY] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_SESS__3214EC26FF58B04F]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_SESSION_ATTR] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_USER__3214EC26DDE48846]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_USER] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_USER__3214EC2679DB5880]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_USER_ROLE] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_USER__3214EC2606AF1557]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_USER_SETTING] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [SEC_USER_SETTING_UNIQ]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_USER_SETTING] ADD  CONSTRAINT [SEC_USER_SETTING_UNIQ] UNIQUE NONCLUSTERED 
(
	[USER_ID] ASC,
	[NAME] ASC,
	[CLIENT_TYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SEC_USER__3214EC26AB0B7B54]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SEC_USER_SUBSTITUTION] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SYS_ATTR__3214EC2685FC6CA8]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SYS_ATTR_VALUE] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SYS_CATE__3214EC264B3A39AC]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SYS_CATEGORY_ATTR] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SYS_CONF__3214EC26FD6E8498]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SYS_CONFIG] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SYS_ENTI__3214EC26D1642C48]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SYS_ENTITY_SNAPSHOT] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SYS_ENTI__3214EC264CBE0345]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SYS_ENTITY_STATISTICS] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SYS_FILE__3214EC26F34737C5]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SYS_FILE] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SYS_FTS___3214EC2657595A30]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SYS_FTS_QUEUE] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SYS_SCHE__3214EC26D8734A87]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SYS_SCHEDULED_EXECUTION] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SYS_SEND__3214EC2608A0DDC6]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SYS_SENDING_ATTACHMENT] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SYS_SEND__3214EC2697C8096D]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SYS_SENDING_MESSAGE] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__SYS_SERV__3214EC269417620B]    Script Date: 21.11.2016 18:47:52 ******/
ALTER TABLE [dbo].[SYS_SERVER] ADD PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SEC_CONSTRAINT] ADD  DEFAULT ('db') FOR [CHECK_TYPE]
GO
ALTER TABLE [dbo].[SEC_CONSTRAINT] ADD  DEFAULT ('read') FOR [OPERATION_TYPE]
GO
ALTER TABLE [dbo].[SEC_CONSTRAINT] ADD  DEFAULT ((1)) FOR [IS_ACTIVE]
GO
ALTER TABLE [dbo].[SYS_SCHEDULED_TASK] ADD  DEFAULT ('B') FOR [DEFINED_BY]
GO
ALTER TABLE [dbo].[SYS_SCHEDULED_TASK] ADD  DEFAULT ('P') FOR [SCHEDULING_TYPE]
GO
ALTER TABLE [dbo].[SEC_CONSTRAINT]  WITH CHECK ADD  CONSTRAINT [SEC_CONSTRAINT_GROUP] FOREIGN KEY([GROUP_ID])
REFERENCES [dbo].[SEC_GROUP] ([ID])
GO
ALTER TABLE [dbo].[SEC_CONSTRAINT] CHECK CONSTRAINT [SEC_CONSTRAINT_GROUP]
GO
ALTER TABLE [dbo].[SEC_ENTITY_LOG]  WITH CHECK ADD  CONSTRAINT [FK_SEC_ENTITY_LOG_USER] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SEC_ENTITY_LOG] CHECK CONSTRAINT [FK_SEC_ENTITY_LOG_USER]
GO
ALTER TABLE [dbo].[SEC_ENTITY_LOG_ATTR]  WITH CHECK ADD  CONSTRAINT [FK_SEC_ENTITY_LOG_ATTR_ITEM] FOREIGN KEY([ITEM_ID])
REFERENCES [dbo].[SEC_ENTITY_LOG] ([ID])
GO
ALTER TABLE [dbo].[SEC_ENTITY_LOG_ATTR] CHECK CONSTRAINT [FK_SEC_ENTITY_LOG_ATTR_ITEM]
GO
ALTER TABLE [dbo].[SEC_FILTER]  WITH CHECK ADD  CONSTRAINT [FK_SEC_FILTER_USER] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SEC_FILTER] CHECK CONSTRAINT [FK_SEC_FILTER_USER]
GO
ALTER TABLE [dbo].[SEC_GROUP]  WITH CHECK ADD  CONSTRAINT [SEC_GROUP_PARENT] FOREIGN KEY([PARENT_ID])
REFERENCES [dbo].[SEC_GROUP] ([ID])
GO
ALTER TABLE [dbo].[SEC_GROUP] CHECK CONSTRAINT [SEC_GROUP_PARENT]
GO
ALTER TABLE [dbo].[SEC_GROUP_HIERARCHY]  WITH CHECK ADD  CONSTRAINT [SEC_GROUP_HIERARCHY_GROUP] FOREIGN KEY([GROUP_ID])
REFERENCES [dbo].[SEC_GROUP] ([ID])
GO
ALTER TABLE [dbo].[SEC_GROUP_HIERARCHY] CHECK CONSTRAINT [SEC_GROUP_HIERARCHY_GROUP]
GO
ALTER TABLE [dbo].[SEC_GROUP_HIERARCHY]  WITH CHECK ADD  CONSTRAINT [SEC_GROUP_HIERARCHY_PARENT] FOREIGN KEY([PARENT_ID])
REFERENCES [dbo].[SEC_GROUP] ([ID])
GO
ALTER TABLE [dbo].[SEC_GROUP_HIERARCHY] CHECK CONSTRAINT [SEC_GROUP_HIERARCHY_PARENT]
GO
ALTER TABLE [dbo].[SEC_LOGGED_ATTR]  WITH CHECK ADD  CONSTRAINT [FK_SEC_LOGGED_ATTR_ENTITY] FOREIGN KEY([ENTITY_ID])
REFERENCES [dbo].[SEC_LOGGED_ENTITY] ([ID])
GO
ALTER TABLE [dbo].[SEC_LOGGED_ATTR] CHECK CONSTRAINT [FK_SEC_LOGGED_ATTR_ENTITY]
GO
ALTER TABLE [dbo].[SEC_PERMISSION]  WITH CHECK ADD  CONSTRAINT [SEC_PERMISSION_ROLE] FOREIGN KEY([ROLE_ID])
REFERENCES [dbo].[SEC_ROLE] ([ID])
GO
ALTER TABLE [dbo].[SEC_PERMISSION] CHECK CONSTRAINT [SEC_PERMISSION_ROLE]
GO
ALTER TABLE [dbo].[SEC_PRESENTATION]  WITH CHECK ADD  CONSTRAINT [SEC_PRESENTATION_USER] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SEC_PRESENTATION] CHECK CONSTRAINT [SEC_PRESENTATION_USER]
GO
ALTER TABLE [dbo].[SEC_REMEMBER_ME]  WITH CHECK ADD  CONSTRAINT [FK_SEC_REMEMBER_ME_USER] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SEC_REMEMBER_ME] CHECK CONSTRAINT [FK_SEC_REMEMBER_ME_USER]
GO
ALTER TABLE [dbo].[SEC_SCREEN_HISTORY]  WITH CHECK ADD  CONSTRAINT [FK_SEC_HISTORY_SUBSTITUTED_USER] FOREIGN KEY([SUBSTITUTED_USER_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SEC_SCREEN_HISTORY] CHECK CONSTRAINT [FK_SEC_HISTORY_SUBSTITUTED_USER]
GO
ALTER TABLE [dbo].[SEC_SCREEN_HISTORY]  WITH CHECK ADD  CONSTRAINT [FK_SEC_HISTORY_USER] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SEC_SCREEN_HISTORY] CHECK CONSTRAINT [FK_SEC_HISTORY_USER]
GO
ALTER TABLE [dbo].[SEC_SEARCH_FOLDER]  WITH CHECK ADD  CONSTRAINT [FK_SEC_SEARCH_FOLDER_FOLDER] FOREIGN KEY([FOLDER_ID])
REFERENCES [dbo].[SYS_FOLDER] ([ID])
GO
ALTER TABLE [dbo].[SEC_SEARCH_FOLDER] CHECK CONSTRAINT [FK_SEC_SEARCH_FOLDER_FOLDER]
GO
ALTER TABLE [dbo].[SEC_SEARCH_FOLDER]  WITH CHECK ADD  CONSTRAINT [FK_SEC_SEARCH_FOLDER_PRESENTATION] FOREIGN KEY([PRESENTATION_ID])
REFERENCES [dbo].[SEC_PRESENTATION] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SEC_SEARCH_FOLDER] CHECK CONSTRAINT [FK_SEC_SEARCH_FOLDER_PRESENTATION]
GO
ALTER TABLE [dbo].[SEC_SEARCH_FOLDER]  WITH CHECK ADD  CONSTRAINT [FK_SEC_SEARCH_FOLDER_USER] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SEC_SEARCH_FOLDER] CHECK CONSTRAINT [FK_SEC_SEARCH_FOLDER_USER]
GO
ALTER TABLE [dbo].[SEC_SESSION_ATTR]  WITH CHECK ADD  CONSTRAINT [SEC_SESSION_ATTR_GROUP] FOREIGN KEY([GROUP_ID])
REFERENCES [dbo].[SEC_GROUP] ([ID])
GO
ALTER TABLE [dbo].[SEC_SESSION_ATTR] CHECK CONSTRAINT [SEC_SESSION_ATTR_GROUP]
GO
ALTER TABLE [dbo].[SEC_USER]  WITH CHECK ADD  CONSTRAINT [SEC_USER_GROUP] FOREIGN KEY([GROUP_ID])
REFERENCES [dbo].[SEC_GROUP] ([ID])
GO
ALTER TABLE [dbo].[SEC_USER] CHECK CONSTRAINT [SEC_USER_GROUP]
GO
ALTER TABLE [dbo].[SEC_USER_ROLE]  WITH CHECK ADD  CONSTRAINT [SEC_USER_ROLE_PROFILE] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SEC_USER_ROLE] CHECK CONSTRAINT [SEC_USER_ROLE_PROFILE]
GO
ALTER TABLE [dbo].[SEC_USER_ROLE]  WITH CHECK ADD  CONSTRAINT [SEC_USER_ROLE_ROLE] FOREIGN KEY([ROLE_ID])
REFERENCES [dbo].[SEC_ROLE] ([ID])
GO
ALTER TABLE [dbo].[SEC_USER_ROLE] CHECK CONSTRAINT [SEC_USER_ROLE_ROLE]
GO
ALTER TABLE [dbo].[SEC_USER_SETTING]  WITH CHECK ADD  CONSTRAINT [SEC_USER_SETTING_USER] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SEC_USER_SETTING] CHECK CONSTRAINT [SEC_USER_SETTING_USER]
GO
ALTER TABLE [dbo].[SEC_USER_SUBSTITUTION]  WITH CHECK ADD  CONSTRAINT [FK_SEC_USER_SUBSTITUTION_SUBSTITUTED_USER] FOREIGN KEY([SUBSTITUTED_USER_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SEC_USER_SUBSTITUTION] CHECK CONSTRAINT [FK_SEC_USER_SUBSTITUTION_SUBSTITUTED_USER]
GO
ALTER TABLE [dbo].[SEC_USER_SUBSTITUTION]  WITH CHECK ADD  CONSTRAINT [FK_SEC_USER_SUBSTITUTION_USER] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SEC_USER_SUBSTITUTION] CHECK CONSTRAINT [FK_SEC_USER_SUBSTITUTION_USER]
GO
ALTER TABLE [dbo].[SYS_APP_FOLDER]  WITH CHECK ADD  CONSTRAINT [FK_SYS_APP_FOLDER_FOLDER] FOREIGN KEY([FOLDER_ID])
REFERENCES [dbo].[SYS_FOLDER] ([ID])
GO
ALTER TABLE [dbo].[SYS_APP_FOLDER] CHECK CONSTRAINT [FK_SYS_APP_FOLDER_FOLDER]
GO
ALTER TABLE [dbo].[SYS_ATTR_VALUE]  WITH CHECK ADD  CONSTRAINT [SYS_ATTR_VALUE_ATTR_VALUE_PARENT_ID] FOREIGN KEY([PARENT_ID])
REFERENCES [dbo].[SYS_ATTR_VALUE] ([ID])
GO
ALTER TABLE [dbo].[SYS_ATTR_VALUE] CHECK CONSTRAINT [SYS_ATTR_VALUE_ATTR_VALUE_PARENT_ID]
GO
ALTER TABLE [dbo].[SYS_ATTR_VALUE]  WITH CHECK ADD  CONSTRAINT [SYS_ATTR_VALUE_CATEGORY_ATTR_ID] FOREIGN KEY([CATEGORY_ATTR_ID])
REFERENCES [dbo].[SYS_CATEGORY_ATTR] ([ID])
GO
ALTER TABLE [dbo].[SYS_ATTR_VALUE] CHECK CONSTRAINT [SYS_ATTR_VALUE_CATEGORY_ATTR_ID]
GO
ALTER TABLE [dbo].[SYS_CATEGORY_ATTR]  WITH CHECK ADD  CONSTRAINT [SYS_CATEGORY_ATTR_CATEGORY_ID] FOREIGN KEY([CATEGORY_ID])
REFERENCES [dbo].[SYS_CATEGORY] ([ID])
GO
ALTER TABLE [dbo].[SYS_CATEGORY_ATTR] CHECK CONSTRAINT [SYS_CATEGORY_ATTR_CATEGORY_ID]
GO
ALTER TABLE [dbo].[SYS_ENTITY_SNAPSHOT]  WITH CHECK ADD  CONSTRAINT [FK_SYS_ENTITY_SNAPSHOT_AUTHOR_ID] FOREIGN KEY([AUTHOR_ID])
REFERENCES [dbo].[SEC_USER] ([ID])
GO
ALTER TABLE [dbo].[SYS_ENTITY_SNAPSHOT] CHECK CONSTRAINT [FK_SYS_ENTITY_SNAPSHOT_AUTHOR_ID]
GO
ALTER TABLE [dbo].[SYS_FOLDER]  WITH CHECK ADD  CONSTRAINT [FK_SYS_FOLDER_PARENT] FOREIGN KEY([PARENT_ID])
REFERENCES [dbo].[SYS_FOLDER] ([ID])
GO
ALTER TABLE [dbo].[SYS_FOLDER] CHECK CONSTRAINT [FK_SYS_FOLDER_PARENT]
GO
ALTER TABLE [dbo].[SYS_SCHEDULED_EXECUTION]  WITH CHECK ADD  CONSTRAINT [SYS_SCHEDULED_EXECUTION_TASK] FOREIGN KEY([TASK_ID])
REFERENCES [dbo].[SYS_SCHEDULED_TASK] ([ID])
GO
ALTER TABLE [dbo].[SYS_SCHEDULED_EXECUTION] CHECK CONSTRAINT [SYS_SCHEDULED_EXECUTION_TASK]
GO
ALTER TABLE [dbo].[SYS_SENDING_ATTACHMENT]  WITH CHECK ADD  CONSTRAINT [FK_SYS_SENDING_ATTACHMENT_CONTENT_FILE] FOREIGN KEY([CONTENT_FILE_ID])
REFERENCES [dbo].[SYS_FILE] ([ID])
GO
ALTER TABLE [dbo].[SYS_SENDING_ATTACHMENT] CHECK CONSTRAINT [FK_SYS_SENDING_ATTACHMENT_CONTENT_FILE]
GO
ALTER TABLE [dbo].[SYS_SENDING_ATTACHMENT]  WITH CHECK ADD  CONSTRAINT [FK_SYS_SENDING_ATTACHMENT_SENDING_MESSAGE] FOREIGN KEY([MESSAGE_ID])
REFERENCES [dbo].[SYS_SENDING_MESSAGE] ([ID])
GO
ALTER TABLE [dbo].[SYS_SENDING_ATTACHMENT] CHECK CONSTRAINT [FK_SYS_SENDING_ATTACHMENT_SENDING_MESSAGE]
GO
ALTER TABLE [dbo].[SYS_SENDING_MESSAGE]  WITH CHECK ADD  CONSTRAINT [FK_SYS_SENDING_MESSAGE_CONTENT_FILE] FOREIGN KEY([CONTENT_TEXT_FILE_ID])
REFERENCES [dbo].[SYS_FILE] ([ID])
GO
ALTER TABLE [dbo].[SYS_SENDING_MESSAGE] CHECK CONSTRAINT [FK_SYS_SENDING_MESSAGE_CONTENT_FILE]
GO
