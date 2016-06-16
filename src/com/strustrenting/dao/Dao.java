package com.strustrenting.dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;
import com.strustrenting.table.House;
import com.strustrenting.table.Manager;
import com.strustrenting.table.Message;
import com.strustrenting.table.Orders;
import com.strustrenting.table.User;
import com.strustrenting.util.BaseConnection;
import com.strustrenting.util.BaseDao;


public class Dao implements BaseDao {
	
	public static Connection conn = BaseConnection.getConnection();
	@Override
	public ArrayList getList(Object obj)  throws SQLException{
		Class cl = obj.getClass();
		ArrayList list = new ArrayList<>();
		PreparedStatement statement = null;
		ResultSet result = null;
		String sql = "select * from " + cl.getSimpleName();
		Field[] f = cl.getDeclaredFields();
		System.out.println (sql);
		try {
			statement = conn.prepareStatement(sql);
			result = (ResultSet) statement.executeQuery();
			while (result.next()) {
				Object object = cl.newInstance();
				for (int i = 0; i < f.length; i ++) {
					//System.out.println (f[i].getName());
					f[i].setAccessible(true);
					f[i].set(object, result.getObject(f[i].getName()));
				}
				list.add(object);
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println (list);
		return list;
	}

	@Override
	public void save(Object obj)  throws SQLException{
		// TODO Auto-generated method stub
		Class cl = obj.getClass();
		PreparedStatement statement = null;
		StringBuffer sql = new StringBuffer("insert into " + cl.getSimpleName() + " (");
		Field [] field = cl.getDeclaredFields();
		try {
			for (int i = 1; i < field.length; i ++) {
				if ((i + 1) == field.length)
					sql.append(field[i].getName() + ") ");
				else
					sql.append(field[i].getName() + ", ");
			}
			sql.append("values (");
			for (int i = 1; i < field.length; i ++) {
				if ((i + 1) == field.length)
					sql.append(  "? ) ");
				else
					sql.append("?, ");
			}
			System.out.println (sql.toString());
			statement = conn.prepareStatement(sql.toString());
			for (int i = 1; i < field.length; i ++) {
				field[i].setAccessible(true);
				System.out.println (field[i].get(obj));
				statement.setObject(i,field[i].get(obj));
			}
			statement.execute();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println (sql.toString());
	}

	@Override
	public void delete(Object obj)  throws SQLException{
		// TODO Auto-generated method stub
		Class cl = obj.getClass();
		PreparedStatement statement = null;
		Field [] field = cl.getDeclaredFields();
		StringBuffer sql = new StringBuffer("delete from " + cl.getSimpleName() + " where "
				+ field[1].getName() + " = ?");
		System.out.println (sql.toString());
		statement = conn.prepareStatement(sql.toString());
		try {
			field[1].setAccessible(true);
			statement.setObject(1, field[1].get(obj));
			statement.execute();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deleteHouse(Object obj)  throws SQLException{
		// TODO Auto-generated method stub
		Class cl = obj.getClass();
		PreparedStatement statement = null;
		Field [] field = cl.getDeclaredFields();
		StringBuffer sql = new StringBuffer("delete from " + cl.getSimpleName() + " where "
				+ field[0].getName() + " = ?");
		System.out.println (sql.toString());
		statement = conn.prepareStatement(sql.toString());
		try {
			field[0].setAccessible(true);
			statement.setObject(1, field[0].get(obj));
			statement.execute();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void update(Object obj)  throws SQLException{
		// TODO Auto-generated method stub
		Class cl = obj.getClass();
		PreparedStatement statement = null;
		Field []field = cl.getDeclaredFields();
		StringBuffer sql = new StringBuffer("update " + cl.getSimpleName() + " set ");
		for (int i = 2; i < field.length; i ++) {
			if ((i + 1) == field.length)
				sql.append(field[i].getName() + " = ? ");
			else
				sql.append(field[i].getName() + " = ? , ");
		}
		sql.append("where " + field[1].getName() + " = ?");
		
		statement = conn.prepareStatement(sql.toString());
		try {
			for (int i = 2; i < field.length; i ++) {
				field[i].setAccessible(true);
				statement.setObject(i -1 , field[i].get(obj));
			}
			field[1].setAccessible(true);
			statement.setObject(field.length - 1,field[1].get(obj));
			statement.execute();
		
		} catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void updateHouse(Object obj)  throws SQLException{
		// TODO Auto-generated method stub
		Class cl = obj.getClass();
		PreparedStatement statement = null;
		Field []field = cl.getDeclaredFields();
		StringBuffer sql = new StringBuffer("update " + cl.getSimpleName() + " set ");
		for (int i = 1; i < field.length; i ++) {
			if ((i + 1) == field.length)
				sql.append(field[i].getName() + " = ? ");
			else
				sql.append(field[i].getName() + " = ? , ");
		}
		sql.append("where " + field[0].getName() + " = ?");
		
		statement = conn.prepareStatement(sql.toString());
		try {
			for (int i = 1; i < field.length; i ++) {
				field[i].setAccessible(true);
				statement.setObject(i , field[i].get(obj));
			}
			field[0].setAccessible(true);
			statement.setObject(field.length,field[0].get(obj));
			statement.execute();
		
		} catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void updateHouseRent (long house_id, String rentstate) throws SQLException {
		String sql = "update house set rentstate = ? where id = ?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, rentstate);
		statement.setLong(2, house_id);
		statement.execute();
	}
	public void updateRent (long id, String rentstate) throws SQLException {
		String sql = "update orders set state = ? where id = ?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, rentstate);
		statement.setLong(2, id);
		statement.execute();
	}
	@Override
	public ResultSet get(long id)  throws SQLException{
		// TODO Auto-generated method stub
		String sql = "select * from orders, house, user where orders.house_id = house.id "
				+ "and user.id = orders.user_id and user.id = ?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setLong(1, id);
		statement.execute();
		return statement.executeQuery();
	}
	public ResultSet getlandlord (long id)  throws SQLException {
		String sql = "select * from orders, house, user where orders.house_id = house.id "
				+ "and user.id = orders.landlord_id and user.id = ?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setLong(1, id);
		statement.execute();
		return statement.executeQuery();
	}
	public void updatePassword (String newPassword, String username)   throws SQLException{
		String sql = "update user set password = ? where username = ?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, newPassword);
		statement.setString(2, username);
		statement.execute();
	}
	public static void main (String args []) {
		try {
			/*Manager manager = new Manager();
			manager.setId(1);
			manager.setManagername("weimiao");
			manager.setPassword("963205");
			new Dao().update(manager);
			ArrayList<Orders> list = new Dao().getList(new Orders ());
			System.out.println (list);*/
			Dao dao = new Dao();
			ArrayList<Message> list = dao.getList(new Message ());
			System.out.println ("aaaa" + list);
			//System.out.println (list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
