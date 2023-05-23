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

    public boolean registerUser(String fullName, int cmnd, String email, String userName, String password, String phone, String userType, boolean isBlocked) {
        String xSql = "INSERT INTO [dbo].[Users] ([FullName], [cmnd], [Email], [userName], [Password], [Phone], [UserType], [IsBlocked]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, fullName);
            ps.setInt(2, cmnd);
            ps.setString(3, email);
            ps.setString(4, userName);
            ps.setString(5, password);
            ps.setString(6, phone);
            ps.setString(7, userType);
            ps.setBoolean(8, isBlocked);

            int rowsAffected = ps.executeUpdate();

            ps.close();

            if (rowsAffected > 0) {
                return true; // Đăng ký thành công
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false; // Đăng ký thất bại
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        System.out.println(dao.checkAuthentication("tungb12ok", "123"));
    }
}
