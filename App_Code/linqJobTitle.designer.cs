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
public partial class linqJobTitleDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertjob_title(job_title instance);
  partial void Updatejob_title(job_title instance);
  partial void Deletejob_title(job_title instance);
  #endregion
	
	public linqJobTitleDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["DataSourceConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public linqJobTitleDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public linqJobTitleDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public linqJobTitleDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public linqJobTitleDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<job_title> job_title
	{
		get
		{
			return this.GetTable<job_title>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.job_title")]
public partial class job_title : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _job_title_id;
	
	private string _job_title_name;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void Onjob_title_idChanging(int value);
    partial void Onjob_title_idChanged();
    partial void Onjob_title_nameChanging(string value);
    partial void Onjob_title_nameChanged();
    #endregion
	
	public job_title()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_job_title_id", DbType="Int NOT NULL", IsPrimaryKey=true)]
	public int job_title_id
	{
		get
		{
			return this._job_title_id;
		}
		set
		{
			if ((this._job_title_id != value))
			{
				this.Onjob_title_idChanging(value);
				this.SendPropertyChanging();
				this._job_title_id = value;
				this.SendPropertyChanged("job_title_id");
				this.Onjob_title_idChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_job_title_name", DbType="NVarChar(50)")]
	public string job_title_name
	{
		get
		{
			return this._job_title_name;
		}
		set
		{
			if ((this._job_title_name != value))
			{
				this.Onjob_title_nameChanging(value);
				this.SendPropertyChanging();
				this._job_title_name = value;
				this.SendPropertyChanged("job_title_name");
				this.Onjob_title_nameChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591