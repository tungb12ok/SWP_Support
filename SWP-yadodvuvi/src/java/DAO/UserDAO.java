/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import entities.User;
        
/**
 *
 * @author tungl
 */
public class UserDAO extends MyDAO {

    public User checkAuthentication(String user, String pass) {
        User userObj = null;
        String xSql = "SELECT [UserID], [FullName], [cmnd], [Email], [userName], [Password], [Phone], [UserType], [IsBlocked] FROM [dbo].[Users] WHERE [userName] = ? OR [Email] = ? AND [Password] = ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, user);
            ps.setString(2, user);
            ps.setString(3, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                userObj = new User();
                userObj.setUserID(rs.getInt("UserID"));
                userObj.setFullname(rs.getString("FullName"));
                userObj.setCmnd(rs.getInt("cmnd"));
                userObj.setEmail(rs.getString("Email"));
                userObj.setUserName(rs.getString("userName"));
                userObj.setPassword(rs.getString("Password"));
                userObj.setPhone(rs.getString("Phone"));
                userObj.setUserType(rs.getString("UserType"));
                userObj.setIsBlocked(rs.getBoolean("IsBlocked"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userObj;
    }
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        System.out.println(dao.checkAuthentication("tungb12ok","123"));
    }
}
