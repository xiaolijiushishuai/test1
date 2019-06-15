package untils;


import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcDrui {
     private static DataSource da;
    static {
        try {
            Properties pro=new Properties();
            InputStream is = JdbcDrui.class.getClassLoader().getResourceAsStream("druid.properties");
            pro.load(is);
            da = DruidDataSourceFactory.createDataSource(pro);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static DataSource getDataSource(){
        return da;
    }
    public static Connection getConnection(){
        try {
            Connection connection = da.getConnection();
            return connection;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
