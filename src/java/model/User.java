/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dell
 */

public class User {
    private int id;
    private String fullName;
    private String email;
    private String telephone;
    private String password;
    private String address;
    private Role role;
    private User manager;
    private boolean status;
    private String description;

    public User() {
    }

    public User(int id, String fullName, String Email, String phone, String passWord, String address, Role role, User Manager, boolean Status, String description) {
        this.id = id;
        this.fullName = fullName;
        this.email = Email;
        this.telephone = phone;
        this.password = passWord;
        this.address = address;
        this.role = role;
        this.manager = Manager;
        this.status = Status;
        this.description = description;
    }

    public User(int id, String fullName, String Email, String phone, String address, Role role, User Manager, boolean Status, String description) {
        this.id = id;
        this.fullName = fullName;
        this.email = Email;
        this.telephone = phone;
        this.address = address;
        this.role = role;
        this.manager = Manager;
        this.status = Status;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public User getManager() {
        return manager;
    }

    public void setManager(User manager) {
        this.manager = manager;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
}
