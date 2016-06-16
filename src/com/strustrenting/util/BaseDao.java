package com.strustrenting.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.strustrenting.table.House;
import com.strustrenting.table.Orders;
import com.strustrenting.table.User;

public interface BaseDao {
	public ArrayList getList(Object obj) throws SQLException;
	public void save (Object obj) throws SQLException;
	public void delete (Object obj) throws SQLException;
	public void update (Object obj) throws SQLException;
	public ResultSet get (long id) throws SQLException;
}
