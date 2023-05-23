/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Account {
    private int accountId;
    private String userName;
    private String password;
    private String fullName;
    private String email;
    private String cmnd;
    private String telephone;
    
    private int role;

    /**
     *
     */
    public Account() {
    }

    /**
     *
     * @param userName
     * @param password
     * @param fullName
     * @param email
     * @param telephone
     * @param cmnd
     * @param role
     */
    public Account( String userName, String password, String fullName, String email, String telephone, String cmnd,int role) {
        
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.telephone = telephone;
        this.cmnd = cmnd;
        this.role = role;
    }

    /**
     *
     * @param accountId
     * @param userName
     * @param password
     * @param fullName
     * @param email
     * @param telephone
     * @param cmnd
     * @param role
     */
    public Account(int accountId, String userName, String password, String fullName, String email, String telephone,String cmnd,int role) {
        this.accountId = accountId;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.cmnd = cmnd;
        this.telephone = telephone;
        this.role = role;
    }

    /**
     *
     * @return
     */
    public int getAccountId() {
        return accountId;
    }

    /**
     *
     * @param accountId
     */
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    /**
     *
     * @return
     */
    public String getUserName() {
        return userName;
    }

    /**
     *
     * @param userName
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     *
     * @return
     */
    public String getPassword() {
        return password;
    }

    /**
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     *
     * @return
     */
    public String getFullName() {
        return fullName;
    }

    /**
     *
     * @param fullName
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     *
     * @return
     */
    public String getEmail() {
        return email;
    }

    /**
     *
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     *
     * @return
     */
    public String getCmnd() {
        return cmnd;
    }

    /**
     *
     * @param cmnd
     */
    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }

    /**
     *
     * @return
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     *
     * @param telephone
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     *
     * @return
     */
    public int getRole() {
        return role;
    }

    /**
     *
     * @param role
     */
    public void setRole(int role) {
        this.role = role;
    }

    /**
     *
     * @return
     */
    @Override
    public String toString() {
        return "Account{" + "accountId=" + accountId + ", userName=" + userName + ", password=" + password + ", fullName=" + fullName + ", email=" + email + ", cmnd=" + cmnd + ", telephone=" + telephone + ", role=" + role + '}';
    }

    

    
    
    
}
