// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.johnpurchase.matreq.model;

import com.johnpurchase.matreq.model.Supplier;
import java.lang.String;
import java.util.Set;

privileged aspect MaterialDesc_Roo_JavaBean {
    
    public String MaterialDesc.getName() {
        return this.name;
    }
    
    public void MaterialDesc.setName(String name) {
        this.name = name;
    }
    
    public Set<Supplier> MaterialDesc.getSuppliers() {
        return this.suppliers;
    }
    
    public void MaterialDesc.setSuppliers(Set<Supplier> suppliers) {
        this.suppliers = suppliers;
    }
    
}
