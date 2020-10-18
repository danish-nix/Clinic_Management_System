/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.bean;

import java.util.Date;

/**
 *
 * @author MSI PL60
 */
public class Patient extends User{
    

    private String email;
    private String name;
    private String sex;
    private String mobile;
    private Date dob;
    private String address;
    private String country;


    public Patient()
    {
        
    }
    
    public Patient( String email, String name, String mobile,Date dob,String sex, String address, String country) {

        this.email = email;
        this.name = name;
        this.mobile = mobile;
        this.dob = dob;
        this.sex = sex;
        this.address = address;
        this.country = country;
    }


    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getMobile() {
        return mobile;
    }
    
    public Date dob()
    {
        return dob;
    }

    public String getAddress() {
        return address;
    }

    public String getCountry() {
        return country;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    
    public void setDate(Date dob){
        this.dob = dob;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    
    
    
    
}
