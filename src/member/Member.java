package member;

import java.sql.*;

public class Member {
    private static Member instance;

    private Member() {}

    public static Member getInstance() {
        if (instance == null) instance = new Member();

        return instance;
    }

    public int loginCheck(String id, String pw) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }

        try {
            String jdbcUrl = "jdbc:mysql://localhost:3306/DBArch";
            String userId = "dbarch";
            String userPass = "dbarch";
            String sql = "SELECT ACCOUNTS.ACC_ID, ACCOUNTS.ACC_PW, EMPLOYEES.DEPT_NO " +
                            "FROM ACCOUNTS NATURAL JOIN EMPLOYEES";

            con = DriverManager.getConnection(jdbcUrl, userId, userPass);
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String accId = rs.getString("ACC_ID");
                String accPw = rs.getString("ACC_PW");

                if (accId.equals(id) && accPw.equals(pw)) {
                    if (rs.getString("DEPT_NO").equals("10")) return 1;
                    else return -1;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqle) {
                    sqle.printStackTrace();
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException sqle) {
                    sqle.printStackTrace();
                }
            }

            if (con != null) {
                try {
                    con.close();
                } catch (SQLException sqle) {
                    sqle.printStackTrace();
                }
            }
        }

        return 0;
    }
}
