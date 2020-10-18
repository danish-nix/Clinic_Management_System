/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.bean;

/**
 *
 * @author MSI PL60
 */
public class Doctor extends User{
    
    private String email;
    private String name;
    private String mobile;
    private String sex;
    private String address;
    private String country;
    private String speciality;

    public Doctor()
    {
      
    }
    
    public Doctor(String username,String password, String email, String name, String mobile, String sex, String address, String country, String speciality) {
        super();
        this.email = email;
        this.name = name;
        this.mobile = mobile;
        this.sex = sex;
        this.address = address;
        this.country = country;
        this.speciality = speciality;
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

    public String getSex() {
        return sex;
    }

    public String getAddress() {
        return address;
    }

    public String getCountry() {
        return country;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }
    
    
    
    
    
    
    
}
