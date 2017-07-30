package com.ibm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ibm.model.*;

public class AppDao {
	
	
	
	public static String username="alva";
	public static String password="12345";
	public static String url="jdbc:db2://localhost:50000/IBM";
	public static Connection con=null;
	public static PreparedStatement ps=null;
	public static ResultSet rs=null;
	public static ResultSet ds=null;
	
	
	static
	{
		
		try
		{
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			con=DriverManager.getConnection(url,username,password);
			System.out.println("Connection Successfull");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}
	public static String addContactMsg(String sql, ContactMsg obj)
	{
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,obj.getName());
			ps.setString(2,obj.getEmail());
			ps.setString(3,obj.getTel());
			ps.setString(4,obj.getMsg());
			int i=ps.executeUpdate();
			if(i==1)
			{
			    return "success";
			}
			else
			{
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return "fail";
	}
	public static String  InsertCabDetails(String sql, CabModel obj)
	{
		  
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,obj.getCabname());
			ps.setString(2,obj.getCabnumber());
			ps.setString(3,obj.getCabtype());
			ps.setString(4,obj.getNseats());
			ps.setString(5,obj.getCabcolor());
			int i=ps.executeUpdate();
			if(i==1)
			{
			    return "success";
			}
			else
			{
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return "fail";
	}
	
	
	
	public static String  InsertUserDetails(String sql,RegModel obj)
	{
		  
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,obj.getUname());
			ps.setString(2,obj.getPwd());
			ps.setString(3,obj.getEmail());
			ps.setString(4,obj.getDob());
			ps.setString(5,obj.getCity());
			ps.setString(6,obj.getFullname());
			ps.setString(7,obj.getMobno());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
			    return "success";
			}
			else
			{
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return "fail";
	}
	
	public static String  InsertCustDetails(String sql, CustModel obj)
	{
		  
		
		try {
			ps=con.prepareStatement(sql);			
			ps.setString(1,obj.getUname());
			ps.setString(2,obj.getPwd());
			ps.setString(3,obj.getEmail());
			ps.setString(4,obj.getDob());			
			ps.setString(5,obj.getCity());
			ps.setString(6,obj.getFullname());
			ps.setString(7,obj.getMobno());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
			    return "success";
			}
			else
			{
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return "fail";
	}
	
	
	
	public static String ValidateUsers(String sql,RegModel obj)
	{
		
		try
		{
			
			ps=con.prepareStatement(sql);
			ps.setString(1,obj.getUname());
			ps.setString(2,obj.getPwd());
			rs=ps.executeQuery();
			int i=0;
			while(rs.next())
			{
				i++;
			}
			if(i>=1)
			{
				return "success";
			}
			else
			{
				return "fail";
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		return "";
	}
	
	
	public static String ValidateAdmin(String sql, AdminModel obj)
	{
		
		try
		{
			
			ps=con.prepareStatement(sql);
			ps.setString(1,obj.getUsername());
			ps.setString(2,obj.getPassword());
			rs=ps.executeQuery();
			int i=0;
			while(rs.next())
			{
				i++;
			}
			if(i>=1)
			{
				System.out.println("she exists!");
				return "success";
			}
			else
			{
				System.out.println("she no more :(");
				return "fail";
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		return "";
	}
	
	public static ResultSet fetchAllRecords(String sql)
	{
		try
		{
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return rs;
	}
	
	public static ResultSet fetchAllRecordsID(String sql, String id)
	{
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	//
	
	public static ResultSet FetchAllDrecords(String sql)
	{
		try {
			ps=con.prepareStatement(sql);
			ds=ps.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ds;
	}
	public static ResultSet FetchAllDrecordsID(String sql, String id)
	{
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ds=ps.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ds;
	}
	public static ResultSet fetchAllCabs(String sql, String nseats, String city)
	{
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, nseats);
			ps.setString(2, city);
			ds=ps.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ds;
	}
	
	
	
	public static String  InsertDriverDetails(String sql, DriverModel obj)
	{
		  
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,obj.getDname());
			ps.setString(2,obj.getDemail());
			ps.setString(3,obj.getDdob());
			ps.setString(4,obj.getDno());
			ps.setString(5,obj.getDcity());
			ps.setString(6,obj.getStatus());
			int i=ps.executeUpdate();
			if(i==1)
			{
			    return "success";
			}
			else
			{
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return "fail";
	}
	
	public static String InsertBookingDetails(String sql, BookingModel obj)
	{
		  
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,obj.getUname());
			ps.setString(2,obj.getCabid());
			ps.setString(3,obj.getStart());
			ps.setString(4,obj.getEnd());
			ps.setString(5,obj.getDate());
			ps.setString(6,obj.getTime());
			ps.setString(7,obj.getCity());
			int i=ps.executeUpdate();
			if(i==1)
			{
			    return "success";
			}
			else
			{
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return "fail";
	}
	
	public static String updateCabDetails(String cabid, String sql, CabModel obj)
	{
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,obj.getCabname());
			ps.setString(2,obj.getCabnumber());
			ps.setString(3,obj.getCabtype());
			ps.setString(4,obj.getNseats());
			ps.setString(5,obj.getCabcolor());
			ps.setString(6,obj.getStatus());
			ps.setString(7,cabid);
			int i=ps.executeUpdate();
			if(i==1)
			{
			    return "success";
			}
			else
			{
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return "fail";
	}
	
	public static String updateDriverDetails(String did, String sql, DriverModel obj)
	{
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,obj.getDname());
			ps.setString(2,obj.getDemail());
			ps.setString(3,obj.getDdob());
			ps.setString(4,obj.getDno());
			ps.setString(5,obj.getDcity());
			ps.setString(6,obj.getStatus());
			ps.setString(7,did);
			int i=ps.executeUpdate();
			if(i==1)
			{
			    return "success";
			}
			else
			{
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return "fail";
	}

	public static String updateUserDetails(String uid, String sql, CustModel obj)
	{
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,obj.getUname());
			ps.setString(2,obj.getPwd());
			ps.setString(3,obj.getEmail());
			ps.setString(4,obj.getDob());
			ps.setString(5,obj.getCity());
			ps.setString(6,obj.getFullname());
			ps.setString(7,obj.getMobno());
			ps.setString(8,uid);
			int i=ps.executeUpdate();
			if(i==1)
			{
			    return "success";
			}
			else
			{
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return "fail";
	}
	
	public static String deleteCab(String id, String sql)
	{
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,id);
			int i=ps.executeUpdate();
			if(i==1)
			{
			    return "success";
			}
			else
			{
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return "fail";
	}
	
	public static String cabsAvailable(String sql)
	{
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
			    return "success";
			}
			else
			{
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "fail";

	}
	public static void main(String[] args) {
		

	}

}
