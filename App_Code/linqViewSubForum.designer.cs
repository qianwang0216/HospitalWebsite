﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34014
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="DataSource")]
public partial class linqViewSubForumDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  #endregion
	
	public linqViewSubForumDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["DataSourceConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public linqViewSubForumDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public linqViewSubForumDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public linqViewSubForumDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public linqViewSubForumDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<View_SubForum> View_SubForum
	{
		get
		{
			return this.GetTable<View_SubForum>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.View_SubForum")]
public partial class View_SubForum
{
	
	private string _forum_style;
	
	private int _id;
	
	private System.Nullable<int> _forumid;
	
	private string _title;
	
	private string _contents;
	
	private System.Nullable<System.DateTime> _dates;
	
	private System.Nullable<int> _first_forum;
	
	private string _FirstName;
	
	private string _LastName;
	
	public View_SubForum()
	{
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_forum_style", DbType="NVarChar(50)")]
	public string forum_style
	{
		get
		{
			return this._forum_style;
		}
		set
		{
			if ((this._forum_style != value))
			{
				this._forum_style = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", DbType="Int NOT NULL")]
	public int id
	{
		get
		{
			return this._id;
		}
		set
		{
			if ((this._id != value))
			{
				this._id = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_forumid", DbType="Int")]
	public System.Nullable<int> forumid
	{
		get
		{
			return this._forumid;
		}
		set
		{
			if ((this._forumid != value))
			{
				this._forumid = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_title", DbType="NVarChar(50)")]
	public string title
	{
		get
		{
			return this._title;
		}
		set
		{
			if ((this._title != value))
			{
				this._title = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_contents", DbType="NVarChar(MAX)")]
	public string contents
	{
		get
		{
			return this._contents;
		}
		set
		{
			if ((this._contents != value))
			{
				this._contents = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_dates", DbType="DateTime")]
	public System.Nullable<System.DateTime> dates
	{
		get
		{
			return this._dates;
		}
		set
		{
			if ((this._dates != value))
			{
				this._dates = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_first_forum", DbType="Int")]
	public System.Nullable<int> first_forum
	{
		get
		{
			return this._first_forum;
		}
		set
		{
			if ((this._first_forum != value))
			{
				this._first_forum = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FirstName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string FirstName
	{
		get
		{
			return this._FirstName;
		}
		set
		{
			if ((this._FirstName != value))
			{
				this._FirstName = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LastName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string LastName
	{
		get
		{
			return this._LastName;
		}
		set
		{
			if ((this._LastName != value))
			{
				this._LastName = value;
			}
		}
	}
}
#pragma warning restore 1591
