package text;

import domian.users;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import untils.JdbcDrui;


public class textuser01 {
    JdbcTemplate jt = new JdbcTemplate(JdbcDrui.getDataSource());

    public users Textuser(users us) {
        try {
            String sql = "select * from user where username=? and password=?";
            users use = jt.queryForObject(sql,
                    new BeanPropertyRowMapper<users>(users.class), us.getUsername()
                    , us.getPassword());
            return use;
        } catch (Exception e) {
            return null;
        }
    }
}
