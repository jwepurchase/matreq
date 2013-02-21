// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.johnpurchase.matreq.model;

import com.johnpurchase.matreq.model.MaterialDesc;
import com.johnpurchase.matreq.model.Purchaser;
import com.johnpurchase.matreq.model.QuoteRequest;
import java.util.Date;
import java.util.Set;

privileged aspect MaterialRequest_Roo_JavaBean {
    
    public Date MaterialRequest.getRequestDate() {
        return this.requestDate;
    }
    
    public void MaterialRequest.setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }
    
    public Purchaser MaterialRequest.getRequester() {
        return this.requester;
    }
    
    public void MaterialRequest.setRequester(Purchaser requester) {
        this.requester = requester;
    }
    
    public MaterialDesc MaterialRequest.getMaterial() {
        return this.material;
    }
    
    public void MaterialRequest.setMaterial(MaterialDesc material) {
        this.material = material;
    }
    
    public float MaterialRequest.getUnitCount() {
        return this.unitCount;
    }
    
    public void MaterialRequest.setUnitCount(float unitCount) {
        this.unitCount = unitCount;
    }
    
    public int MaterialRequest.getDaysToDelivery() {
        return this.daysToDelivery;
    }
    
    public void MaterialRequest.setDaysToDelivery(int daysToDelivery) {
        this.daysToDelivery = daysToDelivery;
    }
    
    public Set<QuoteRequest> MaterialRequest.getQuoteRequests() {
        return this.quoteRequests;
    }
    
    public void MaterialRequest.setQuoteRequests(Set<QuoteRequest> quoteRequests) {
        this.quoteRequests = quoteRequests;
    }
    
}
